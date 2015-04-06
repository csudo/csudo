/****************************************************************************
iOutArr[] ArrPermRndNi iInArr[], iN
Returns an array of iN length which contains randomly permuted elements of iInArr[]. 
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.

iInArr[] - input array
iN - desired length of the output array (must not be longer than iInArr)
iOutArr[] - output array with iN randomly permuted elements of iInArr
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32
seed 0

  opcode ArrPermRndNi, i[], i[]i
iInArr[], iN xin
iLen       =          lenarray(iInArr)
;copy input array 
;(for future should be simply possible via iInArrCyp[] = iInArr)
iInArrCpy[] =         iInArr
;create out array and set index
iOutArr[]  init       iN
iIndx      =          0
;for iN elements:
 until iIndx == iN do
 ;get one random element and put it in iOutArr
iRndIndx   random     0, iLen-.0001
iRndIndx   =          int(iRndIndx)
iOutArr[iIndx] =      iInArrCpy[iRndIndx]
 ;shift the elements after this one to the left
  until iRndIndx == iLen-1 do
iInArrCpy[iRndIndx] = iInArrCpy[iRndIndx+1]
iRndIndx   +=         1
  enduntil
 ;reset iLen and increase counter
iLen       -=         1
iIndx      +=         1
 enduntil
           xout       iOutArr
  endop


instr 1
;create array
iArr[]     fillarray  1, 2, 3, 4, 5

;get permuted arrays for n=1..5 and print
iPrmRnd1[] ArrPermRndNi iArr, 1
           prints    "iPrmRnd1 = [%d]\n", iPrmRnd1[0]
iPrmRnd2[] ArrPermRndNi iArr, 2
           prints    "iPrmRnd2 = [%d, %d]\n", iPrmRnd2[0], iPrmRnd2[1]
iPrmRnd3[] ArrPermRndNi iArr, 3
           prints    "iPrmRnd3 = [%d, %d, %d]\n", iPrmRnd3[0], iPrmRnd3[1], iPrmRnd3[2]
iPrmRnd4[] ArrPermRndNi iArr, 4
           prints    "iPrmRnd4 = [%d, %d, %d, %d]\n", iPrmRnd4[0], iPrmRnd4[1], iPrmRnd4[2], iPrmRnd4[3]
iPrmRnd5[] ArrPermRndNi iArr, 5
           prints    "iPrmRnd5 = [%d, %d, %d, %d, %d]\n", iPrmRnd5[0], iPrmRnd5[1], iPrmRnd5[2], iPrmRnd5[3], iPrmRnd5[4]

endin

</CsInstruments>
<CsScore>
r 5
i 1 0 .1
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
