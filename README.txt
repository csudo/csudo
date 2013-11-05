===================================
CSUDO (Csound User Defined Opcodes)
===================================

A collection of Csound User Defined Opcodes (UDOs), with version control. The system 
can be used independently on someone's own computer, or as a clone of the 
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



=========================================
USE CASE 1: CLONING THE PUBLIC REPOSITORY
=========================================

you need git (...)

if you clone the repository for the first time:
- open a terminal window.
- cd to any place you want to have your local copy of the repository.
- execute 
    git clone ...

for further clones, use the task:
    git pull ...



=========================================================
USE CASE 2: USING THE SYSTEM FOR A PRIVATE UDO COLLECTION
=========================================================

you need git (...) and python 2.7 (...)

you can (but need not to) start with the above mentioned repository. the only 
file you need from it, is actually the 'make_udo_files.py' script.

the local udo repository need not be a copy of the public repository, but it 
must be named 'csudo'. the file 'make_udo_files.py' must be there, on the
top level.

working with the system is divided in three steps:
A. add a .csd file with udo definition, example and documentation.
B. if necessary, declare dependencies of the added udo.
C. run the 'make_udo_files.py' script to generate the .udo files and to run a test.
D. Add your changes to the git repository.

these steps are now described in detail.


A. ADD A NEW .CSD FILE
======================

a .csd file MUST have the same name as the udo which is defined in it. for 
instance if the udo is called 'MyLove', the .csd file must be called 
'MyLove.csd' (not mylove.csd or anything else). if the name is not identical,
you will get a warning when you run the make_udo_files.py script, and most 
probably an error in sequence.

at the top of the .csd file, you should add a documentation which must be 
enclosed between the /* ... */ signs for a comment. the first line of this 
documentation describes the syntax of the udo. the remaining is actually up to
the writer; it is requested to follow the scheme of the csound manual:
- short description
- long description
- parameter explanation
- credits
if you do not add a documentation, the script will not complain, but the udo
will be undocumented.

after the documentation enclosed in the /* ... */ comment, provide a working 
example for the udo in the .csd file.


B. ADD A .SETDEP FILE
=====================

This step is only necessary when the UDO you define in a .csd file depends on
another UDO. In this case, you must describe this dependency in a .setdep file 
in this way:
    UDO: dependency [, dependency2 [, ...]]
For instance, if the UDO 'ExtrOrc' depends on the UDO 'StripL', you write:
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
csudo/strings/conversions, a file strings_conversions.udo  will be generated 
(or changed) in this directory, and also a file strings.udo in the csudo/strings 
folder, and a file csudo.udo in the toplevel csudo directory. All .udo files 
will work seperately, if the internal dependencies are set correctly.

If you have added a UDO definition with an already existing name, the script
will exit.

After having written all .udo files, the script will test them in compiling them 
in Csound. The final result is written at the end of the script's output.


D. ADD TO GIT
=============

If you are fine with the changes, run
    git add --all (or only add some changes)
    git commit -m "your message"
to add your changes to git's version control system.



===========================================================
USE CASE 3: ADDING UDO DEFINITIONS TO THE PUBLIC REPOSITORY
===========================================================

Essentially the steps are the same as in use case 2, except you need write 
access to the git repository. Start with git pull, add your changes, commit 
your changes as described above, then finally run
    git push
to push your changes to the online repository.
