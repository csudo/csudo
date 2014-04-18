/****************************************************************************
iOutArr[] ArrRmvIndxk iInArr[], iIndx
Removes the element with the index iIndx from iInArr and returns the result as new array.

iInArr[] - input array
iIndx - index to be removed from iInArr
iOutArr[] - output array as copy of iInArr without iIndx
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32
seed 0

  opcode ArrRmvIndxi, i[], i[]i
iInArr[], iIndx xin
;create iOutArr with one el less than iInArr
iOutArr[]  init       lenarray(iInArr)-1
;copy elements from indx=0 to iIndx into iOutArr
iReadIndx  =          0
 until iReadIndx == iIndx do
iOutArr[iReadIndx] =  iInArr[iReadIndx]
iReadIndx  +=         1
 enduntil
;copy elements from iIndx+1 until the end of iInArr
iReadIndx  +=         1
 until iReadIndx == lenarray(iInArr) do
iOutArr[iReadIndx-1] = iInArr[iReadIndx]
iReadIndx  +=         1
 enduntil
           xout       iOutArr
  endop


instr 1
iArr[]     array      1, 2, 3
iArr1[]    ArrRmvIndxi iArr, 0
           prints    "iArr1 = [%d, %d]\n", iArr1[0], iArr1[1]
iArr2[]    ArrRmvIndxi iArr, 1
           prints    "iArr2 = [%d, %d]\n", iArr2[0], iArr2[1]
iArr3[]    ArrRmvIndxi iArr, 2
           prints    "iArr3 = [%d, %d]\n", iArr3[0], iArr3[1]
endin

</CsInstruments>
<CsScore>
i 1 0 1
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
