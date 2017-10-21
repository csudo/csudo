/****************************************************************************
kOutArr[] ArrSrtk kInArr[], iOutN [,kOutType ,[kStart [,kEnd [,kHop]]]] 
Sorts the content of kInArr[] and returns the sorted array as kOutArr[] of 
length iOutN.
Depending on kOutType, the output array can either contain the values, or the
indices of the values (thus pointing to kInArr). A section of kInArr can be
specified by kStart and kEnd. Instead of sorting every element, looking only
for the even or odd elements can be done via the kHop parameter.
written by joachim heintz

kInArr[] - array to sort
iOutN - length of the output array kOutArr
kOutType - 0 (default) = output as sorted values, 1 = output as indices
kStart - start from this element (inclusive) (default = 0)
kEnd - end at this element (exclusive) (default = 0 means length of array)
kHop - distance from element to element you are regarding (default = 1)
kOutArr[] - sorted array
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32


  opcode ArrSrtk, k[], k[]iOOOP
  
kArr[], iOutN, kOutType, kStart, kEnd, kHop xin

;calculate some common values 
kLen lenarray kArr
kEnd = kEnd > kLen || kEnd == 0 ? kLen : kEnd

;create the array for the result
kRes[] init iOutN

;fill this array with the smallest number minus 1 of kArr
kIndx = 0
kMin minarray kArr
until kIndx == iOutN do
  kRes[kIndx] = kMin-1
  kIndx += 1
enduntil

;if necessary, create index array
if kOutType != 0 then
  kIndices[] init iOutN
endif

;initialize pointer
kArrPnt = kStart

;loop over the elements of the array
until kArrPnt >= kEnd do
 
  ;loop over kRes
  kResPnt = 0
  until kResPnt == iOutN do
  
    ;if an el in kRes is smaller than the element we are comparing with
    if kRes[kResPnt] < kArr[kArrPnt] then
    
      ;shift the elements right to kResPnt one position to the right
      kShiftPnt = iOutN-1 
      until kShiftPnt == kResPnt do
        kRes[kShiftPnt] = kRes[kShiftPnt-1]
        kShiftPnt -= 1 
      enduntil
      
      ;then put the element we are comparing with at this position
      kRes[kResPnt] = kArr[kArrPnt]

      ;if indices array 
      if kOutType != 0 then
      
        ;shift the elements in kIndices one position to the right
        kShiftPnt = iOutN-1 
        until kShiftPnt == kResPnt do
          kIndices[kShiftPnt] = kIndices[kShiftPnt-1]
          kShiftPnt -= 1
        enduntil

        ;then put in the index
        kIndices[kResPnt] = kArrPnt
      endif
      
      ;and leave the loop
      kgoto Break
      
    endif
    
    ;increase res pointer
    kResPnt += 1
    
  enduntil
  
  Break:
  ;increase array pointer
  kArrPnt += kHop
 
enduntil

;copy array to final result
if kOutType == 0 then
kOut[] = kRes
else
kOut[] = kIndices
endif

xout kOut

 endop
 
 
gkArr[] fillarray 1, 89, 23, -2.3, -100, 0.002, 5, 10.76, 0, 2, 17, 2, -0.123


instr Sorted

 ;print input array
printks "Input array is:\n[", 0
kPrintPnt = 0
until kPrintPnt == lenarray(gkArr) do
 printf "%.3f  ", kPrintPnt+1, gkArr[kPrintPnt]
 kPrintPnt += 1
enduntil
printks "]\n", 0


/****return all elements sorted****/
kRes[] ArrSrtk gkArr, 13

 ;print result
printks "Sort all elements, output = values:\n[", 0
kPrintPnt = 0
until kPrintPnt == lenarray(kRes) do
 printf "%.3f  ", kPrintPnt+1, kRes[kPrintPnt]
 kPrintPnt += 1
enduntil
printks "]\n", 0


/****all elements, but sort is indicated as indices****/
kRes[] ArrSrtk gkArr, 13, 1

 ;print result
printks "Sort all elements, output = indices:\n[", 0
kPrintPnt = 0
until kPrintPnt == lenarray(kRes) do
 printf "%d  ", kPrintPnt+1, kRes[kPrintPnt]
 kPrintPnt += 1
enduntil
printks "]\n", 0


/****only the first 6 sorted values are returned****/
kRes[] ArrSrtk gkArr, 6, 0

 ;print result
printks "Return only the first 6 sorted values:\n[", 0
kPrintPnt = 0
until kPrintPnt == lenarray(kRes) do
 printf "%.3f  ", kPrintPnt+1, kRes[kPrintPnt]
 kPrintPnt += 1
enduntil
printks "]\n", 0


/****6 largest values, start=2****/
kRes[] ArrSrtk gkArr, 6, 0, 2

 ;print result
printks "Return the 6 largest values, start=2:\n[", 0
kPrintPnt = 0
until kPrintPnt == lenarray(kRes) do
 printf "%.3f  ", kPrintPnt+1, kRes[kPrintPnt]
 kPrintPnt += 1
enduntil
printks "]\n", 0


/****6 largest values, start=2, end=10****/
kRes[] ArrSrtk gkArr, 6, 0, 2, 10

 ;print result
printks "Return the 6 largest values, start=2, end=10 (exclusive):\n[", 0
kPrintPnt = 0
until kPrintPnt == lenarray(kRes) do
 printf "%.3f  ", kPrintPnt+1, kRes[kPrintPnt]
 kPrintPnt += 1
enduntil
printks "]\n", 0


/****6 largest values, start=2, end=0 (all), hop=2****/
kRes[] ArrSrtk gkArr, 6, 0, 1, 0, 2

 ;print result
printks "Return the 6 largest values, start=1, end=0(all), hop=2 (= all odd indices):\n[", 0
kPrintPnt = 0
until kPrintPnt == lenarray(kRes) do
 printf "%.3f  ", kPrintPnt+1, kRes[kPrintPnt]
 kPrintPnt += 1
enduntil
printks "]\n", 0


;terminate not to repeat in each k-cycle
turnoff
endin


</CsInstruments>
<CsScore>
i "Sorted" 0 1
</CsScore>
</CsoundSynthesizer>
returns:
Input array is:
[1.000  89.000  23.000  -2.300  -100.000  0.002  5.000  10.760  0.000  2.000  17.000  2.000  -0.123  ]
Sort all elements, output = values:
[89.000  23.000  17.000  10.760  5.000  2.000  2.000  1.000  0.002  0.000  -0.123  -2.300  -100.000  ]
Sort all elements, output = indices:
[1  2  10  7  6  9  11  0  5  8  12  3  4  ]
Return only the first 6 sorted values:
[89.000  23.000  17.000  10.760  5.000  2.000  ]
Return the 6 largest values, start=2:
[23.000  17.000  10.760  5.000  2.000  2.000  ]
Return the 6 largest values, start=2, end=10 (exclusive):
[23.000  10.760  5.000  2.000  0.002  0.000  ]
Return the 6 largest values, start=1, end=0(all), hop=2 (= all odd indices):
[89.000  10.760  2.000  2.000  0.002  -2.300  ]


