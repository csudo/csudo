/****************************************************************************
Snam FilNam Spath
Returns the file name in a given path

Returns the file name (= everything after the last slash) in a given path.
Requires Csound 5.15 or higher.
written by joachim heintz

Spath - full path name as string
Snam - name part
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-m0
</CsOptions>
<CsInstruments>

  opcode FilNam, S, S
;returns the name of a file path
Spath      xin
ipos      strrindex Spath, "/"
Snam      strsub    Spath, ipos+1
          xout      Snam
  endop
  
  instr name
          prints    "Printing name:\n"
Snam      FilNam    "/my/dir/my/file.WAV"
          puts      Snam, 1  
  endin
  
</CsInstruments>
<CsScore>
i "name" 0 0
</CsScore>
</CsoundSynthesizer>

Printing name:
file.WAV


