/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN strings/pathnames:
*****************************************************************************
StrDir     : Sdir StrDir Spath
StrDirUp   : SUpDir StrDirUp SCurDir
StrFiln    : Snam StrFiln Spath [,iRm]
StrSuf     : Suf StrSuf Spath [,ilow]
*****************************************************************************
****************************************************************************/

/****************************************************************************
Sdir StrDir Spath
Returns the directory in a given path

Returns the directory part of a given file path string (=everything before the last slash), at i-rate (csound 5.15 or higher).
written by joachim heintz

Spath - full path name as string
Sdir - directory
****************************************************************************/
/****************************************************************************
SUpDir StrDirUp SCurDir
Returns the directory above the current directory

Returns the directory above the current directory.
written by joachim heintz

SCurDir - current directory (with or without an ending slash)
SUpDir - directory above the current directory (returned without an ending slash)
****************************************************************************/
/****************************************************************************
Snam StrFiln Spath [,iRm]
Returns the file name in a given path, toptionally without suffix.

Returns the file name (= everything after the last slash) in a given path.
If iRm is not zero, the suffix is removed.
Requires Csound 5.15 or higher.
written by joachim heintz

Spath - full path name as string
iRm - if zero (default) file name is returned as it is, otherwise without suffix
Snam - name part
****************************************************************************/
/****************************************************************************
Suf StrSuf Spath [,ilow]
Returns the suffix of a filename or path, optional in lower case 

Returns the suffix (extension) of a filename or a full path, optional in lower case.
written by joachim heintz

Spath - full pathname (or filename) as string
ilow - return ensuring lower case (1) or return as in Spath (0 = default)
****************************************************************************/

  opcode StrDir, S, S
;returns the directory of a file path
Spath      xin
ipos      strrindex Spath, "/"
Sdir      strsub    Spath, 0, ipos
          xout      Sdir
  endop

  opcode StrDirUp, S, S
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

opcode StrFiln, S, So
 Spath, iRm xin
 ipos strrindex Spath, "/"
 Snam strsub Spath, ipos+1
 if iRm != 0 then
  ipos strindex Snam, "."
  Snam strsub Snam, 0, ipos
 endif
 xout Snam
endop

  opcode StrSuf, S, So
  ;returns the suffix of a filename or path, optional in lower case 
Spath,ilow xin
ipos      strrindex Spath, "."
Suf       strsub    Spath, ipos+1
 if ilow != 0 then
Suf       strlower  Suf 
 endif
          xout      Suf
  endop


