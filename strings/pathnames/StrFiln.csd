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


<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>

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
  
instr name
 prints "Printing name:\n"
 Snam StrFiln "/my/dir/my/file.WAV"
 puts Snam, 1  
 prints "Printing name without file extension:\n"
 Snam StrFiln "/my/dir/my/file.WAV", 1
 puts Snam, 1  
endin
  
</CsInstruments>
<CsScore>
i "name" 0 0
</CsScore>
</CsoundSynthesizer>

Printing name:
file.WAV
Printing name without file extension:
file


