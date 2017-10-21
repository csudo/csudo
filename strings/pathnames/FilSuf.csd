/****************************************************************************
Suf FilSuf Spath [,ilow]
Returns the suffix of a filename or path, optional in lower case 

Returns the suffix (extension) of a filename or a full path, optional in lower case.
written by joachim heintz

Spath - full pathname (or filename) as string
ilow - return ensuring lower case (1) or return as in Spath (0 = default)
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-m0
</CsOptions>
<CsInstruments>

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

  instr suff
          prints    "Printing suffix:\n"
Suf       FilSuf    "/my/dir/my/file.WAV"
          puts      Suf, 1
Suf       FilSuf    "/my/dir/my/file.WAV", 1
          puts      Suf, 1
  endin
  
</CsInstruments>
<CsScore>
i "suff" 0 0
</CsScore>
</CsoundSynthesizer>

Printing suffix:
WAV
wav

