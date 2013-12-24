/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN arrays:
*****************************************************************************
SrtArrk    : kOutArr[] SrtArrk kInArr[], iLen
*****************************************************************************
****************************************************************************/

/****************************************************************************
kOutArr[] SrtArrk kInArr[], iLen
Sorts the content of kInArr[] and returns the sorted array as kOutArr[].

kInArr[] - array to sort
iLen - its length
kOutArr[] - sorted array
****************************************************************************/

  opcode SrtArrk, k[], k[]i
kInArr[], iLen xin    
kOutArr[]  init       iLen
kMax       maxarray   kInArr
kIndx      =          0
 until kIndx == iLen do
kMin, kMinIndx minarray kInArr
kOutArr[kIndx] =      kInArr[kMinIndx]
kInArr[kMinIndx] =    kMax+1
kIndx += 1
 od
           xout       kOutArr
  endop


