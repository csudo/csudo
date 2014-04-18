/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN arrays:
*****************************************************************************
ArrPermRndNi: iOutArr[] ArrPermRndNi iInArr[], iN
ArrPermRndNk: kOutArr[] ArrPermRndNk kInArr[], kN
ArrRmvIndxi: iOutArr[] ArrRmvIndxk iInArr[], iIndx
ArrRmvIndxk: kOutArr[] ArrRmvIndxk kInArr[], kIndx, iLenInArr
ArrSrti    : iOutArr[] ArrSrti iInArr[]
ArrSrtk    : kOutArr[] ArrSrtk kInArr[]
*****************************************************************************
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
iOutArr[] ArrSrti iInArr[]
Sorts the content of iInArr[] and returns the sorted array as iOutArr[].

iInArr[] - array to sort
iOutArr[] - sorted array
****************************************************************************/
/****************************************************************************
kOutArr[] ArrSrtk kInArr[]
Sorts the content of kInArr[] and returns the sorted array as kOutArr[].

kInArr[] - array to sort
kOutArr[] - sorted array
****************************************************************************/

  opcode ArrPermRndNi, i[], i[]i
iInArr[], iN xin
iLen       =          lenarray(iInArr)
;copy input array 
;(for future should be simply possible via iInArrCyp[] = iInArr)
iInArrCpy[] init      iLen
iIndx      =          0
 until iIndx == iLen do
iInArrCpy[iIndx] = iInArr[iIndx]
iIndx      +=         1
 enduntil
;create out array and reset index
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

  opcode ArrSrti, i[], i[]
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

  opcode ArrSrtk, k[], k[]
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


