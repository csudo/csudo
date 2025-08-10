CSUDO (Csound User Defined Opcodes)
===================================

A collection of Csound User Defined Opcodes (UDOs), with version control. 

A udo definition is embedded in a *.csd* file which should also contain a working
example of it, and a short documentation (see below for its format). 

The system creates *.udo* files from the *.csd* files which collect both the docs
and the UDO definitions. These *.udo* files can then be included in any csound
code by a statement like

`    #include "/my/path/to/blabla.udo"`

The user can choose to include either all UDOs in the repository (by the file
*csudo.udo* in the toplevel directory), or any subcollection of it (for example
*array.udo* in the *csudo/arrays* folder).
    
If a UDO depends on another UDO, the dependencies are written in the resulting
*.udo* file in a proper way, if they are previously declared to the system by
*.setdep* files.

## Adding own UDO definitions

### 1. Add a new .csd file

The *.csd* file MUST have the same name as the UDO which is defined in it. For
instance if the udo is called `MyLove`, the *.csd* file must be called
*MyLove.csd* (not *mylove.csd* or anything else). If the name is not identical,
you will get a warning when you run the *make_udo_files.py* script, and most
probably an error in sequence.

At the top of the *.csd* file, you should add a documentation which must be
enclosed between the `/* ... */` signs for a comment. The first line of this
documentation describes the syntax of the UDO. The remaining is actually up to
the writer; it is recommended to follow the scheme of the csound manual:  
- short description  
- long description  
- parameter explanation  
- credits  
If you do not add a documentation, the script will not complain, but the UDO
will be undocumented.

After the documentation enclosed in the `/* ... */` comment, provide a working
example for the UDO in the *.csd* file.

### 2. Add a .setdep file

This step is only necessary when the UDO you define in a *.csd* file depends on
another UDO. In this case, you must describe this dependency in a *.setdep* file
in this way:

`    UDO: dependency [, dependency2 [, ...]]`

For instance, if the UDO 'ExtrOrc' depends on the UDO 'StripL', you will write:

`    ExtrOrc: StripL`
    
The dependencies must be set in the lowest directory, along with the *.csd* file
they are referring to. If there is an already existing *.setdep* file in this
directory, add the declaration to it.


### 3. Run the script

After having added a *.csd* file and possibly a *.setdep* file, run the command

`    python make_udo_files.py`

in the toplevel directory. This will generate the different UDO
collections in all subfolders. For instance, if you add a *.csd* file in
*csudo/strings/conversions*, a file *strings__conversions.udo* will be generated
(or changed) in this directory, and also a file *strings.udo* in the *csudo/strings*
folder, and a file *csudo.udo* in the toplevel csudo directory. All *.udo* files
will work seperately, if the internal dependencies are set correctly.

If you have added a UDO definition with an already existing name, the script
will exit.

After having written all *.udo* files, the script will test them in calling
Csound. The final result is written at the end of the script's output.
