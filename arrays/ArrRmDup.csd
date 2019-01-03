/****************************************************************************
iOutArr[] ArrRmDup iInArr[]
kOutArr[] ArrRmDup kInArr[]
Removes duplicates from an array and returns the result as new array.
Requires the UDO ArrElIn.
written by joachim heintz

i(k)InArr[] - input array (one dimension)
i(k)OutArr[] - output array 
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


opcode ArrRmDup, i[], i[]

 iInArr[] xin
 iOutArr[] init lenarray:i(iInArr)
 iReadIndx = 0
 iWriteIndx = 0
 iCnt = 0
 while iReadIndx < lenarray:i(iInArr) do
  if ArrElIn:i(iInArr[iReadIndx],iOutArr) == 0 then
   iOutArr[iWriteIndx] = iInArr[iReadIndx]
   iWriteIndx += 1
   iCnt += 1
  endif
  iReadIndx += 1
 od
 trim_i iOutArr, iCnt
 xout iOutArr

endop

opcode ArrRmDup, k[], k[]

 kInArr[] xin
 kOutArr[] init lenarray:i(kInArr)
 kReadIndx = 0
 kWriteIndx = 0
 kCnt = 0
 while kReadIndx < lenarray:i(kInArr) do
  if ArrElIn:k(kInArr[kReadIndx],kOutArr) == 0 then
   kOutArr[kWriteIndx] = kInArr[kReadIndx]
   kWriteIndx += 1
   kCnt += 1
  endif
  kReadIndx += 1
 od
 trim kOutArr, kCnt
 xout kOutArr

endop




instr Test

 puts "\ni-VERSION:", 1
 iInArr[] fillarray 2, 1, 3, 1, 2, 4  
 iOutArr[] ArrRmDup iInArr
 prints "lenarray(iOutArr) = %d\n", lenarray:i(iOutArr)
 prints "elements without duplicates:\n"
 printarray iOutArr

 puts "\nk-VERSION:", 1
 kInArr[] fillarray -2, -1, -3, -1, -2, -4  
 kOutArr[] ArrRmDup kInArr
 printks "lenarray(kOutArr) = %d\n", 0, lenarray:k(kOutArr)
 printks "elements without duplicates:\n", 0
 printarray kOutArr
 
 turnoff
   
endin

</CsInstruments>
<CsScore>
i "Test" 0 1
</CsScore>
</CsoundSynthesizer>
returns:

i-VERSION:
lenarray(iOutArr) = 4
elements without duplicates:
  2.0000 1.0000 3.0000 4.0000 

k-VERSION:
lenarray(kOutArr) = 4
elements without duplicates:
  -2.0000 -1.0000 -3.0000 -4.0000 

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
