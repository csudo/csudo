/****************************************************************************
iOut NmStpInc iValStart, iValEnd, iNumSteps, iThisStep
kOut NmStpInc kValStart, kValEnd, kNumSteps, kThisStep

Step increment

The range between ValStart and ValEnd is divided in a number of steps. The opcode 
returns the proper value for one of these steps.
written by joachim heintz

iValStart (kValStart) - value at start (ThisStep=0)
iValEnd (kValEnd) - value at end (ThisStep=NumSteps)
iNumSteps (kNumSteps) - number of steps between ValStart and ValEnd
iThisStep (kThisStep) - index of this step (starting at zero)
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-ndm0
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

opcode NmStpInc, i, iiii
 iValStart, iValEnd, iNumSteps, iThisStep xin
 iOut = ((iValEnd-iValStart) / iNumSteps) * iThisStep + iValStart
 xout iOut
endop

opcode NmStpInc, k, kkkk
 kValStart, kValEnd, kNumSteps, kThisStep xin
 kOut = ((kValEnd-kValStart) / kNumSteps) * kThisStep + kValStart
 xout kOut
endop



instr 1 

 puts "i-rate example:", 1
 
 ;five points, the first has -10 dB, the last 0 dB
 SPoints[] fillarray "A", "B", "C", "D", "E"

 iDbStart = -10
 iDbEnd = 0
 iNumSteps = 4
 
 iStep init 0

 while iStep < lenarray(SPoints) do
 
  iVal NmStpInc iDbStart, iDbEnd, iNumSteps, iStep
  printf_i "Point = %s, iStep = %d, iVal = %f\n", iStep+1, SPoints[iStep], iStep, iVal
 
  iStep += 1
  
 od
 
 turnoff

endin

instr 2 ;k-rate example

 puts "k-rate example:", 1

 ;seven points, the first has midi note number 69, the last 57
 SPoints[] fillarray "A", "B", "C", "D", "E", "F", "G"

 kPitchStart = 69
 kPitchEnd = 57
 kNumSteps = 6
 
 kStep init 0

 kVal NmStpInc kPitchStart, kPitchEnd, kNumSteps, kStep
 printf "Point = %s, kStep = %d, kVal = %f\n", kStep+1, SPoints[kStep], kStep, kVal
 
 kStep += 1
 
 if kStep > kNumSteps then
  turnoff
 endif

endin


</CsInstruments>
<CsScore>
i 1 0 .1
i 2 .1 .1
</CsScore>
</CsoundSynthesizer>
returns:
i-rate example:
Point = A, iStep = 0, iVal = -10.000000
Point = B, iStep = 1, iVal = -7.500000
Point = C, iStep = 2, iVal = -5.000000
Point = D, iStep = 3, iVal = -2.500000
Point = E, iStep = 4, iVal = 0.000000
k-rate example:
Point = A, kStep = 0, kVal = 69.000000
Point = B, kStep = 1, kVal = 67.000000
Point = C, kStep = 2, kVal = 65.000000
Point = D, kStep = 3, kVal = 63.000000
Point = E, kStep = 4, kVal = 61.000000
Point = F, kStep = 5, kVal = 59.000000

