/****************************************************************************
kOutArr[] SrtArrk kInArr[], iLen
Sorts the content of kInArr[] and returns the sorted array as kOutArr[].

kInArr[] - array to sort
iLen - its length
kOutArr[] - sorted array
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>

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


instr 1
kArr[]     array      1, -4, 3, 2, 19
kMyArr[]   SrtArrk    kArr, 5
kPrint     =          0
until kPrint == 5 do
           printf     "kMyArr[%d] = %d\n", kPrint+1, kPrint, kMyArr[kPrint]
kPrint += 1
od
           turnoff
endin


</CsInstruments>
<CsScore>
i 1 0 1
</CsScore>
</CsoundSynthesizer>

