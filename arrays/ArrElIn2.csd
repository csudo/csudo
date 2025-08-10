/****************************************************************************
iRes ArrElIn2 iEl, iArr[]
kRes ArrElIn2 kEl, kArr[]
Looks whether i(k)El is in i(k)Arr or not. 
Returns index of the element if found, otherwise -1.
written by joachim heintz

i(k)El - element to test
i(k)Arr[] - array in which to look for i(k)El
i(k)Res - first element index for yes, -1 for no
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>

<CsInstruments>
ksmps = 32

opcode ArrElIn2, i, ii[]

 iEl, iArr[] xin
 iRes = -1
 indx = 0
 while indx < lenarray:i(iArr) do
  if iEl == iArr[indx] then
   iRes = indx
   igoto end
  endif
  indx += 1
 od
 end:
 xout iRes

endop

opcode ArrElIn2, k, kk[]

 kEl, kArr[] xin
 kRes = -1
 kndx = 0
 while kndx < lenarray:k(kArr) do
  if kEl == kArr[kndx] then
   kRes = kndx
   kgoto end
  endif
  kndx += 1
 od
 end:
 xout kRes

endop



instr Test

 puts "\ni-VERSION:", 1
 iArr[] fillarray 1, 2, 3, 5, -0, 1/10, -.123
 iEls[] fillarray 1, 2, 3, 4, 5, 0, .1, -0.123, -.1234
 indx = 0
 while indx < lenarray(iEls) do
  iRes ArrElIn2 iEls[indx], iArr
  prints "El = %.4f, Res = %d\n", iEls[indx], iRes
  indx += 1
 od

 puts "\nk-VERSION:", 1
 kArr[] fillarray 1, 2, 3, 5, -0, 1/10, -.123
 kEls[] fillarray 1, 2, 3, 4, 5, 0, .1, -0.123, -.1234
 kndx = 0
 while kndx < lenarray(kEls) do
  kRes ArrElIn2 kEls[kndx], kArr
  printf "El = %.4f, Res = %d\n", kndx+1, kEls[kndx], kRes
  kndx += 1
 od

 turnoff 
 
endin

</CsInstruments>
<CsScore>
i "Test" 0 1
</CsScore>
</CsoundSynthesizer>
prints:

i-VERSION:
El = 1.0000, Res = 1
El = 2.0000, Res = 1
El = 3.0000, Res = 1
El = 4.0000, Res = 0
El = 5.0000, Res = 1
El = 0.0000, Res = 1
El = 0.1000, Res = 1
El = -0.1230, Res = 1
El = -0.1234, Res = 0

k-VERSION:
El = 1.0000, Res = 1
El = 2.0000, Res = 1
El = 3.0000, Res = 1
El = 4.0000, Res = 0
El = 5.0000, Res = 1
El = 0.0000, Res = 1
El = 0.1000, Res = 1
El = -0.1230, Res = 1
El = -0.1234, Res = 0


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
