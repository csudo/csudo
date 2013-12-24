<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>

  opcode SrtArrk, k[], k[]i
;array to sort and its length
kInArr[], iLen xin    
 ;create outarray with same length
kOutArr[]  init       iLen
 ;look for maximum element
kMax       maxarray   kInArr
 ;for all elements
kIndx      =          0
 until kIndx == iLen do
  ;look for minimum
kMin, kMinIndx minarray kInArr
  ;put it in the outarray
kOutArr[kIndx] =      kInArr[kMinIndx]
  ;replace this position by maximum+1
kInArr[kMinIndx] =    kMax+1
  ;increment index
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

