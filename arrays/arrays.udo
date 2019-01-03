/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN arrays:
*****************************************************************************
ArrCat     : iOutArr[] ArrCat iArr1[], iArr2[]
ArrElCnt   : kFound ArrElCnt kNeedle, iInArr[]
ArrElIn    : iRes ArrElIn iEl, iArr[]
ArrPermRnd : iOutArr[] ArrPermRnd iInArr[] [, iN]
ArrPermRnd2: iOutArr[] ArrPermRnd2 iInArr[] [, iStart [, iEnd]]
ArrPermRndIndx: iOutArr[] ArrPermRndIndx iInArr[] [, iN]
ArrRmDup   : iOutArr[] ArrRmDup iInArr[]
ArrRmIndx  : iOutArr[] ArrRmIndx iInArr[], iIndx
ArrRndEl   : iEl ArrRndEl iInArr[] [, iStart [, iEnd]]
ArrSrt     : kOutArr[] ArrSrtk kInArr[] [,iOutN [,kOutType ,[kStart [,kEnd [,kHop]]]]]
*****************************************************************************
****************************************************************************/

/****************************************************************************
iOutArr[] ArrCat iArr1[], iArr2[]
kOutArr[] ArrCat kArr1[], kArr2[]
Concatenates two arrays and returns the result as new array.
written by joachim heintz

i(k)Arr1[], i(k)Arr2[] - input arrays (one dimension)
i(k)OutArr[] - output array 
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
iRes ArrElIn iEl, iArr[]
kRes ArrElIn kEl, kArr[]
Looks whether i(k)El is in i(k)Arr or not. Returns 1 if element is found, otherwise 0.
written by joachim heintz

i(k)El - element to test
i(k)Arr[] - array in which to look for i(k)El
i(k)Res - 1 for yes, 0 for no
****************************************************************************/
/****************************************************************************
iOutArr[] ArrPermRnd iInArr[] [, iN]
kOutArr[] ArrPermRnd kInArr[] [, iN]
Returns an array of i(k)N length which contains randomly permuted elements of i(k)InArr[]. 
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.
written by joachim heintz

i(k)InArr[] - input array
iN - desired length of the output array (must not be longer than i(k)InArr), default = -1 which means that the whole length of the input array is taken
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
iOutArr[] ArrPermRndIndx iInArr[] [, iN]
kOutArr[] ArrPermRndIndx kInArr[] [, iN]
Returns an array of kN length which contains randomly permuted indices of kInArr[]. 
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.
This UDO is similar to ArrPermRnd but returns indices instead of values.
written by joachim heintz

i(k)InArr[] - input array
iN - desired length of the output array (must not be longer than i(k)InArr), default = -1 which means that the whole length of the input array is taken
i(k)OutArr[] - output array with kN randomly permuted indices of kInArr
****************************************************************************/
/****************************************************************************
iOutArr[] ArrRmDup iInArr[]
kOutArr[] ArrRmDup kInArr[]
Removes duplicates from an array and returns the result as new array.
Requires the UDO ArrElIn.
written by joachim heintz

i(k)InArr[] - input array (one dimension)
i(k)OutArr[] - output array 
****************************************************************************/
/****************************************************************************
iOutArr[] ArrRmIndx iInArr[], iIndx
kOutArr[] ArrRmIndx kInArr[], kIndx
Removes the element with the index i(k)Indx from i(k)InArr and returns the result as new array.
written by joachim heintz

i(k)InArr[] - input array
i(k)Indx - index to be removed from i(k)InArr
i(k)OutArr[] - output array as copy of i(k)InArr without i(k)Indx
****************************************************************************/
/****************************************************************************
iEl ArrRndEl iInArr[] [, iStart [, iEnd]]
kEl ArrRndEl kInArr[] [, kStart [, kEnd]]
SEl ArrRndEl SInArr[] [, iStart [, iEnd]]
Returns a random element of an array, or of a part of the array.
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.
written by joachim heintz

i(kS)InArr[] - input array
i(k)Start - first index in i(kS)InArr to use (default = 0)
iEnd - last index in i(S)InArr to use (default = -1: whole length)
kEnd - last index in kInArr to use (default = 0.5: whole length)
i(kS)El - random element of array
****************************************************************************/
/****************************************************************************
kOutArr[] ArrSrtk kInArr[] [,iOutN [,kOutType ,[kStart [,kEnd [,kHop]]]]]
Sorts the content of kInArr[] in descending order and returns the sorted array 
as kOutArr[] of length iOutN.
Depending on kOutType, the output array can either contain the values, or the
indices of the values (thus pointing to kInArr). A section of kInArr can be
specified by kStart and kEnd. Instead of sorting every element, looking only
for the even or odd elements can be done via the kHop parameter.
For simple sorting (ascending or descending), use the Csound opcodes sorta and sortd.
written by joachim heintz

kInArr[] - array to sort
iOutN - length of the output array kOutArr (default = -1 means the whole length)
kOutType - 0 (default) = output as sorted values, 1 = output as indices
kStart - start from this element (inclusive) (default = 0)
kEnd - end at this element (exclusive) (default = 0 means length of array)
kHop - distance from element to element you are regarding (default = 1)
kOutArr[] - sorted array
****************************************************************************/

opcode ArrCat, i[], i[]i[]

 iArr1[], iArr2[] xin
 iLenOutArr = lenarray(iArr1) + lenarray(iArr2)
 iOutArr[] init iLenOutArr
 indx = 0
 while indx < lenarray(iArr1) do
  iOutArr[indx] = iArr1[indx]
  indx += 1
 od
 while indx < iLenOutArr do
  iOutArr[indx] = iArr2[indx-lenarray(iArr1)]
  indx += 1
 od
 xout iOutArr

endop
opcode ArrCat, k[], k[]k[]

 kArr1[], kArr2[] xin
 iLenOutArr = lenarray:i(kArr1) + lenarray:i(kArr2)
 kOutArr[] init iLenOutArr
 kndx = 0
 while kndx < lenarray(kArr1) do
  kOutArr[kndx] = kArr1[kndx]
  kndx += 1
 od
 while kndx < iLenOutArr do
  kOutArr[kndx] = kArr2[kndx-lenarray(kArr1)]
  kndx += 1
 od
 xout kOutArr

endop

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

  opcode ArrPermRndIndx, i[], i[]j
iInArr[], iN xin
iLen       lenarray   iInArr
iN = (iN == -1) ? iLen : iN
iInd[]     genarray   0, iLen-1
iIndCpy[]  =          iInd
iOutArr[]  init       iN
iIndx      =          0
until iIndx == iN do
 iRndIndx   =          int(random:i(0, iLen-.0001))
 iOutArr[iIndx] =      iIndCpy[iRndIndx]
 until iRndIndx == iLen-1 do
  iIndCpy[iRndIndx] = iIndCpy[iRndIndx+1]
  iRndIndx   +=         1
 od
 iLen       -=         1
 iIndx      +=         1
od

           xout       iOutArr
  endop
  opcode ArrPermRndIndx, k[], k[]j
kInArr[], iN xin
iLen       lenarray   kInArr
iN = (iN == -1) ? iLen : iN
kInd[]     genarray_i  0, iLen-1
kIndCpy[]  =          kInd
kOutArr[]  init       iN
kIndx      =          0
kLen       =          iLen
;for kN elements:
until kIndx == iN do
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

  opcode ArrRmIndx, i[], i[]i
iInArr[], iIndx xin
iOutArr[]  init       lenarray(iInArr)-1
iReadIndx  =          0
 until iReadIndx == iIndx do
iOutArr[iReadIndx] =  iInArr[iReadIndx]
iReadIndx  +=         1
 enduntil
iReadIndx  +=         1
 until iReadIndx == lenarray(iInArr) do
iOutArr[iReadIndx-1] = iInArr[iReadIndx]
iReadIndx  +=         1
 enduntil
           xout       iOutArr
  endop
  opcode ArrRmIndx, k[], k[]k
kInArr[], kIndx xin
kOutArr[]  init       lenarray:i(kInArr)-1
kReadIndx  =          0
 until kReadIndx == kIndx do
kOutArr[kReadIndx] =  kInArr[kReadIndx]
kReadIndx += 1
 enduntil
kReadIndx += 1
 until kReadIndx == lenarray(kInArr) do
kOutArr[kReadIndx-1] = kInArr[kReadIndx]
kReadIndx += 1
 enduntil
           xout       kOutArr
  endop

opcode ArrRndEl, i, i[]oj
 iInArr[], iStart, iEnd xin
 iLen lenarray iInArr
 iEnd = (iEnd == -1) ? iLen-1 : iEnd
 iElIndx random iStart, iEnd+0.999
 iEl = iInArr[int(iElIndx)]
 xout iEl
endop
opcode ArrRndEl, k, k[]OV
 kInArr[], kStart, kEnd xin
 kLen lenarray kInArr
 kEnd = (kEnd == 0.5) ? kLen-1 : kEnd
 kElIndx random kStart, kEnd+0.999
 kEl = kInArr[int(kElIndx)]
 xout kEl
endop
opcode ArrRndEl, S, S[]oj
 SInArr[], iStart, iEnd xin
 iLen lenarray SInArr
 iEnd = (iEnd == -1) ? iLen-1 : iEnd
 iElIndx random iStart, iEnd+0.999
 SEl = SInArr[int(iElIndx)]
 xout SEl
endop



