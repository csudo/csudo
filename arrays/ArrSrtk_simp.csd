/****************************************************************************
kOutArr[] ArrSrtk_simp kInArr[]
Sorts the content of kInArr[] and returns the sorted array as kOutArr[].
This is a simple version of ArrSrtk.

kInArr[] - array to sort
kOutArr[] - sorted array
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>
ksmps = 32

  opcode ArrSrtk_simp, k[], k[]
kInArr[] xin    
kOutArr[]  =          kInArr
kMax       maxarray   kInArr
kIndx      =          0
 until kIndx == lenarray(kInArr) do
kMin, kMinIndx minarray kInArr
kOutArr[kIndx] =      kInArr[kMinIndx]
kInArr[kMinIndx] =    kMax+1
kIndx      +=         1
 enduntil
           xout       kOutArr
  endop


instr 1
kArr[]     array      1, -4, 19, 3, 2
kMyArr[]   ArrSrtk_simp kArr
kPrint     =          0
until kPrint == lenarray(kArr) do
           printf     "kMyArr[%d] = %d\n", kPrint+1, kPrint, kMyArr[kPrint]
kPrint     +=         1
enduntil
           turnoff
endin


</CsInstruments>
<CsScore>
i 1 0 1
</CsScore>
</CsoundSynthesizer>
returns:
kMyArr[0] = -4
kMyArr[1] = 1
kMyArr[2] = 2
kMyArr[3] = 3
kMyArr[4] = 19
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
