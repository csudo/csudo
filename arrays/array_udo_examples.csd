<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1
seed 0

#include "arrays.udo"
//more examples to find in https://github.com/csudo/csudo/tree/master/arrays 


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

instr ArrUdo

 iInArr[] fillarray 1, 2, 3, 4, 5, 6, 7, 8, 9
 iArr2[] fillarray -1, -2, -3, -2
 
 iAddEl[] ArrAddEl iInArr, 10
 printarray iAddEl, "%.0f", "ArrAddEl:"

 iAvrg ArrAvrg iInArr
 prints "Average: %d\n", iAvrg
 
 iArrCat[] ArrCat iInArr, iArr2
 printarray iArrCat, "%.0f", "ArrCat:"
 
 iArrElCnt ArrElCnt 5, iInArr
 prints "ArrElCnt: %d (for element=5)\n", iArrElCnt
 
 iArrElIn ArrElIn -1, iInArr
 prints "ArrElIn: %d (yes/no) for element=-1\n", iArrElIn
 
 iArrPermRnd[] ArrPermRnd iInArr
 printarray iArrPermRnd, "%.0f", "ArrPermRnd:"
 
 iArrPermRnd2[] ArrPermRnd2 iInArr, 2, 6
 printarray iArrPermRnd2, "%.0f", "ArrPermRnd2:"
 
 iArrPermRndIndx[] ArrPermRndIndx iInArr
 printarray iArrPermRndIndx, "%.0f", "ArrPermRndIndx:"
 
 iArrPldrm[] ArrPldrm iInArr
 printarray iArrPldrm, "%.0f", "ArrPldrm:"
 
 iArrRmDup[] ArrRmDup iArr2
 printarray iArrRmDup, "%.0f", "ArrRmDup:"
 
 iArrRmEl[] ArrRmEl iArr2, -2
 printarray iArrRmEl, "%.0f", "ArrRmEl:"
 
 iArrRmIndx[] ArrRmIndx iArr2, 0
 printarray iArrRmIndx, "%.0f", "ArrRmIndx:"
 
 iArrRndEl ArrRndEl iInArr
 prints "ArrRndEl: %d\n", iArrRndEl
 
 iArrRtt[] ArrRtt iInArr
 printarray iArrRtt, "%0.f", "ArrRtt:"
 
 iArrRvrs[] ArrRvrs iInArr
 printarray iArrRvrs, "%.0f", "ArrRvrs:"
 
endin

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


</CsInstruments>
<CsScore>
i "ArrUdo" 0 0
</CsScore>
</CsoundSynthesizer>

