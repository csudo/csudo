/****************************************************************************
iRes ArrElIn iEl, iArr[]
kRes ArrElIn kEl, kArr[]
Looks whether i(k)El is in i(k)Arr or not. Returns 1 if element is found, otherwise 0.
written by joachim heintz

i(k)El - element to test
i(k)Arr[] - array in which to look for i(k)El
i(k)Res - 1 for yes, 0 for no
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>

<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

opcode ArrElIn, i, ii[]

 iEl, iArr[] xin
 iRes = 0
 indx = 0
 while indx < lenarray:i(iArr) do
  if iEl == iArr[indx] then
   iRes = 1
   igoto end
  endif
  indx += 1
 od
 end:
 xout iRes

endop

opcode ArrElIn, k, kk[]

 kEl, kArr[] xin
 kRes = 0
 kndx = 0
 while kndx < lenarray:k(kArr) do
  if kEl == kArr[kndx] then
   kRes = 1
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
  iRes ArrElIn iEls[indx], iArr
  prints "El = %.4f, Res = %d\n", iEls[indx], iRes
  indx += 1
 od

 puts "\nk-VERSION:", 1
 kArr[] fillarray 1, 2, 3, 5, -0, 1/10, -.123
 kEls[] fillarray 1, 2, 3, 4, 5, 0, .1, -0.123, -.1234
 kndx = 0
 while kndx < lenarray(kEls) do
  kRes ArrElIn kEls[kndx], kArr
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
returns:

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
 <x>614</x>
 <y>201</y>
 <width>800</width>
 <height>488</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>tables</objectName>
  <x>100</x>
  <y>156</y>
  <width>80</width>
  <height>30</height>
  <uuid>{2d80f017-f146-40ca-9ad4-d3f51192229a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>1</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>2</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>3</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>4</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>5</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>6</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>7</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>8</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
