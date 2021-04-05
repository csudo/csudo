/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN arrays:
*****************************************************************************
ArrAddEl   : iOutArr[] ArrAddEl iInArr[], iEl [,iPos]
ArrAvrg    : iAvrg ArrAvrg iArr[] [,iStart [,iEnd]]
ArrCat     : iOutArr[] ArrCat iArr1[], iArr2[]
ArrElCnt   : iFound ArrElCnt iNeedle, iInArr[]
ArrElIn    : iRes ArrElIn iEl, iArr[]
ArrPermRnd : iOutArr[] ArrPermRnd iInArr[] [, iN]
ArrPermRnd2: iOutArr[] ArrPermRnd2 iInArr[] [, iStart [, iEnd]]
ArrPermRndIndx: iOutArr[] ArrPermRndIndx iInArr[] [, iN]
ArrPldrm   : iOutArr[] ArrPldrm iInArr[] [,iOpt]
ArrRepVal  : kOutArr[] ArrRepVal kInArr1[], iRepInx, iRep
ArrRmDup   : iOutArr[] ArrRmDup iInArr[]
ArrRmEl    : iOutArr[] ArrRmEl iInArr[], iEl
ArrRmIndx  : iOutArr[] ArrRmIndx iInArr[], iIndx
ArrRndEl   : iEl ArrRndEl iInArr[] [, iStart [, iEnd]]
ArrRtt     : iOutArr[] ArrRtt iInArr[] [,iRot]
ArrRvrs    : iOutArr[] ArrRvrs iInArr[]
ArrSrt     : iOutArr[] ArrSrt iInArr[] [,iOutN [,iOutType ,[iStart [,iEnd [,iHop]]]]]
array_udo_examples: ArrAddEl   : iOutArr[] ArrAddEl iInArr[], iEl [,iPos]
*****************************************************************************
****************************************************************************/

/****************************************************************************
iOutArr[] ArrAddEl iInArr[], iEl [,iPos]
kOutArr[] ArrAddEl kInArr[], kEl [,kPos]
Adds an element to an array and returns the result as new array.
written by joachim heintz

i(k)InArr[] - input array (one dimension)
i(k)El - element to be added
i(k)Pos - index at which the element is to be added (default -1: end of array)
i(k)OutArr[] - output array 
****************************************************************************/
/****************************************************************************
iAvrg ArrAvrg iArr[] [,iStart [,iEnd]]
kAvrg ArrAvrg kArr[] [,iStart [,iEnd]]
Calutates the average of the values in an array, 
or optional a slice of an array.
written by joachim heintz

i(k)Arr[] - input array
iStart - first position to read (default=0)
iEnd - last position to read (excluded) (default=-1 means the last element)
i(k)Avrg - average of all values in iArr
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
iFound ArrElCnt iNeedle, iInArr[]
kFound ArrElCnt kNeedle, iInArr[]
kFound ArrElCnt kNeedle, kInArr[]
Returns a count of instances of an element in an array
written by kevin welch

i(k)Needle - numeric value to search for
i(k)InArr[] - input array to search through
i(k)Found - count of instances found
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
SoutArr[] ArrPermRnd SInArr[] [, iN]
Returns an array of i/k/S N length which contains randomly permuted elements of i/k/S InArr[]. 
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.
written by joachim heintz

i/k/SInArr[] - input array
iN - desired length of the output array (must not be longer than i/k/SInArr), default = -1 which means that the whole length of the input array is taken
i/k/sOutArr[] - output array with iN randomly permuted elements of i/k/SInArr
****************************************************************************/
/****************************************************************************
iOutArr[] ArrPermRnd2 iInArr[] [, iStart [, iEnd]]
kOutArr[] ArrPermRnd2 kInArr[] [, kStart [, kEnd]]
Permutes randomly the elements of i(k)InArr[], from Start to End index (included).
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.
written by joachim heintz

i(k)InArr[] - input array
i(k)Start - first index to change (default = 0)
i(k)End - last index to change (default = -1: whole array)
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
iOutArr[] ArrPldrm iInArr[] [,iOpt]
kOutArr[] ArrPldrm kInArr[] [,iOpt]
Creates a palindrome of the input array, 
with some options.
written by joachim heintz

i(k)InArr[] - input array
iOpt - if 0 (default), the reverse of the array is appended except the last element
       if 1, the reverse is appended except the last and the first element
       if 2, the reverse is appended with both, the last and first element
i(k)OutArry[] - output array
****************************************************************************/
/**********************************************************************
kOutArr[] ArrRepVal kInArr1[], iRepInx, iRep
iOutArr[] ArrRepVal iInArr1[], iRepInx, iRep

Repeats a value in an array for iRep times.
Written by Parham Izadyar and joachim heintz

i|kInArr[] - input array
iRepInx - index of value to be repeated
iRep - number of repetitions
i|kOutArr[] - output array 
***********************************************************************/
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
iOutArr[] ArrRmEl iInArr[], iEl
kOutArr[] ArrRmEl kInArr[], kEl
Removes an element from an array and returns the result as new array.
written by joachim heintz

i(k)InArr[] - input array (one dimension)
i(k)El - element to be removed
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
iOutArr[] ArrRtt iInArr[] [,iRot]
kOutArr[] ArrRtt kInArr[] [,kRot]
Rotates an array for N positions (positive = right, negative = left)
and returns the result as new array.
written by joachim heintz

i(k)InArr[] - input array
iRot - positions to rotate right or left (default=1)
i(k)OutArr[] - output array
****************************************************************************/
/****************************************************************************
iOutArr[] ArrRvrs iInArr[]
kOutArr[] ArrRvrs kInArr[]
Returns the reverse of an array.
written by joachim heintz

i(k)InArr[] - input array
i(k)OutArr[] - output array
****************************************************************************/
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
/*
ArrAddEl   : iOutArr[] ArrAddEl iInArr[], iEl [,iPos]
ArrAvrg    : iAvrg ArrAvrg iArr[] [,iStart [,iEnd]]
ArrCat     : iOutArr[] ArrCat iArr1[], iArr2[]
ArrElCnt   : iFound ArrElCnt iNeedle, iInArr[]
ArrElIn    : iRes ArrElIn iEl, iArr[]
ArrPermRnd : iOutArr[] ArrPermRnd iInArr[] [, iN]
ArrPermRnd2: iOutArr[] ArrPermRnd2 iInArr[] [, iStart [, iEnd]]
ArrPermRndIndx: iOutArr[] ArrPermRndIndx iInArr[] [, iN]
ArrPldrm   : iOutArr[] ArrPldrm iInArr[] [,iOpt]
ArrRmDup   : iOutArr[] ArrRmDup iInArr[]
ArrRmEl    : iOutArr[] ArrRmEl iInArr[], iEl
ArrRmIndx  : iOutArr[] ArrRmIndx iInArr[], iIndx
ArrRndEl   : iEl ArrRndEl iInArr[] [, iStart [, iEnd]]
ArrRtt     : iOutArr[] ArrRtt iInArr[] [,iRot]
ArrRvrs    : iOutArr[] ArrRvrs iInArr[]
ArrSrt     : kOutArr[] ArrSrt kInArr[] [,iOutN [,kOutType ,[kStart [,kEnd [,kHop]]]]]
*/
/* prints:
ArrAddEl:
 1 2 3 4 5 6 7 8 9 10 
Average: 5
ArrCat:
 1 2 3 4 5 6 7 8 9 -1 -2 -3 -2 
ArrElCnt: 1 (for element=5)
ArrElIn: 0 (yes/no) for element=-1
ArrPermRnd:
 4 3 7 5 9 6 8 1 2 
ArrPermRnd2:
 1 2 3 4 7 5 6 8 9 
ArrPermRndIndx:
 0 3 8 4 1 6 5 7 2 
ArrPldrm:
 1 2 3 4 5 6 7 8 9 8 7 6 5 4 3 2 1 
ArrRmDup:
 -1 -2 -3 
ArrRmEl:
 -1 -3 
ArrRmIndx:
 -2 -3 -2 
ArrRndEl: 7
ArrRtt:
 2 3 4 5 6 7 8 9 1 
ArrRvrs:
 9 8 7 6 5 4 3 2 1 
*/

opcode ArrAddEl, i[], i[]ij

 iInArr[], iEl, iPos xin
 iOutArr[] init lenarray:i(iInArr)+1
 iPos = (iPos == -1) ? lenarray:i(iInArr) : iPos
 iWriteIndx = 0
 iIndxDiff = 0
 while iWriteIndx < lenarray:i(iOutArr) do
  iReadIndx = iWriteIndx - iIndxDiff
  if iWriteIndx == iPos then
   iOutArr[iWriteIndx] = iEl
   iIndxDiff = 1
  else
   iOutArr[iWriteIndx] = iInArr[iReadIndx]
  endif
  iWriteIndx += 1
 od
 xout iOutArr

endop
opcode ArrAddEl, k[], k[]kJ

 kInArr[], kEl, kPos xin
 kOutArr[] init lenarray:i(kInArr)+1
 kPos = (kPos == -1) ? lenarray:i(kInArr) : kPos
 kWriteIndx = 0
 kIndxDiff = 0
 while kWriteIndx < lenarray:k(kOutArr) do
  kReadIndx = kWriteIndx - kIndxDiff
  if kWriteIndx == kPos then
   kOutArr[kWriteIndx] = kEl
   kIndxDiff = 1
  else
   kOutArr[kWriteIndx] = kInArr[kReadIndx]
  endif
  kWriteIndx += 1
 od
 xout kOutArr

endop

opcode ArrAvrg, i, i[]oj

 iArr[], iStart, iEnd xin
 iEnd = (iEnd == -1) ? lenarray(iArr) : iEnd
 iAvrg = 0
 if iStart >= iEnd then
  prints "ERROR in ArrAvrg: iEnd must be larger than iStart\n"
  igoto end
 endif
 iCnt = 0
 while iStart < iEnd do
  iAvrg += iArr[iStart]
  iStart += 1
  iCnt += 1
 od
 iAvrg /= iCnt
 end:
 xout iAvrg

endop
opcode ArrAvrg, k, k[]oj

 kArr[], iStart, iEnd xin
 iEnd = (iEnd == -1) ? lenarray(kArr) : iEnd
 kAvrg = 0
 if iStart >= iEnd then
  prints "ERROR in ArrAvrg: iEnd must be larger than iStart\n"
  igoto end
 endif
 kStart = iStart
 kCnt = 0
 while kStart < iEnd do
  kAvrg += kArr[kStart]
  kStart += 1
  kCnt += 1
 od
 kAvrg /= kCnt
 end:
 xout kAvrg

endop


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
kIndx = 0
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
  opcode ArrPermRnd, S[], S[]j
SInArr[], iN xin
iLen       =          lenarray(SInArr)
iN = (iN == -1) ? iLen : iN
SOutArr[]  init       iN
indx      =          0
while indx < iN do
 iRndIndx   random     0, iLen-.0001
 iRndIndx   =          int(iRndIndx)
 SOutArr[indx] =      SInArr[iRndIndx]
 while iRndIndx < iLen-1 do
  SInArr[iRndIndx] = SInArr[iRndIndx+1]
  iRndIndx   +=         1
 od
 iLen       -=         1
 indx      +=         1
od
           xout       SOutArr
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
  opcode ArrPermRnd2, k[], k[]OJ
kInArr[], kStart, kEnd xin
kLen lenarray kInArr
kEnd = (kEnd == -1) ? kLen-1 : kEnd
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
 until kIndx == iN do
  kRndIndx   =          int(random:k(0, kLen-.0001))
  kOutArr[kIndx] =      kIndCpy[kRndIndx]
  until kRndIndx == kLen-1 do
   kIndCpy[kRndIndx] = kIndCpy[kRndIndx+1]
   kRndIndx   +=         1
  od
  kLen       -=         1
  kIndx      +=         1
 od
           xout       kOutArr
endop

opcode ArrPldrm, i[], i[]o
 iInArr[], iOpt xin
 iReadIndx = 0
 iWriteIndx = 0
 if iOpt == 0 then
  iOutArr[] init lenarray:i(iInArr) * 2 - 1
  while iWriteIndx < lenarray:i(iOutArr) do
   iOutArr[iWriteIndx] = iInArr[iReadIndx]
   iWriteIndx += 1
   iReadIndx = (iWriteIndx < lenarray:i(iInArr)) ? iReadIndx+1 : iReadIndx-1
  od
 elseif iOpt == 1 then
  iOutArr[] init lenarray:i(iInArr) * 2 - 2
  while iWriteIndx < lenarray:i(iOutArr) do
   iOutArr[iWriteIndx] = iInArr[iReadIndx]
   iWriteIndx += 1
   iReadIndx = (iWriteIndx < lenarray:i(iInArr)) ? iReadIndx+1 : iReadIndx-1
  od
 elseif iOpt == 2 then
  iOutArr[] init lenarray:i(iInArr) * 2
  while iWriteIndx < lenarray:i(iOutArr) do
   iOutArr[iWriteIndx] = iInArr[iReadIndx]
   iWriteIndx += 1
   iReadIndx = (iWriteIndx < lenarray:i(iInArr)) ? iReadIndx+1 : ((iWriteIndx > lenarray:i(iInArr)) ? iReadIndx-1 : iReadIndx)
  od
 endif
 xout iOutArr
endop
opcode ArrPldrm, k[], k[]o
 kInArr[], iOpt xin
 kReadIndx = 0
 kWriteIndx = 0
 if iOpt == 0 then
  kOutArr[] init lenarray:i(kInArr) * 2 - 1
  while kWriteIndx < lenarray:i(kOutArr) do
   kOutArr[kWriteIndx] = kInArr[kReadIndx]
   kWriteIndx += 1
   kReadIndx = (kWriteIndx < lenarray:i(kInArr)) ? kReadIndx+1 : kReadIndx-1
  od
 elseif iOpt == 1 then
  kOutArr[] init lenarray:i(kInArr) * 2 - 2
  while kWriteIndx < lenarray:i(kOutArr) do
   kOutArr[kWriteIndx] = kInArr[kReadIndx]
   kWriteIndx += 1
   kReadIndx = (kWriteIndx < lenarray:i(kInArr)) ? kReadIndx+1 : kReadIndx-1
  od
 elseif iOpt == 2 then
  kOutArr[] init lenarray:i(kInArr) * 2
  while kWriteIndx < lenarray:i(kOutArr) do
   kOutArr[kWriteIndx] = kInArr[kReadIndx]
   kWriteIndx += 1
   kReadIndx = (kWriteIndx < lenarray:i(kInArr)) ? kReadIndx+1 : ((kWriteIndx > lenarray:i(kInArr)) ? kReadIndx-1 : kReadIndx)
  od
 endif
 xout kOutArr
endop

opcode ArrRepVal, k[], k[]ii
 kInArr[], iRepInx, iRep xin
 kOutArr[] init lenarray:i(kInArr)+iRep
 kIndex = 0
 kWriteDups = 0
 while kIndex < iRepInx do
	 kOutArr[kIndex] = kInArr[kIndex]
	 kIndex += 1
 od
 while kWriteDups < iRep do
  kOutArr[kIndex+kWriteDups] = kInArr[kIndex]
  kWriteDups += 1
 od
 while kIndex < lenarray(kInArr) do
  kOutArr[kIndex+kWriteDups] = kInArr[kIndex]
  kIndex += 1
 od
 xout kOutArr
endop
opcode ArrRepVal, i[], i[]ii
 iInArr[], iRepInx, iRep xin
 iOutArr[] init lenarray(iInArr)+iRep
 iIndex = 0
 iWriteDups = 0
 while iIndex < iRepInx do
	 iOutArr[iIndex] = iInArr[iIndex]
	 iIndex += 1
 od
 while iWriteDups < iRep do
  iOutArr[iIndex+iWriteDups] = iInArr[iIndex]
  iWriteDups += 1
 od
 while iIndex < lenarray(iInArr) do
  iOutArr[iIndex+iWriteDups] = iInArr[iIndex]
  iIndex += 1
 od
 xout iOutArr
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

opcode ArrRmEl, i[], i[]i
 iInArr[], iEl xin
 iOutArr[] init lenarray:i(iInArr)
 iReadIndx = 0
 iWriteIndx = 0
 while iReadIndx < lenarray:i(iInArr) do
  if iInArr[iReadIndx] != iEl then
   iOutArr[iWriteIndx] = iInArr[iReadIndx]
   iWriteIndx += 1
  endif
  iReadIndx += 1
 od
 trim_i iOutArr, iWriteIndx
 xout iOutArr
endop
opcode ArrRmEl, k[], k[]k
 kInArr[], kEl xin
 kOutArr[] init lenarray:i(kInArr)
 kReadIndx = 0
 kWriteIndx = 0
 while kReadIndx < lenarray(kInArr) do
  if kInArr[kReadIndx] != kEl then
   kOutArr[kWriteIndx] = kInArr[kReadIndx]
   kWriteIndx += 1
  endif
  kReadIndx += 1
 od
 trim kOutArr, kWriteIndx
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

opcode ArrRtt, i[], i[]p
 iInArr[], iPos xin
 iLen lenarray iInArr
 iOutArr[] init iLen
 iPos = (iPos < 0) ? iLen-(abs(iPos%iLen)) : iPos
 indx = 0
 while indx < iLen do
  iOutArr[indx] = iInArr[(iPos+indx)%iLen]
  indx += 1
 od
 xout iOutArr
endop
opcode ArrRtt, k[], k[]P
 kInArr[], kPos xin
 iLen lenarray kInArr
 kOutArr[] init iLen
 kPos = (kPos < 0) ? iLen-(abs(kPos%iLen)) : kPos
 kndx = 0
 while kndx < iLen do
  kOutArr[kndx] = kInArr[(kPos+kndx)%iLen]
  kndx += 1
 od
 xout kOutArr
endop

opcode ArrRvrs, i[], i[]
 iInArr[] xin
 iOutArr[] init lenarray:i(iInArr)
 indx = 0
 while indx < lenarray:i(iInArr) do
  iOutArr[lenarray:i(iInArr)-indx-1] = iInArr[indx]
  indx += 1
 od
 xout iOutArr
endop
opcode ArrRvrs, k[], k[]
 kInArr[] xin
 kOutArr[] init lenarray:i(kInArr)
 kndx = 0
 while kndx < lenarray(kInArr) do
  kOutArr[lenarray(kInArr)-kndx-1] = kInArr[kndx]
  kndx += 1
 od
 xout kOutArr
endop

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


