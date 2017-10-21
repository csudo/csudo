<CsoundSynthesizer>
<CsOptions>
-ndm0
</CsOptions>
<CsInstruments>

/****************************************************************************
Sout StrAgrm Sin [,iLen]
Changes the order of the characters in Sin randomly, like in an anagram.

Changes the order of the characters in Sin randomly, like in an anagram, and returns the result as new string.
written by joachim heintz

Sin - input string 
iLen - length of Sin. If -1 (default), the length is calculated internally. 
Sout - output string
****************************************************************************/


  opcode StrAgrm, S, Sj
Sin, iLen  xin
 if iLen == -1 then
iLen       strlen     Sin
 endif
Sout       =          ""
;for all elements in Sin
iCnt       =          0
iRange     =          iLen
loop:
;get one randomly
iRnd       rnd31      iRange-.0001, 0
iRnd       =          int(abs(iRnd))
Sel        strsub     Sin, iRnd, iRnd+1
Sout       strcat     Sout, Sel
;take it out from Sin
Ssub1      strsub     Sin, 0, iRnd
Ssub2      strsub     Sin, iRnd+1
Sin        strcat     Ssub1, Ssub2
;adapt range (new length)
iRange     =          iRange-1
           loop_lt    iCnt, 1, iLen, loop
           xout       Sout
  endop

  instr 1
Sana       StrAgrm    "abcdefghi", 9
           puts       Sana, 1
  endin
</CsInstruments>
<CsScore>
i 1 0 0
i 1 0 0
i 1 0 0
i 1 0 0
i 1 0 0
</CsScore>
</CsoundSynthesizer>

