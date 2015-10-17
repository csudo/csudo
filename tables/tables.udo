/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN tables:
*****************************************************************************
TbMem      : ipos TbMem ival, ift [, indxstrt [, indxend]]
TbPeak     : iPeak TbPeak ift [, indxstrt [, indxend]]
TbPrmRnd   : TbPrmRnd ift
TbPrmRndk  : TbPrmRndk ift, ktrig
TbRmDp     : iend TbRmDp iftsrc, iftdst [, ioffset [, inumels]]
TbToLin    : kLin TbToLin iFt
TbToSF     : TbToSF ift, Soutname, ktrig [,iformat [,istart [,iend]]]
*****************************************************************************
****************************************************************************/

/****************************************************************************
ipos TbMem ival, ift [, indxstrt [, indxend]]
Looks whether a number is in a function table

Looks whether a number is a member of a function table, in a range between indxstart (included) and indxend (excluded). Returns the position of the element if found, or -1 otherwise.

ival - element (number) to be looked for
ift - function table
indxstart - starting index in ift to look for ival (default=0)
indxend - position after the last index which is tested (default = -1 = length of the table). if a number is given for indxend which exceeds the length of the function table, an error occurs
ipos - if ival has been found in ift, the position of the first occurence is returned, or -1, if ival has not been found
****************************************************************************/
/****************************************************************************
iPeak TbPeak ift [, indxstrt [, indxend]]
Returns the peak (highest absolute number) value of a function table.

Returns the peak value of a function table, or a part of it, in a range between indxstart (included, defaults to zero) and indxend (excluded, defaults to table length). The return value is always positive.

ift - function table
indxstart - starting index in ift to look for ival (default=0)
indxend - position after the last index which is tested (default = -1 = length of the table). if a number is given for indxend which exceeds the length of the function table, it will stop at table end
iPeak - peak value as absolute number
****************************************************************************/
/****************************************************************************
TbPrmRnd ift
Permutes the values of a function table randomly, at i-time

Permutes the values of ift randomly and overwrites this table with the result. See TbPrmRndk for the k-rate version

ift: function table to be permuted
****************************************************************************/
/****************************************************************************
TbPrmRndk ift, ktrig
Permutes the values of a function table randomly, at k-time

Permutes the values of ift randomly and overwrites this table with the result. This operation is performed once a k-cycle, as long as a trigger is positive. See TbPrmRnd for the i-rate version

ift - function table to be permuted
ktrig - if > 0, the permutation is performed once a k-cycle
****************************************************************************/
/****************************************************************************
iend TbRmDp iftsrc, iftdst [, ioffset [, inumels]]
Removes duplicates from a function table

Removes duplicates from a function table, copies the elements in a new table, and returns the end position (which can be used to build a table with just these elements).
Requires the UDO TbMem

iftsrc - source function table
iftdst - table (usually with the same length as iftsrc) for copying the non-duplicated elements of iftsrc
ioffset - index to start copying of elements in iftsrc
inumels - number of elements to investigate
iend - position after the last index which has been written in iftdest
****************************************************************************/
/****************************************************************************
kLin TbToLin iFt
Reads a table in the same way as a linseg opcode

Reads a table which contains segments of value - duration - value in the same way as a linseg opcocde would do.

iFt - a function table, usually generated with GEN02 and not normaized
kLin - k-rate output
****************************************************************************/
/****************************************************************************
TbToSF ift, Soutname, ktrig [,iformat [,istart [,iend]]]
Writes the content of a table to a soundfile

Writes the content of a table to a soundfile, with optional start and end point

ift - function table to write
Soutname - output file name in double quotes
iformat - output file format according to the fout manual page. if not specified or -1, the file is written with a wav header and 24 bit
istart - start in seconds in the function table to write (default=0)
iend - last point to write in the function table in seconds (default=-1: until the end)
ktrig - if 1, the file is being written in one control-cycle. Make sure the trigger is 1 just for one k-cycle; otherwise the writing operation will be repeated again and again in each control cycle
****************************************************************************/

  opcode TbToSF, 0, iSkjoj
ift, Soutname, ktrig, iformat, istart, iend xin; start (default = 0) and end (default = last sample) in seconds
istrtsmps =         istart*sr; start to write in samples 
iendsmps  =         (iend == -1 ? ftlen(ift) : iend*sr); end to write in samples
 if iformat == -1 then
iformat   =         18; default: wav 24 bit (for other options see fout manual page)
 endif
 if ktrig == 1 then; make sure that trigger sends "1" just for one k-cycle
kcnt      init      istrtsmps; set the counter to 0 at start
loop:
kcnt      =         kcnt+ksmps; next value (e.g. 10 if ksmps=10)
andx      interp    kcnt-1; build audio index (e.g. from 0 to 9)
asig      tab       andx, ift; read the table values as audio signal
          fout      Soutname, iformat, asig; write asig to a file
 if kcnt <= iendsmps-ksmps kgoto loop; go back as long there is something to do
 endif 
  endop

  opcode TbPrmRnd, 0, i
ift xin
itablen    =          ftlen(ift)
icopy      ftgentmp   0, 0, -itablen, -2, 0
           tableicopy  icopy, ift
ileng      =          itablen
indxerg    =          0
loop:
irand      random     0, ileng - .0001
index      =          int(irand)
ival       tab_i      index, icopy
           tabw_i     ival, indxerg, ift
lshift:
if (index == ileng-1) igoto next
indxneu    =          index
indxalt    =          indxneu+1
ivalalt    tab_i      indxalt, icopy
           tabw_i     ivalalt, indxneu, icopy
index      =          index + 1
           igoto      lshift
next:
ileng      =          ileng - 1
indxerg    =          indxerg + 1
if (ileng > 0) igoto loop
  endop

  opcode TbPrmRndk, 0, ik
;changes the contents of ift each time ktrig is positive
ift, ktrig xin
itablen    =          ftlen(ift)
icopy      ftgentmp   0, 0, -itablen, -2, 0
if ktrig > 0 then
           tablecopy  icopy, ift
kleng      =          itablen
kndxerg    =          0
loop:
krand      random     0, kleng - .0001
kndex      =          int(krand)
kval       tab        kndex, icopy
           tabw       kval, kndxerg, ift
lshift:
if (kndex == kleng-1) kgoto next
kndxneu    =          kndex
kndxalt    =          kndxneu+1
kvalalt    tab        kndxalt, icopy
           tabw       kvalalt, kndxneu, icopy
kndex      =          kndex + 1
           kgoto      lshift
next:
kleng      =          kleng - 1
kndxerg    =          kndxerg + 1
if (kleng > 0) kgoto loop
endif
  endop

  opcode TbMem, i, iioj
ival, ift, indxstrt, indxend xin
indxend   =         (indxend == -1 ? ftlen(ift) : indxend)
ipos      =         -1
loop:
iftel     tab_i     indxstrt, ift
  if iftel == ival then
ipos      =         indxstrt
          igoto     end  
  endif
          loop_lt   indxstrt, 1, indxend, loop
end:      xout      ipos
  endop

  opcode TbRmDp, i, iioj
iftsrc, iftdst, ioffset, inumels xin
;copy first element
ifirst    tab_i     ioffset, iftsrc
          tabw_i    ifirst, 0, iftdst
;calculate border in iftsrc
iftlen    tableng   iftsrc
ireadend  =         (inumels == -1 || ioffset+inumels > iftlen ? iftlen : inumels+ioffset)
;compare each element with all already written in iftdst
;and add to iftdst if not already there
ireadindx =         ioffset+1
iwritindx =         1
loop:
iel       tab_i     ireadindx, iftsrc
itest     TbMem     iel, iftdst, 0, iwritindx
 if itest == -1 then
          tabw_i    iel, iwritindx, iftdst
iwritindx =         iwritindx + 1
 endif
          loop_lt   ireadindx, 1, ireadend, loop
          xout      iwritindx
  endop

  opcode TbPeak, i, ioj
ift, indxstrt, indxend xin
indxend   =         (indxend == -1 ? ftlen(ift) : indxend)
iPeak     =         0
while indxstrt < indxend do
  iVal = abs(table:i(indxstrt, ift))
  iPeak = iVal > iPeak ? iVal : iPeak
  indxstrt += 1
od
     xout      iPeak
  endop

  opcode TbToLin, k, i
ift        xin
iftlen     tableng    ift
indx1      =          0
indx2      =          1
indx3      =          2
segment:
if indx3 >= iftlen igoto end
iStart     table      indx1, ift
iDur       table      indx2, ift
iTarget    table      indx3, ift
           timout     0, iDur, do
           reinit     segment
do:
kOut       linseg     iStart, iDur, iTarget
indx1      =          indx1+2
indx2      =          indx2+2
indx3      =          indx3+2
end:
           xout       kOut
  endop


