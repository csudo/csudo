/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN strings/pathnames:
*****************************************************************************
FilDir     : Sdir FilDir Spath
FilDirUp   : SUpDir FilDirUp SCurDir
FilNam     : Snam FilNam Spath
FilSuf     : Suf FilSuf Spath [,ilow]
*****************************************************************************
****************************************************************************/

/****************************************************************************
Sdir FilDir Spath
Returns the directory in a given path

Returns the directory part of a given file path string (=everything before the last slash), at i-rate (csound 5.15 or higher).

Spath - full path name as string
Sdir - directory
****************************************************************************/
/****************************************************************************
SUpDir FilDirUp SCurDir
Returns the directory above the current directory

Returns the directory above the current directory.

SCurDir - current directory (with or without an ending slash)
SUpDir - directory above the current directory (returned without an ending slash)
****************************************************************************/
/****************************************************************************
Snam FilNam Spath
Returns the file name in a given path

Returns the file name (= everything after the last slash) in a given path.
Requires Csound 5.15 or higher.

Spath - full path name as string
Snam - name part
****************************************************************************/
/****************************************************************************
Suf FilSuf Spath [,ilow]
Returns the suffix of a filename or path, optional in lower case 

Returns the suffix (extension) of a filename or a full path, optional in lower case.

Spath - full pathname (or filename) as string
ilow - return ensuring lower case (1) or return as in Spath (0 = default)
****************************************************************************/

  opcode FilDir, S, S
;returns the directory of a file path
Spath      xin
ipos      strrindex Spath, "/"
Sdir      strsub    Spath, 0, ipos
          xout      Sdir
  endop

  opcode FilDirUp, S, S
  ;returns the directory above the current directory
SCurDir    xin
;make sure the input does not end with '/'
ilen       strlen     SCurDir
ipos       strrindex  SCurDir, "/"
 if ipos == ilen-1 then
Sok        strsub     SCurDir, 0, ipos
 else	
Sok        strcpy     SCurDir
 endif
ipos       strrindex  Sok, "/"
SUpDir     strsub     Sok, 0, ipos
           xout       SUpDir
  endop

  opcode FilNam, S, S
;returns the name of a file path
Spath      xin
ipos      strrindex Spath, "/"
Snam      strsub    Spath, ipos+1
          xout      Snam
  endop

  opcode FilSuf, S, So
  ;returns the suffix of a filename or path, optional in lower case 
Spath,ilow xin
ipos      strrindex Spath, "."
Suf       strsub    Spath, ipos+1
 if ilow != 0 then
Suf       strlower  Suf 
 endif
          xout      Suf
  endop


