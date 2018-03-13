/****************************************************************************
iSum StrSum Sin
Returns the sum of all ASCII values in Sin
written by Hlödver Sigurdsson and joachim heintz

Sin - input string
iSum - sum of all ASCII numbers for the elements in Sin
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32

  opcode StrSum, i, S
Sin xin 
iPos, iSum init 0
while iPos < strlen(Sin) do
 iSum+= strchar(Sin, iPos)
 iPos += 1
od
   xout iSum
  endop

instr Bla
 print StrSum("Bla"), StrSum("bla"), StrSum(" "), StrSum("")
endin

</CsInstruments>
<CsScore>
i "Bla" 0 0
</CsScore>
</CsoundSynthesizer>
returns:
instr 1:  #i0 = 271.000  #i1 = 303.000  #i2 = 32.000  #i3 = 0.000


