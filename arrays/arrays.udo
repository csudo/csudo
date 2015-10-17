/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN arrays:
*****************************************************************************
ArrPermRndIndx: kOutArr[] ArrPermRndIndx kInArr[], kN
ArrPermRndNi: iOutArr[] ArrPermRndNi iInArr[], iN
ArrPermRndNk: kOutArr[] ArrPermRndNk kInArr[], kN
ArrRmvIndxi: iOutArr[] ArrRmvIndxk iInArr[], iIndx
ArrRmvIndxk: kOutArr[] ArrRmvIndxk kInArr[], kIndx, iLenInArr
ArrSrti_simp: iOutArr[] ArrSrti_simp iInArr[]
ArrSrtk    : kOutArr[] ArrSrtk kInArr[], iOutN [,kOutType ,[kStart [,kEnd [,kHop]]]] 
ArrSrtk_simp: kOutArr[] ArrSrtk_simp kInArr[]
*****************************************************************************
****************************************************************************/

/****************************************************************************
kOutArr[] ArrPermRndIndx kInArr[], kN
Returns an array of kN length which contains randomly permuted indices of kInArr[]. 
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.
This UDO is similar to ArrPermRndN but returns indices instead of values.

kInArr[] - input array
kN - desired length of the output array (must not be longer than kInArr)
kOutArr[] - output array with kN randomly permuted indices of kInArr
****************************************************************************/
/****************************************************************************
iOutArr[] ArrPermRndNi iInArr[], iN
Returns an array of iN length which contains randomly permuted elements of iInArr[]. 
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.

iInArr[] - input array
iN - desired length of the output array (must not be longer than iInArr)
iOutArr[] - output array with iN randomly permuted elements of iInArr
****************************************************************************/
/****************************************************************************
kOutArr[] ArrPermRndNk kInArr[], kN
Returns an array of kN length which contains randomly permuted elements of kInArr[]. 
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.

kInArr[] - input array
kN - desired length of the output array (must not be longer than kInArr)
kOutArr[] - output array with kN randomly permuted elements of kInArr
****************************************************************************/
/****************************************************************************
iOutArr[] ArrRmvIndxk iInArr[], iIndx
Removes the element with the index iIndx from iInArr and returns the result as new array.

iInArr[] - input array
iIndx - index to be removed from iInArr
iOutArr[] - output array as copy of iInArr without iIndx
****************************************************************************/
/****************************************************************************
kOutArr[] ArrRmvIndxk kInArr[], kIndx, iLenInArr
Removes the element with the index Kindx from kInArr and returns the result as new array.

kInArr[] - input array
kIndx - index to be removed from kInArr
iLenInArr - length of input array
kOutArr[] - output array as copy of kInArr without kIndx
****************************************************************************/
/****************************************************************************
iOutArr[] ArrSrti_simp iInArr[]
Sorts the content of iInArr[] and returns the sorted array as iOutArr[].
This is a simple version of ArrSrti.

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

kInArr[] - array to sort
kOutArr[] - sorted array
****************************************************************************/

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

  opcode ArrPermRndNi, i[], i[]i
iInArr[], iN xin
iLen       =          lenarray(iInArr)
;copy input array 
;(for future should be simply possible via iInArrCyp[] = iInArr)
iInArrCpy[] =         iInArr
;create out array and set index
iOutArr[]  init       iN
iIndx      =          0
;for iN elements:
 until iIndx == iN do
 ;get one random element and put it in iOutArr
iRndIndx   random     0, iLen-.0001
iRndIndx   =          int(iRndIndx)
iOutArr[iIndx] =      iInArrCpy[iRndIndx]
 ;shift the elements after this one to the left
  until iRndIndx == iLen-1 do
iInArrCpy[iRndIndx] = iInArrCpy[iRndIndx+1]
iRndIndx   +=         1
  enduntil
 ;reset iLen and increase counter
iLen       -=         1
iIndx      +=         1
 enduntil
           xout       iOutArr
  endop

  opcode ArrPermRndNk, k[], k[]k
kInArr[], kN xin
kInArrCpy[] =         kInArr
kOutArr[]  init       i(kN)
kIndx      =          0
kLen       =          lenarray(kInArrCpy)
;for kN elements:
until kIndx == kN do
 ;get one random element and put it in kOutArr
kRndIndx   random     0, kLen-.0001
kRndIndx   =          int(kRndIndx)
kOutArr[kIndx] =      kInArrCpy[kRndIndx]
 ;shift the elements after this one to the left
 until kRndIndx == kLen-1 do
kInArrCpy[kRndIndx] = kInArrCpy[kRndIndx+1]
kRndIndx   +=         1
 enduntil
 ;reset kLen and increase counter
kLen       -=         1
kIndx      +=         1
enduntil
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


