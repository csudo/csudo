/****************************************************************************
PrtArr1S SArr [,istart [,iend]]
Prints a one-dimensional string array at i-time.

Prints the content of a one-dimensional string array at i-time. 
Requires Csound 6.
written by joachim heintz

SArr - array to be printed
istart - first index to be printed (default = 0)
iend - first index not to be printed. -1 (default) mean the end of the array
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n -m0
</CsOptions>
<CsInstruments>
ksmps = 32

  opcode PrtArr1S, 0, S[]oj
SArr[], istart, iend xin
iend       =          (iend == -1 ? lenarray:i(SArr) : iend)
indx       =          istart
           printf_i   "%s", 1, "["
 until indx >= iend-1 do
           printf_i    "%s, ", 1, SArr[indx]
indx       +=         1
 enduntil
           printf_i   "%s]\n", 1, SArr[indx]
  endop
  

  instr SimplePrinting
SArr1[]    fillarray  "a", "b", "c", "d", "e", "f"
           PrtArr1S   SArr1
SArr2[]    fillarray  "there is", "no", "not any", "time", "at all", "?", "!"
           PrtArr1S   SArr2
           PrtArr1S   SArr2, 2
           PrtArr1S   SArr2, 4, 6
  endin

</CsInstruments>
<CsScore>
i "SimplePrinting" 0 0
</CsScore>
</CsoundSynthesizer>

returns:

[a, b, c, d, e, f]
[there is, no, not any, time, at all, ?, !]
[not any, time, at all, ?, !]
[at all, ?]

