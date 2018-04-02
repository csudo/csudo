/****************************************************************************
iValOut NmScl iVal, iInMin, iInMax, iOutMin, iOutMax
kValOut NmScl kVal, kInMin, kInMax, kOutMin, kOutMax
Scales the incoming value iVal in the range between iInMin and iInMax linear to the range between iOutMin and iOutMax.

Scales the incoming value iVal in the range between iInMin and iInMax linear to the range between iOutMin and iOutMax.
written by joachim heintz

i(k)Val - incoming number
i(k)InMin - minimum possible incoming number
i(k)InMax - maximum possible incoming numer
i(k)OutMin - minimum possible outgoing number
i(k)OutMax - maximum possible outgoing number
i(k)ValOut - iVal scaled
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32

  opcode NmScl, i, iiiii
iVal, iInMin, iInMax, iOutMin, iOutMax xin
iValOut = (((iOutMax - iOutMin) / (iInMax - iInMin)) * (iVal - iInMin)) + iOutMin
xout iValOut
  endop

  opcode NmScl, k, kkkkk
kVal, kInMin, kInMax, kOutMin, kOutMax xin
kValOut = (((kOutMax - kOutMin) / (kInMax - kInMin)) * (kVal - kInMin)) + kOutMin
xout kValOut
  endop
  
instr 1
iRes   NmScl     p4, p5, p6, p7, p8
prints    "Input range = %d..%d\nOutput range = %d..%d\nInput = %d\nOutput = %.3f\n\n", p5, p6, p7, p8, p4, iRes
endin

instr 2
kRand randomi 1, 100, 1, 3
kScale NmScl kRand, 1, 100, 0, 1
printks "kRand = %.f, kScale = %f\n", p3/10, kRand, kScale
endin


</CsInstruments>
<CsScore>
i 1 0 0 1 1 16 0 -10
i 1 0 0 16 1 16 0 -10
i 1 0 0 8 1 16 0 -10
i 1 0 0 3 0 6 0 10
i 2 .1 5
e
</CsScore>
</CsoundSynthesizer>
prints:

Input range = 1..16
Output range = 0..-10
Input = 1
Output = 0.000

Input range = 1..16
Output range = 0..-10
Input = 16
Output = -10.000

Input range = 1..16
Output range = 0..-10
Input = 8
Output = -4.667

Input range = 0..6
Output range = 0..10
Input = 3
Output = 5.000

kRand = 88, kScale = 0.882873
kRand = 59, kScale = 0.586705
kRand = 30, kScale = 0.291744
kRand = 61, kScale = 0.608900
kRand = 93, kScale = 0.925270
kRand = 52, kScale = 0.519906
kRand = 12, kScale = 0.114859
kRand = 7, kScale = 0.060163
kRand = 2, kScale = 0.005686
kRand = 26, kScale = 0.254817

