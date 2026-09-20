/****************************************************************************
iRnd NmRndInt iMin, iMax, iMaxStep, iStart
kRnd NmRndInt kMin, kMax
Returns a random integer number bewteen Min and Max (included).

Random walk in the Min/Max boundaries, with Start as initial position, and
MaxStep as maximum possible step (to positive or negative side). 
If the step hits one boundary, it is "pushed back", e.g. 
0 and 10 as boundaries. position is 0.5, step is -0.8 => result is 0.3,
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
seed(0)

opcode NmRndWlk, i, iiii
  iMin, iMax, iMaxStep, iStart xin
  iStep = random(-iMaxStep,iMaxStep)
  xout mirror:i(iStart+iStep,iMin,iMax)
endop

opcode NmRndWlk, k, kkkk
  kMin, kMax, kMaxStep, kStart xin
  kStep = random(-kMaxStep,kMaxStep)
  xout mirror:k(kStart+kStep,kMin,kMax)
endop


instr 1
  puts "i-rate version:", 1
  start:i = 5
  for i in [1 ... 50] do
    start = NmRndWlk(0,10,1,start)
    print(start)
  od
endin

instr 2
  puts "k-rate version:", 1
  start:k init -2.1
  start = NmRndWlk(-5,-2,1,start)
  printk2(start)
endin


</CsInstruments>
<CsScore>
i 2 0 0.1
e
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


<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>53</r>
  <g>53</g>
  <b>53</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
