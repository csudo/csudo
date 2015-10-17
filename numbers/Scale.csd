/****************************************************************************
iValOut Scale iVal, iInMin, iInMax, iOutMin, iOutMax
Scales the incoming value iVal in the range between iInMin and iInMax linear to the range between iOutMin and iOutMax.

Scales the incoming value iVal in the range between iInMin and iInMax linear to the range between iOutMin and iOutMax.

iVal - incoming number
iInMin - minimum possible incoming number
iInMax - maximum possible incoming numer
iOutMin - minimum possible outgoing number
iOutMax - maximum possible outgoing number
iValOut - iVal scaled
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>

  opcode Scale, i, iiiii
iVal, iInMin, iInMax, iOutMin, iOutMax xin
iValOut = (((iOutMax - iOutMin) / (iInMax - iInMin)) * (iVal - iInMin)) + iOutMin
xout iValOut
  endop

instr 1
iRes   Scale     p4, p5, p6, p7, p8
       prints    "Input range = %d..%d\nOutput range = %d..%d\nInput = %d\nOutput = %.3f\n\n", p5, p6, p7, p8, p4, iRes
endin


</CsInstruments>
<CsScore>
i 1 0 0 1 1 16 0 -10
i 1 0 0 16 1 16 0 -10
i 1 0 0 8 1 16 0 -10
i 1 0 0 3 0 6 0 10
e
</CsScore>
</CsoundSynthesizer>

