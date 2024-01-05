/****************************************************************************
iVal LinTrs iStart, iEnd, iNumSteps, iType, iStep
same as the transeg opcode in Csound

wraps the transeg opcode (with only one segment) as UDO to get only one value
written by joachim heintz

iStart - starting value 
iEnd - target value
iNumSteps - how many steps in total
iType - see the transeg manual page in Csound
iStep - this step (starting from 0 as first step)
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-ndm0
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32

opcode LinTrs, i, iiiii
 iStart, iEnd, iNumSteps, iType, iStep xin
 if iType != 0 then
  iVal = iStart + (iEnd - iStart) * (1 - exp(iStep*iType / (iNumSteps-1))) / (1 - exp(iType))
 else
  iVal = iStart + (iEnd - iStart) * (iStep / (iNumSteps-1))
 endif
 xout iVal
endop

instr 1
 iStart = 2
 iEnd = 1
 iNumSteps = 7
 iType = p4
 prints("iType = %d\n",iType)
 iStep = 0
 while iStep < iNumSteps do
  iVal = LinTrs(iStart,iEnd,iNumSteps,iType,iStep)
  prints(" iStep = %d, iVal = %f\n",iStep,iVal)
  iStep += 1
 od
endin

</CsInstruments>
<CsScore>
i 1 0 0 0
i 1 0 0 -3
i 1 0 0 3
</CsScore>
</CsoundSynthesizer>

prints:
iType = 0
 iStep = 0, iVal = 2.000000
 iStep = 1, iVal = 1.833333
 iStep = 2, iVal = 1.666667
 iStep = 3, iVal = 1.500000
 iStep = 4, iVal = 1.333333
 iStep = 5, iVal = 1.166667
 iStep = 6, iVal = 1.000000
iType = -3
 iStep = 0, iVal = 2.000000
 iStep = 1, iVal = 1.585915
 iStep = 2, iVal = 1.334759
 iStep = 3, iVal = 1.182426
 iStep = 4, iVal = 1.090031
 iStep = 5, iVal = 1.033990
 iStep = 6, iVal = 1.000000
iType = 3
 iStep = 0, iVal = 2.000000
 iStep = 1, iVal = 1.966010
 iStep = 2, iVal = 1.909969
 iStep = 3, iVal = 1.817574
 iStep = 4, iVal = 1.665241
 iStep = 5, iVal = 1.414085
 iStep = 6, iVal = 1.000000
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
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
