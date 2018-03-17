/****************************************************************************
SUpDir StrDirUp SCurDir
Returns the directory above the current directory

Returns the directory above the current directory.
written by joachim heintz

SCurDir - current directory (with or without an ending slash)
SUpDir - directory above the current directory (returned without an ending slash)
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-m0
</CsOptions>
<CsInstruments>

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
  
  instr DirUp
SCurDir   pwd     
          puts      SCurDir, 1  
SDirUp    StrDirUp  SCurDir
          puts      SDirUp, 1
  endin
  
</CsInstruments>
<CsScore>
i "DirUp" 0 0
</CsScore>
</CsoundSynthesizer>

returns:
/home/jh/Joachim/Csound/UDO/judo/strings/files
/home/jh/Joachim/Csound/UDO/judo/strings

