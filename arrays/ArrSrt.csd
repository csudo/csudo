/****************************************************************************
iOutArr[] ArrSrt iInArr[] [,iOutN [,iOutType ,[iStart [,iEnd [,iHop]]]]]
kOutArr[] ArrSrt kInArr[] [,iOutN [,kOutType ,[kStart [,kEnd [,kHop]]]]]

Sorts the content of kInArr[] in descending order and returns 
the sorted array as i|kOutArr[] of length iOutN.

Depending on kOutType, the output array can either contain the values, or the
indices of the values (thus pointing to kInArr). A section of kInArr can be
specified by kStart and kEnd. Instead of sorting every element, looking only
for the even or odd elements can be done via the kHop parameter. 

For simple sorting (ascending or descending), use the Csound opcodes sorta and sortd.
written by joachim heintz

i|kInArr[] - array to sort
iOutN - length of the output array kOutArr (default = -1 means the whole length)
i|kOutType - 0 (default) = output as sorted values, 1 = output as indices
i|kStart - start from this element (inclusive) (default = 0)
i|kEnd - end at this element (exclusive) (default = 0 means length of array)
i|kHop - distance from element to element you are regarding (default = 1)
i|kOutArr[] - sorted array (containing either values or indices)
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32

//k-rate version
opcode ArrSrt, k[], k[]jOOOP
 kArr[], iOutN, kOutType, kStart, kEnd, kHop xin
 ;calculate some common values 
 kLen lenarray kArr
 kEnd = kEnd > kLen || kEnd == 0 ? kLen : kEnd
 ;create the array for the result
 iOutN = (iOutN == -1) ? lenarray:i(kArr) : iOutN
 kRes[] init iOutN
 ;fill this array with the smallest number minus 1 of kArr
 kIndx = 0
 kMin minarray kArr
 while kIndx < iOutN do
  kRes[kIndx] = kMin-1
  kIndx += 1
 od
 ;if necessary, create index array
 if kOutType != 0 then
  kIndices[] init iOutN
 endif
 ;initialize pointer
 kArrPnt = kStart 
 ;loop over the elements of the array
 while kArrPnt < kEnd do
  ;loop over kRes
  kResPnt = 0
  while kResPnt < iOutN do
   ;if an el in kRes is smaller than the element we are comparing with
   if kRes[kResPnt] < kArr[kArrPnt] then
    ;shift the elements right to kResPnt one position to the right
    kShiftPnt = iOutN-1 
    while kShiftPnt > kResPnt do
     kRes[kShiftPnt] = kRes[kShiftPnt-1]
     kShiftPnt -= 1 
    od
    ;then put the element we are comparing with at this position
    kRes[kResPnt] = kArr[kArrPnt]
    ;if indices array 
    if kOutType != 0 then
     ;shift the elements in kIndices one position to the right
     kShiftPnt = iOutN-1 
     while kShiftPnt > kResPnt do
      kIndices[kShiftPnt] = kIndices[kShiftPnt-1]
      kShiftPnt -= 1
     od
     ;then put in the index
     kIndices[kResPnt] = kArrPnt
    endif
    ;and leave the loop
    kgoto Break 
   endif
   ;increase res pointer
   kResPnt += 1
  od  
  Break:
  ;increase array pointer
  kArrPnt += kHop
 od
 ;copy array to final result
 if kOutType == 0 then
 kOut[] = kRes
 else
 kOut[] = kIndices
 endif
 xout kOut
endop

//i-rate version
opcode ArrSrt, i[], i[]jooop
 iArr[], iOutN, iOutType, iStart, iEnd, iHop xin
 iLen lenarray iArr
 iEnd = iEnd > iLen || iEnd == 0 ? iLen : iEnd
 iOutN = (iOutN == -1) ? lenarray(iArr) : iOutN
 iRes[] init iOutN
 iIndx = 0
 iMin minarray iArr
 while iIndx < iOutN do
  iRes[iIndx] = iMin-1
  iIndx += 1
 od
 if iOutType != 0 then
  iIndices[] init iOutN
 endif
 iArrPnt = iStart 
 while iArrPnt < iEnd do
  iResPnt = 0
  while iResPnt < iOutN do
   if iRes[iResPnt] < iArr[iArrPnt] then
    iShiftPnt = iOutN-1 
    while iShiftPnt > iResPnt do
     iRes[iShiftPnt] = iRes[iShiftPnt-1]
     iShiftPnt -= 1 
    od
    iRes[iResPnt] = iArr[iArrPnt]
    if iOutType != 0 then
     iShiftPnt = iOutN-1 
     while iShiftPnt > iResPnt do
      iIndices[iShiftPnt] = iIndices[iShiftPnt-1]
      iShiftPnt -= 1
     od
     iIndices[iResPnt] = iArrPnt
    endif
    igoto Break 
   endif
   iResPnt += 1
  od  
  Break:
  iArrPnt += iHop
 od
 if iOutType == 0 then
 iOut[] = iRes
 else
 iOut[] = iIndices
 endif
 xout iOut
endop


giArr[] fillarray 1, 89, 23, -2.3, -100, 0.002, 5, 10.76, 0, 2, 17, 2, -0.123
gkArr[] fillarray 1, 89, 23, -2.3, -100, 0.002, 5, 10.76, 0, 2, 17, 2, -0.123


instr Sorted_i

 prints "\n  **i-rate version**\n"

 //input array
 printarray giArr, "%.3f", "Input array is:"

 //all elements sorted
 iRes[] ArrSrt giArr
 printarray iRes, "%.3f", "Sort all elements, output = values:"

 //all elements, but sort is indicated as indices
 iRes[] ArrSrt giArr, 13, 1
 printarray iRes, "%.0f", "Sort all elements, output = indices:"

 //only the first 6 sorted values are returned
 iRes[] ArrSrt giArr, 6, 0
 printarray iRes, "%.3f", "Return only the first 6 sorted values:"


 //6 largest values, start=2
 iRes[] ArrSrt giArr, 6, 0, 2
 printarray iRes, "%.3f", "Return the 6 largest values, start=2:"


 //6 largest values, start=2, end=10
 iRes[] ArrSrt giArr, 6, 0, 2, 10
 printarray iRes, "%.3f", "Return the 6 largest values, start=2, end=10 (exclusive):"


 //6 largest values, start=2, end=0 (all), hop=2
 iRes[] ArrSrt giArr, 6, 0, 1, 0, 2
 printarray iRes, "%.3f", "Return the 6 largest values, start=1, end=0(all), hop=2 (= all odd indices):"

endin

instr Sorted_k

 prints "\n  **k-rate version**\n"

 //input array
 printarray gkArr, 1, "%.3f", "Input array is:"

 //all elements sorted
 kRes[] ArrSrt gkArr
 printarray kRes, 1, "%.3f", "Sort all elements, output = values:"

 //all elements, but sort is indicated as indices
 kRes[] ArrSrt gkArr, 13, 1
 printarray kRes, 1, "%.0f", "Sort all elements, output = indices:"

 //only the first 6 sorted values are returned
 kRes[] ArrSrt gkArr, 6, 0
 printarray kRes, 1, "%.3f", "Return only the first 6 sorted values:"


 //6 largest values, start=2
 kRes[] ArrSrt gkArr, 6, 0, 2
 printarray kRes, 1, "%.3f", "Return the 6 largest values, start=2:"


 //6 largest values, start=2, end=10
 kRes[] ArrSrt gkArr, 6, 0, 2, 10
 printarray kRes, 1, "%.3f", "Return the 6 largest values, start=2, end=10 (exclusive):"


 //6 largest values, start=2, end=0 (all), hop=2
 kRes[] ArrSrt gkArr, 6, 0, 1, 0, 2
 printarray kRes, 1, "%.3f", "Return the 6 largest values, start=1, end=0(all), hop=2 (= all odd indices):"

 turnoff
endin


</CsInstruments>
<CsScore>
i "Sorted_i" 0 0
i "Sorted_k" .1 .1
</CsScore>
</CsoundSynthesizer>
prints:

  **i-rate version**
Input array is:
 1.000 89.000 23.000 -2.300 -100.000 0.002 5.000 10.760 0.000 2.000 17.000 2.000 -0.123
Sort all elements, output = values:
 89.000 23.000 17.000 10.760 5.000 2.000 2.000 1.000 0.002 0.000 -0.123 -2.300 -100.000
Sort all elements, output = indices:
 1 2 10 7 6 9 11 0 5 8 12 3 4 
Return only the first 6 sorted values:
 89.000 23.000 17.000 10.760 5.000 2.000 
Return the 6 largest values, start=2:
 23.000 17.000 10.760 5.000 2.000 2.000 
Return the 6 largest values, start=2, end=10 (exclusive):
 23.000 10.760 5.000 2.000 0.002 0.000 
Return the 6 largest values, start=1, end=0(all), hop=2 (= all odd indices):
 89.000 10.760 2.000 2.000 0.002 -2.300 

  **k-rate version**
Input array is:
 1.000 89.000 23.000 -2.300 -100.000 0.002 5.000 10.760 0.000 2.000 17.000 2.000 -0.123
Sort all elements, output = values:
 89.000 23.000 17.000 10.760 5.000 2.000 2.000 1.000 0.002 0.000 -0.123 -2.300 -100.000
Sort all elements, output = indices:
 1 2 10 7 6 9 11 0 5 8 12 3 4 
Return only the first 6 sorted values:
 89.000 23.000 17.000 10.760 5.000 2.000 
Return the 6 largest values, start=2:
 23.000 17.000 10.760 5.000 2.000 2.000 
Return the 6 largest values, start=2, end=10 (exclusive):
 23.000 10.760 5.000 2.000 0.002 0.000 
Return the 6 largest values, start=1, end=0(all), hop=2 (= all odd indices):
 89.000 10.760 2.000 2.000 0.002 -2.300 
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
