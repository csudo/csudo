# generates .udo files from the .csd files containing udo definitions
# just run this file in python (2.7) from the top csudo directory
# see the README.txt for the format of the .csd files
# and for declaring the dependencies in .setdep files
# at the end, all .udo files are tested for errors when run by csound

# 2015/04/06 problem if the dependencies are complicated 
# (like in StrExpr, which is also used in StrayNumToFt)
# if udo one depends on two which itself depends on three
# it would be desirable to write in the .setdep file:
# one: two
# and not care about the second dependency. but for bringing this to work,
# the way dependencies are resolved in formatCollect2 is to be rewritten.
# for now, try to name the dependencies all (as i did in strays.setdep) and
# in a good order.



############################################
#### ENTER YOUR CSOUND6 EXECUTABLE HERE ####
############################################
csound6 = 'csound'
############################################
############################################

from os import listdir, getcwd, remove, system
from os.path import isdir, abspath, basename

def udoDefStart(line):
    if line.split()[0] == 'opcode':
        return 1
    else:
        return 0

def udoDefEnd(line):
    if line.split()[0] == 'endop':
        return 1
    else:
        return 0

def notEmpty(line):
    if line.strip() != '':
        return 1
    else:
        return 0

def commentStart(line):
    if line.lstrip()[0:2] == '/*':
        return 1
    else:
        return 0

def commentEnd(line):
    if line.rstrip()[-2:] == '*/':
        return 1
    else:
        return 0

def isCsd(string):
    if string.rstrip()[-4:] == '.csd':
        return 1
    else:
        return 0

def isUdo(string):
    if string.rstrip()[-4:] == '.udo':
        return 1
    else:
        return 0

def isFileUdo(line, filename):
    """returns 1 if the line 
    opcode TbDmp etc 
    is inside the file TbDmp.csd"""
    if line.split()[1].rstrip(',') == filename[:-4]:
        return 1
    else:
        return 0

def dirAfterCsudo(d):
    """
    '/home/jh/Joachim/Csound/UDO/csudo/tables/print' returns 
    'tables/print'"""
    pos = d.rfind('csudo') + 6
    return d[pos:]

def slashToUnder(str):
    return str.replace('/', '__')

def extractTCU(fileobj, filename):
    """returns a tuple with (title, comment, udo definition)"""
    title = ''
    comment = ''
    udodef = ''
    readTitle = 0
    readComment = 0
    commentNumber = 0
    readUdoDef = 0
    hasBeenNone = 1
    for line in fileobj:
    # extract title
        if notEmpty(line):
            if readTitle and commentNumber == 1:
                title = line
                readTitle = 0
            if commentStart(line):
                readTitle = 1
                readComment = 1
                commentNumber = commentNumber + 1
    # extract comment
            if commentEnd(line):
                comment = '%s%s' % (comment, line)
                readComment = 0
    # extract udo definition
            if udoDefStart(line) and isFileUdo(line, filename):
                readUdoDef = 1
                hasBeenNone = 0 
            elif udoDefEnd(line) and readUdoDef:
                udodef = '%s%s' % (udodef, line)
                readUdoDef = 0
        if readComment:
            comment = '%s%s' % (comment, line)
        elif readUdoDef:
            udodef = '%s%s' % (udodef, line)
    if hasBeenNone:
        print '*WARNING: There is no UDO named %s in file %s.' % (filename, filename)
    return (title, comment, udodef)

def listTCU(resList, dir):
    """appends all titles, comments and udo definitions in one directory as (udoname, titles, comments, udo_defs) to the resList"""
    files = sorted(listdir(dir), key=str.lower)
    for filename in files:
        if isCsd(filename):
            file = '%s/%s' % (dir, filename)
            file = open(file)
            all = extractTCU(file, filename)
            udoname = filename[:-4]
            resList.append([udoname, all[0], all[1], all[2]])
    return resList

def getUdoDef(udoName, allUdoList):
    """gets the definition of udoName from the allUdoList"""
    alleNamen = [x[0] for x in allUdoList]
    for i in range(len(alleNamen)):
        if alleNamen[i] == udoName:
            return allUdoList[i][3]

def formatCollect2(drct, lists, allUdoList, deplis):
    """creates in the directory drct a file dir_in_csudo.udo in which the definitions 
    of all sub-directories of drct are being collected. takes care of the dependencies 
    and inserts them in the udodef section.
    lists is the list of all in drct existing udos.
    allUdoList is the list of all udos.
    deplis is the list of the dependencies in drct"""
    # look for all elements in listDir whether they are in deplis
    depnamen = [x[0] for x in deplis]
    alleudonamen = [x[0] for x in allUdoList]
    udonamen = [x[0] for x in lists]
    # create a list of [posInUdoNamen, udoNoetig*] 
    addnamen = []
    # for all registered dependencies
    for i in range(len(depnamen)):
        # position (index) as first element 
        addnamenneu = [udonamen.index(depnamen[i])]
        # get a list with the names of all dependencies and append
        addnamenneu.append(deplis[i][1:])
        addnamen.append(addnamenneu)
    # sort addnamen as this is needed for next step
    # NOTE: this is not enought for complicate dependencies!
    addnamen.sort()
    # insert the new udo names to be added in udonamen
    udoNamenExtended = []
    for i in range(len(udonamen)):
        if len(addnamen) > 0 and i == addnamen[0][0]:
            for add in addnamen[0][1:]:
                udoNamenExtended.extend(add)
            if len(addnamen[0][1:][0]) > 1: dependence = "dependencies" 
            else: dependence =  "dependency"
            print "      *including %s as %s for '%s' in %s" % (addnamen[0][1:][0], dependence, udonamen[i], drct)
            udoNamenExtended.append(udonamen[i])
            del addnamen[0]
        else: 
            udoNamenExtended.append(udonamen[i])
    # udoNamenExtended now shows all dependencies before the respective opcode, as name
    # leave now only the first occurence of a name
    udoNamenFinal = []
    for name in udoNamenExtended:
        if name not in udoNamenFinal: udoNamenFinal.append(name)
    # and write the udodefs new accordingly
    udodeflis = []
    for udo in udoNamenFinal:
        udodeflis.append("%s\n" % getUdoDef(udo, allUdoList))
    udodefs = ''.join(udodeflis)
    # sort titles and comments alphabetically
    titCommSorted = sorted(lists, key=lambda udo: udo[0])
    titles = ''.join([('%-11s: %s' % (x[0], x[1])) for x in titCommSorted])
    comments = ''.join([x[2] for x in titCommSorted])
    name = dirAfterCsudo(drct)
    if name is '': name = 'csudo'
    pfad = '%s/%s.udo' % (drct, slashToUnder(name))
    print '*writing udo file %s' % pfad
    outfil = open(pfad, 'w')
    # title
    outfil.write('/%s\n%s\nUDO DEFINITIONS IN %s:\n%s\n' % ('*'*76, '*'*77, name, '*'*77))
    # overview
    outfil.write('%s%s\n%s/\n\n'  % (titles, '*'*77, '*'*76))
    # comments
    outfil.write('%s\n'  % comments)
    # udo definitions
    outfil.write('%s\n'  % udodefs)

def listDir(resList, drct):
    """eine liste mit unterlisten fuer alle in dir vorhandenen udos"""
    subdirs = sorted(listdir(drct), key=str.lower)
    end = 1 #no further sub directories
    for fd in subdirs:
        if not fd[0] == '.' and not fd[0] == '_': #no hidden files/folders or starting with _
            new = '%s/%s' % (drct, fd)
            if isdir(new):
                end = 0
                resList = listDir(resList, new)
    if end:
        resList = listTCU(resList, drct)
    return resList

def readDepFil(fileobj):
    """reads the file with the dependencies and returns a list in which each sublist
    has at first position the udo name, and at the remaining positions the udo which it needs"""
    reslist = []
    for line in fileobj:
        if notEmpty(line) and line.lstrip()[0] != '#':
            line = line.replace('\n', '')
            line = line.replace(':', ',')
            liste = line.split(',')
            liste = [x.strip() for x in liste]
            reslist.append(liste)
    return reslist

def remSubStrings(stringlis):
    """removes the strings from the stringlis which are completely contained
    in one of the other strings"""
    reslis = []
    for string in stringlis:
        count = 0
        for i in range(len(stringlis)):
            if string in stringlis[i]: count = count+1
        if count == 1: reslis.append(string)
    return reslis

def lastDirs(dct, reslist=[]):
    """lists the lowest directories in a tree, as full pathnames"""
    subdirs = sorted(listdir(dct), key=str.lower)
    for fd in subdirs:
        if not fd[0] == '.' and not fd[0] == '_': #keine versteckten dateien/ordner
            new = '%s/%s' % (dct, fd)
            if isdir(new):
                reslist.append(new)
                lastDirs(new, reslist)
    return remSubStrings(reslist)

def firstDirs(dct, reslist=[]):
    """lists the highest directories in a tree, as full pathnames"""
    subdirs = sorted(listdir(dct), key=str.lower)
    for fd in subdirs:
        if not fd[0] == '.' and not fd[0] == '_': #keine versteckten dateien/ordner
            new = '%s/%s' % (dct, fd)
            if isdir(new):
                reslist.append(new)
    return reslist

def isDepFile(string):
    if string.rstrip()[-4:] == '.dep':
        return 1
    else:
        return 0

def isSetDepFile(string):
    if string.rstrip()[-7:] == '.setdep':
        return 1
    else:
        return 0

def writeDepFile(liste):
    """writes a file with udo dependencies. the inputlist has structure [target path, [udo dep]*]"""
    dir = liste[0].rpartition('/')[2]
    path = '%s/%s.dep' % (liste[0], dir)
    print "*writing dep file %s" % path
    f = open(path, 'w')
    f.write('# internal dependencies in %s.udo\n# UDO: dependency [, dependency2 [, ...]]\n\n' % dir)
    for i in range(1, len(liste)):
        f.write('%s: %s\n' % (liste[i][0], ','.join(liste[i][1:])))

# writeDepFile(['/home/jh/Joachim/Csound/UDO/csudo/strings', ['StrExpr2', ' StrExpr1'], ['Quatsch', ' Mit', ' Sosze'], ['Aber', ' Heftig']])

def collectDeps(wd):
    """collects the .dep files from down to top; so writing in the respective 
    top dir a collection of all information in the lower dirs"""
    # get the lowest dirs
    lasts = lastDirs(wd)
    # do not go into the dirs which are direct unter the working dir, because the wd get an own .dep file 
    lastdirs = []
    for i in lasts:
        if i.rpartition('/')[0] != wd: lastdirs.append(i)
    # get the dep lists in these dirs
    writelists = []
    for d in lastdirs:
        files = sorted(listdir(d), key=str.lower)
        deplis = []
        writelis = []
        hasdepfil = 0 #whether .setdep file is in dir
        for fil in files:
            path = '%s/%s' % (d, fil)
            if isSetDepFile(path):
                print '   *reading dep file %s' % path
                fileobj = open(path, 'r')
                newdeps = readDepFil(fileobj)
                deplis.extend(newdeps)
                hasdepfil = 1
        # target to write is one dir higher
        if hasdepfil:
            writedir = path.rpartition('/')[0].rpartition('/')[0]
            writelis.append(writedir)
            #list with writedir as first element, and the deplists following
            writelis.extend(deplis)
            writelists.append(writelis)
    # join the lists which have the same first element
    erglis = [writelists[0]]
    erglisindx = 1
    for i in range(1, len(writelists)):
        if writelists[i][0] == writelists[i-1][0]:
            erglis[i-1].extend(writelists[i][1:])
        else:
            erglis.append(writelists[i])
            erglisindx = erglisindx+1
    # write for each of these lists a .dep file
    for l in erglis: writeDepFile(l)
    # search in all dirs below the working dir for .dep or .setdep files,
    # extract definitions and write a .dep file on the top level
    dirs = firstDirs(wd)
    wlis = [wd]
    for d in dirs:
        files = sorted(listdir(d), key=str.lower)
        for fil in files:
            path = '%s/%s' % (d, fil)
            if isDepFile(path) or isSetDepFile(path):
                print '   *reading dep file %s' % path
                fileobj = open(path, 'r')
                newdeps = readDepFil(fileobj)
                wlis.extend(newdeps)
    writeDepFile(wlis)
    # return collection of dependencies
    return wlis[1:]

def remAllDepFiles(d):
    """removes all .dep files in d and all subdirs"""
    subs = listdir(d)
    for s in subs:
        path = '%s/%s' % (d, s)
        if isdir(path): remAllDepFiles(path)
        elif isDepFile(path): 
            print "*removing dep file %s" % path
            remove(path)

def testForDuplicates(lis):
    for i in range(len(lis)):
        if lis[i] in lis[i+1:]:
            print "ERROR! UDO '%s' defined twice!\n" % lis[i]
            exit()

def makeAll(drct, allUdoList=[], isTopDir=1):
    """reads and writes the dependencies and the udo collections"""
    # a list with all udo defs (sublists with name, syntax, comment, definition)
    lists = listDir([], drct)
    # test on duplicate names
    testForDuplicates([x[0] for x in lists])
    # only in top dir
    if isTopDir == 1: 
        # remove all .dep files (only the original .setdep remaining)
        remAllDepFiles(drct)
        # collect dependencies (write .dep files on every level) 
        collectDeps(drct)
        # keep this collection of all udos as variable
        allUdoList = lists
    # read the dependencies on this level of the folder/dir
    files = listdir(drct)
    for fil in files:
        path = '%s/%s' % (drct, fil)
        if isDepFile(path) or isSetDepFile(path):
            print '   *reading dep file %s' % path
            fileobj = open(path, 'r')
            deps = readDepFil(fileobj)
            break
        else: deps = []
    # write regarding the dependencies
    formatCollect2(drct, lists, allUdoList, deps)
    # recursion if the elements in dir are dirs as well
    subdirs = sorted(listdir(drct), key=str.lower)
    for fd in subdirs:
        if not fd[0] == '.' and not fd[0] == '_':
            new = '%s/%s' % (drct, fd)
            if isdir(new):
                makeAll(new, allUdoList, 0)

def testUdo(udo):
    """tests one udo file via execution by csound"""
    csdtext = """
<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>
#include "%s"
instr 1
endin
</CsInstruments>
<CsScore>
i 1 0 0
</CsScore>
</CsoundSynthesizer>
""" % udo
    csd = '/tmp/test.csd'
    outfil = open(csd, 'w')
    outfil.write(csdtext)
    outfil.close()
    print "*Testing file %s ..." % udo
    if system('%s %s 2> /dev/null' % (csound6, csd)) == 0:
        print "... ok"
        return 0
    else:
        print "\n********\n... ERROR!!!\n********\n"
        print "*This is Csound's output message:"
        print "Return value = %d" % system('%s %s 2> /dev/null' % (csound6, csd))
        system('%s %s' % (csound6, csd))
        return 1
    

def testAll(d, sum=0):
    """tests all .udo files which has been generated whether they can be executed by csound without errors"""
    subs = sorted(listdir(d), key=str.lower)
    for s in subs:
        path = '%s/%s' % (d, s) 
        if isdir(path): sum = testAll(path, sum)
        elif isUdo(path): sum = testUdo(path) + sum
    return sum

def goGo(csudoDir):
    """go go"""
    print '\n%s\n*****WRITING UDO FILES*****\n%s\n' % ('*'*27, '*'*27)
    makeAll(csudoDir)
    print '\n%s\n*****TESTING UDO FILES*****\n%s\n' % ('*'*27, '*'*27)
    errors = testAll(csudoDir)
    print '\nTesting finished.\nFound %d errors in total.' % errors

            
# write udo files on all levels for all folders in the script dir
csudoDir = getcwd() 
if basename(csudoDir) != 'csudo':
    print 'Current directory "%s" does not end with "csudo".' % csudoDir
    print 'Really containing the UDO definitions?'
    go = input('1 = go on, 0 = break\n')
    if go == 1: goGo(csudoDir)
    else: exit()
else: goGo(csudoDir)



