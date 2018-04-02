/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN arrays:
*****************************************************************************
ArrElCnt   : kFound ArrElCnt kNeedle, iInArr[]
ArrPermRnd : iOutArr[] ArrPermRnd iInArr[] [, iN]
ArrPermRnd2: iOutArr[] ArrPermRnd2 iInArr[] [, iStart [, iEnd]]
ArrPermRndIndx: kOutArr[] ArrPermRndIndx kInArr[], kN
ArrRmvIndxi: iOutArr[] ArrRmvIndxk iInArr[], iIndx
ArrRmvIndxk: kOutArr[] ArrRmvIndxk kInArr[], kIndx, iLenInArr
ArrRndEl   : iEl ArrRndEl iInArr[] [, iStart [, iEnd]]
ArrSrti_simp: iOutArr[] ArrSrti_simp iInArr[]
ArrSrtk    : kOutArr[] ArrSrtk kInArr[], iOutN [,kOutType ,[kStart [,kEnd [,kHop]]]] 
ArrSrtk_simp: kOutArr[] ArrSrtk_simp kInArr[]
*****************************************************************************
****************************************************************************/

/****************************************************************************
kFound ArrElCnt kNeedle, iInArr[]
Returns a count of instances of kNeedle in iInArray
written by kevin welch

kNeedle - numeric value to search for
iInArr[] - input array to search through
kFound - count of instances found
****************************************************************************/
/****************************************************************************
kFound ArrElCnt kNeedle, kInArr[]
Returns a count of instances of kNeedle in iInArray
written by kevin welch

kNeedle - numeric value to search for
kInArr[] - input array to search through
kFound - count of instances found
****************************************************************************/
/****************************************************************************
iFound ArrElCnt iNeedle, iInArr[]
Returns a count of instances of kNeedle in iInArray
written by kevin welch

iNeedle - numeric value to search for
iInArr[] - input array to search through
iFound - count of instances found
****************************************************************************/
/****************************************************************************
iOutArr[] ArrPermRnd iInArr[] [, iN]
kOutArr[] ArrPermRnd kInArr[] [, kN]
Returns an array of i(k)N length which contains randomly permuted elements of i(k)InArr[]. 
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.
written by joachim heintz

iInArr[] - input array
i(k)N - desired length of the output array (must not be longer than i(k)InArr), default = -1 which means that the whole length of the input array is taken
i(k)OutArr[] - output array with iN randomly permuted elements of iInArr
****************************************************************************/
/****************************************************************************
iOutArr[] ArrPermRnd2 iInArr[] [, iStart [, iEnd]]
kOutArr[] ArrPermRnd2 kInArr[] [, kStart [, kEnd]]
Permutes randomly the elements of i(k)InArr[], from Start to End index (included).
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.
written by joachim heintz

i(k)InArr[] - input array
i(k)Start - first index to change (default = 0)
iEnd - last index to change (default = -1: whole array)
kEnd - last index to change (default = 0.5: whole array)
i(k)OutArr[] - output array with iN randomly permuted elements of iInArr
****************************************************************************/
/****************************************************************************
kOutArr[] ArrPermRndIndx kInArr[], kN
Returns an array of kN length which contains randomly permuted indices of kInArr[]. 
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.
This UDO is similar to ArrPermRndN but returns indices instead of values.
written by joachim heintz

kInArr[] - input array
kN - desired length of the output array (must not be longer than kInArr)
kOutArr[] - output array with kN randomly permuted indices of kInArr
****************************************************************************/
/****************************************************************************
iOutArr[] ArrRmvIndxk iInArr[], iIndx
Removes the element with the index iIndx from iInArr and returns the result as new array.
written by joachim heintz

iInArr[] - input array
iIndx - index to be removed from iInArr
iOutArr[] - output array as copy of iInArr without iIndx
****************************************************************************/
/****************************************************************************
kOutArr[] ArrRmvIndxk kInArr[], kIndx, iLenInArr
Removes the element with the index Kindx from kInArr and returns the result as new array.
written by joachim heintz

kInArr[] - input array
kIndx - index to be removed from kInArr
iLenInArr - length of input array
kOutArr[] - output array as copy of kInArr without kIndx
****************************************************************************/
/****************************************************************************
iEl ArrRndEl iInArr[] [, iStart [, iEnd]]
kEl ArrRndEl kInArr[] [, kStart [, kEnd]]
Returns a random element of an array, or of a part of the array.
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.
written by joachim heintz

i(k)InArr[] - input array
i(k)Start - first index in i(k)InArr to use (default = 0)
iEnd - last index in iInArr to use (default = -1: whole length)
kEnd - last index in kInArr to use (default = 0.5: whole length)
i(k)El - random element of array
****************************************************************************/
/****************************************************************************
iOutArr[] ArrSrti_simp iInArr[]
Sorts the content of iInArr[] and returns the sorted array as iOutArr[].
This is a simple version of ArrSrti.
written by joachim heintz

iInArr[] - array to sort
iOutArr[] - sorted array
****************************************************************************/
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
/****return all elements sorted****/
/****all elements, but sort is indicated as indices****/
/****only the first 6 sorted values are returned****/
/****6 largest values, start=2****/
/****6 largest values, start=2, end=10****/
/****6 largest values, start=2, end=0 (all), hop=2****/
/****************************************************************************
kOutArr[] ArrSrtk_simp kInArr[]
Sorts the content of kInArr[] and returns the sorted array as kOutArr[].
This is a simple version of ArrSrtk.
written by joachim heintz

kInArr[] - array to sort
kOutArr[] - sorted array
****************************************************************************/

opcode ArrElCnt,k,ki[]
  kNeedle, iInArr[] xin
  kLen lenarray iInArr
  kIndx = 0
  kFound = 0
  while (kIndx<kLen) do
    if (kNeedle == iInArr[kIndx]) then
      kFound = kFound+1
    endif
    kIndx = kIndx+1
  od
  xout kFound
endop
opcode ArrElCnt,k,kk[]
  kNeedle, kInArray[] xin
  kLen lenarray kInArray
  kIndx = 0
  kFound = 0
  while (kIndx<kLen) do
    if (kNeedle == kInArray[kIndx]) then
      kFound = kFound+1
    endif
    kIndx = kIndx+1
  od
  xout kFound
endop
opcode ArrElCnt,i,ii[]
  iNeedle, iInArr[] xin
  iLen lenarray iInArr
  iIndex = 0
  iFound = 0
  while (iIndex<iLen) do
    if (iNeedle == iInArr[iIndex]) then
      iFound = iFound+1
    endif
    iIndex = iIndex+1
  od
  xout iFound
endop

  opcode ArrPermRnd, i[], i[]j
iInArr[], iN xin
iLen       =          lenarray(iInArr)
;get output length
iN = (iN == -1) ? iLen : iN
;create out array and set index
iOutArr[]  init       iN
iIndx      =          0
;for iN elements:
 until iIndx == iN do
 ;get one random element and put it in iOutArr
iRndIndx   random     0, iLen-.0001
iRndIndx   =          int(iRndIndx)
iOutArr[iIndx] =      iInArr[iRndIndx]
 ;shift the elements after this one to the left
  until iRndIndx == iLen-1 do
iInArr[iRndIndx] = iInArr[iRndIndx+1]
iRndIndx   +=         1
  enduntil
 ;reset iLen and increase counter
iLen       -=         1
iIndx      +=         1
 enduntil
           xout       iOutArr
  endop
  opcode ArrPermRnd, k[], k[]j
kInArr[], iN xin
iLen       =          lenarray(kInArr)
iN = (iN == -1) ? iLen : iN
kOutArr[]  init       iN
kIndx      =          0
kLen = iLen
;for kN elements:
until kIndx == iN do
 ;get one random element and put it in kOutArr
kRndIndx   random     0, kLen-.0001
kRndIndx   =          int(kRndIndx)
kOutArr[kIndx] =      kInArr[kRndIndx]
 ;shift the elements after this one to the left
 until kRndIndx == kLen-1 do
kInArr[kRndIndx] = kInArr[kRndIndx+1]
kRndIndx   +=         1
 enduntil
 ;reset kLen and increase counter
kLen       -=         1
kIndx      +=         1
enduntil
           xout       kOutArr
  endop

  opcode ArrPermRnd2, i[], i[]oj
iInArr[], iStart, iEnd xin
iLen = lenarray(iInArr)
iEnd = (iEnd == -1) ? iLen-1 : iEnd
;create out array and set index
iOutArr[] = iInArr
iIndx = iStart
iLast = iEnd
;for elements between iStart amd iEnd:
 until iIndx > iLast do
 ;get one random element and put it in iOutArr
iRndIndx random iStart, iEnd+.9999
iRndIndx = int(iRndIndx)
iOutArr[iIndx] = iInArr[iRndIndx]
 ;shift the elements after this one to the left
  until iRndIndx >= iEnd do
iInArr[iRndIndx] = iInArr[iRndIndx+1]
iRndIndx += 1
  od
 ;reset end and increase counter
iIndx += 1
iEnd -= 1
 od
 xout iOutArr
  endop
  opcode ArrPermRnd2, k[], k[]OV
kInArr[], kStart, kEnd xin
kLen lenarray kInArr
kEnd = (kEnd == 0.5) ? kLen-1 : kEnd
;create out array and set index
kOutArr[] = kInArr
kIndx = kStart
kLast = kEnd
 until kIndx > kLast do
 ;get one random element and put it in iOutArr
kRndIndx random kStart, kEnd+.9999
kRndIndx = int(kRndIndx)
kOutArr[kIndx] = kInArr[kRndIndx]
 ;shift the elements after this one to the left
  until kRndIndx >= kEnd do
kInArr[kRndIndx] = kInArr[kRndIndx+1]
kRndIndx += 1
  od
 ;reset end and increase counter
kIndx += 1
kEnd -= 1
 od
 xout kOutArr
  endop

  opcode ArrPermRndIndx, k[], k[]k
kInArr[], kN xin
iLen       lenarray   kInArr
kInd[]     genarray_i  0, iLen-1
kIndCpy[]  =          kInd
kOutArr[]  init       i(kN)
kIndx      =          0
kLen       =          iLen
;for kN elements:
until kIndx == kN do
 ;get one random element and put it in kOutArr
kRndIndx   =          int(random:k(0, kLen-.0001))
kOutArr[kIndx] =      kIndCpy[kRndIndx]
 ;shift the elements after this one to the left
 until kRndIndx == kLen-1 do
kIndCpy[kRndIndx] = kIndCpy[kRndIndx+1]
kRndIndx   +=         1
 od
 ;reset kLen and increase counter
kLen       -=         1
kIndx      +=         1
od

           xout       kOutArr
  endop

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

  opcode ArrRmvIndxk, k[], k[]ki
kInArr[], kIndx, iLenInArr xin
;create kOutArr with one el less than kInArr
kOutArr[]  init       iLenInArr-1
;copy elements from indx=0 to kIndx into kOutArr
kReadIndx  =          0
 until kReadIndx == kIndx do
kOutArr[kReadIndx] =  kInArr[kReadIndx]
kReadIndx += 1
 enduntil
;copy elements from kIndx+1 until the end of kInArr
kReadIndx += 1
 until kReadIndx == lenarray(kInArr) do
kOutArr[kReadIndx-1] = kInArr[kReadIndx]
kReadIndx += 1
 enduntil
           xout       kOutArr
  endop

opcode ArrRndEl, i, i[]oj
 iInArr[], iStart, iEnd xin
 iLen lenarray (iInArr)
 iEnd = (iEnd == -1) ? iLen-1 : iEnd
 iElIndx random iStart, iEnd+0.999
 iEl = iInArr[int(iElIndx)]
 xout iEl
endop
opcode ArrRndEl, k, k[]OV
 kInArr[], kStart, kEnd xin
 kLen lenarray (kInArr)
 kEnd = (kEnd == 0.5) ? kLen-1 : kEnd
 kElIndx random kStart, kEnd+0.999
 kEl = kInArr[int(kElIndx)]
 xout kEl
endop

  opcode ArrSrti_simp, i[], i[]
iInArr[] xin    
iOutArr[]  init       lenarray(iInArr)
iMax       maxarray   iInArr
iIndx      =          0
 until iIndx == lenarray(iInArr) do
iMin, iMinIndx minarray iInArr
iOutArr[iIndx] =      iInArr[iMinIndx]
iInArr[iMinIndx] =    iMax+1
iIndx      +=         1
 enduntil
           xout       iOutArr
  endop

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


