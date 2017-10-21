/****************************************************************************
Sdir FilDir Spath
Returns the directory in a given path

Returns the directory part of a given file path string (=everything before the last slash), at i-rate (csound 5.15 or higher).
written by joachim heintz

Spath - full path name as string
Sdir - directory
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-m0
</CsOptions>
<CsInstruments>
  
  opcode FilDir, S, S
;returns the directory of a file path
Spath      xin
ipos      strrindex Spath, "/"
Sdir      strsub    Spath, 0, ipos
          xout      Sdir
  endop
  
  instr dir
          prints    "Printing directory:\n"
Sdir      FilDir    "/my/dir/my/file.WAV"
          puts      Sdir, 1  
  endin
  
</CsInstruments>
<CsScore>
i "dir" 0 0
</CsScore>
</CsoundSynthesizer>

Printing directory:
/my/dir/my


