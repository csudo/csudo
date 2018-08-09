/****************************************************************************
iRnd NmRndInt iMin, iMax
kRnd NmRndInt kMin, kMax
Returns a random integer number bewteen Min and Max (included).

Returns a random integer number bewteen Min and Max (included).
As the random opcode is used, make sure to set 'seed 0'.
written by joachim heintz

i(k)Min - minimum possible number
i(k)Max - maximum possible number
i(k)Rnd - result
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32

  opcode NmRndInt, i, ii
iMin, iMax xin
iRnd random iMin, iMax+.999999
xout int(iRnd)
  endop

  opcode NmRndInt, k, kk
kMin, kMax xin
kRnd random kMin, kMax+.999999
xout int(kRnd)
  endop

instr nix
puts "i-rate version:", 1
endin  

instr 1
iRnd   NmRndInt     p4, p5
prints    "min = %f, max = %f, result = %f\n", p4, p5, iRnd
endin

instr 2
puts "k-rate version:", 1
kMin random -10, 10
kMax random -10, 10
kRnd NmRndInt kMin, kMax
printks "min = %f, max = %f, result = %f\n", 0, kMin, kMax, kRnd
if timeinstk() == 5 then
 turnoff
endif
endin


</CsInstruments>
<CsScore>
i "nix" 0 0
i 1 .01 0 0 10
i 1 .02 0 -10 0
i 1 .03 0 0 -10
i 1 .04 0 0 0
i 1 .05 0 .6 .7
i 1 .06 0 .6 .7
i 1 .07 0 .6 .7
i 1 .08 0 .6 .7
i 1 .09 0 .5 1
i 1 .1 0 .5 1
i 1 .11 0 .5 1
i 1 .12 0 .5 1
i 1 .13 0 .5 1
i 1 .14 0 .5 1
i 1 .15 0 .5 1
i 2 .2 1
e
</CsScore>
</CsoundSynthesizer>
prints:

i-rate version:
min = 0.000000, max = 10.000000, result = 9.000000
min = -10.000000, max = 0.000000, result = -6.000000
min = 0.000000, max = -10.000000, result = -8.000000
min = 0.000000, max = 0.000000, result = 0.000000
min = 0.600000, max = 0.700000, result = 0.000000
min = 0.600000, max = 0.700000, result = 1.000000
min = 0.600000, max = 0.700000, result = 1.000000
min = 0.600000, max = 0.700000, result = 1.000000
min = 0.500000, max = 1.000000, result = 1.000000
min = 0.500000, max = 1.000000, result = 1.000000
min = 0.500000, max = 1.000000, result = 1.000000
min = 0.500000, max = 1.000000, result = 1.000000
min = 0.500000, max = 1.000000, result = 1.000000
min = 0.500000, max = 1.000000, result = 0.000000
min = 0.500000, max = 1.000000, result = 1.000000
k-rate version:
min = 5.169757, max = -4.687865, result = 2.000000
min = -9.435589, max = 1.215106, result = 1.000000
min = -1.971646, max = 2.158775, result = 2.000000
min = -1.296073, max = 3.642898, result = 3.000000
min = -7.619787, max = 6.449229, result = -0.000000


