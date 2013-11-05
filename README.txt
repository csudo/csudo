===================================
CSUDO (Csound User Defined Opcodes)
===================================

A collection of Csound User Defined Opcodes (UDOs), with version control. The 
system can be used independently on someone's own computer, or as a clone of the 
public repository. 

A udo definition is embedded in a .csd file which should also contain a working 
example of it, and a short documentation (see below for its format). The .csd 
file can be put anywhere; the folder structure can be regrouped at any time. 

The system creates .udo files from the .csd files which collect both the docs 
and the UDO definitions. These .udo files can then be included in any csound 
code by a statement like
    #include "/my/path/to/blabla.udo"
The user can choose to include either all UDOs in the repository (by the file
csudo.udo in the toplevel directory), or any subcollection of it (for example
print.udo in the csudo/print folder, or print__arrays.udo in the 
csudo/print/arrays folder).
    
If a UDO depends on another UDO, the dependencies are written in the resulting 
.udo file in a proper way, if they are previously declared to the system by 
.setdep files (see below for the way to do this).

Three use cases are now described in detail:
1. The user wants to use any UDO definition or collection (without version
   control).
2. The user wants to clone the public repository (with version control).
3. The user wants to use the system for his/her own UDO collection. 
4. The user wants to add own UDO definitions to the repository.
5. The user wants to look for a previous definition of a UDO, or for a 
   previous state of the whole repository.



============================================================
USE CASE 1: DOWNLOAD ANY UDO DEFINITION (NO VERSION CONTROL)
============================================================

Go to http://sourceforge.net/p/csudo/code/ci/master/tree/. You find the current
collection of all UDO definitions in csudo.udo. You can also browse to any 
folder for subcollections. The .csd files in the folder will contain working 
examples for the UDOs.


=========================================
USE CASE 2: CLONING THE PUBLIC REPOSITORY
=========================================

You need git (http://git-scm.com).

If you clone the repository for the first time:
- Open a terminal window.
- Change (cd) to any place you want to have your local copy of the repository.
- Execute 
    git clone git://git.code.sf.net/p/csudo/code csudo-code

For further updates, change to the csudo-code folder and execute:
    git pull



=========================================================
USE CASE 3: USING THE SYSTEM FOR A PRIVATE UDO COLLECTION
=========================================================

You need git (http://git-scm.com) and python 2.7 (http://python.org).

You can (but need not to) start with the above mentioned repository. The only 
file you need from it, is actually the 'make_udo_files.py' script.

The local UDO repository need not to be a copy of the public repository, but it 
must be named 'csudo'. The file 'make_udo_files.py' must be there, on the
top level.

Working with the system is divided in four steps:
A. Add a .csd file with udo definition, example and documentation.
B. If necessary, declare dependencies of the added udo.
C. Run the 'make_udo_files.py' script to generate the .udo files and to run a 
   test.
D. Add your changes to the git repository.

These steps are now described in detail.


A. ADD A NEW .CSD FILE
======================

A .csd file MUST have the same name as the udo which is defined in it. For 
instance if the udo is called 'MyLove', the .csd file must be called 
'MyLove.csd' (not mylove.csd or anything else). If the name is not identical,
you will get a warning when you run the make_udo_files.py script, and most 
probably an error in sequence.

At the top of the .csd file, you should add a documentation which must be 
enclosed between the /* ... */ signs for a comment. The first line of this 
documentation describes the syntax of the UDO. The remaining is actually up to
the writer; it is requested to follow the scheme of the csound manual:
- short description
- long description
- parameter explanation
- credits
If you do not add a documentation, the script will not complain, but the UDO
will be undocumented.

After the documentation enclosed in the /* ... */ comment, provide a working 
example for the UDO in the .csd file.


B. ADD A .SETDEP FILE
=====================

This step is only necessary when the UDO you define in a .csd file depends on
another UDO. In this case, you must describe this dependency in a .setdep file 
in this way:
    UDO: dependency [, dependency2 [, ...]]
For instance, if the UDO 'ExtrOrc' depends on the UDO 'StripL', you will write:
    ExtrOrc: StripL
    
The dependencies must be set in the lowest directory, along with the .csd file
they are referring to. If there is an already existing .setdep file in this 
directory, add the declaration to it.


C. RUN THE SCRIPT
=================

After having added a .csd file and possibly a .setdep file, run the command 
    python make_udo_files.py
in the toplevel csudo directory. This will generate the different udo 
collections in all subfolders. For instance, if you add a .csd file in 
csudo/strings/conversions, a file strings__conversions.udo  will be generated 
(or changed) in this directory, and also a file strings.udo in the csudo/strings 
folder, and a file csudo.udo in the toplevel csudo directory. All .udo files 
will work seperately, if the internal dependencies are set correctly.

If you have added a UDO definition with an already existing name, the script
will exit.

After having written all .udo files, the script will test them in compiling  
Csound and including the .udo files one after another. The final result is 
written at the end of the script's output.


D. ADD TO GIT
=============

If you are fine with the changes, run
    git add --all (or only add some changes)
    git commit -m "your message"
to add your changes to git's version control system.



===========================================================
USE CASE 4: ADDING UDO DEFINITIONS TO THE PUBLIC REPOSITORY
===========================================================

Essentially the steps are the same as in use case 3, except you need write 
access to the git repository. Start with git pull, add your changes, commit 
your changes as described above, then finally run
    git push
to push your changes to the online repository.



=========================================
USE CASE 5: CHECKING OUT A PREVIOUS STATE
=========================================

The easiest way to check out a previous state of a UDO definition, or of the
whole repository (perhaps any UDO has been deleted on favour of another one but
you need it anyway for an old .csd file), is to go to
    http://sourceforge.net/p/csudo/code/ci/master/tree/
and browse there, using the History button.

If you are familiar with git, you can use all its features to do so.
