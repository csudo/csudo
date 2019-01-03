/****************************************************************************
iOutArr[] ArrRmIndx iInArr[], iIndx
kOutArr[] ArrRmIndx kInArr[], kIndx
Removes the element with the index i(k)Indx from i(k)InArr and returns the result as new array.
written by joachim heintz

i(k)InArr[] - input array
i(k)Indx - index to be removed from i(k)InArr
i(k)OutArr[] - output array as copy of i(k)InArr without i(k)Indx
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32
seed 0

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

instr 1
iArr[]     fillarray  1, 2, 3
iArr1[]    ArrRmIndx iArr, 0
           prints    "iArr1 = [%d, %d]\n", iArr1[0], iArr1[1]
iArr2[]    ArrRmIndx iArr, 1
           prints    "iArr2 = [%d, %d]\n", iArr2[0], iArr2[1]
iArr3[]    ArrRmIndx iArr, 2
           prints    "iArr3 = [%d, %d]\n", iArr3[0], iArr3[1]
endin

instr 2
kArr[]     fillarray   1, 2, 3
kArr1[]    ArrRmIndx kArr, 0
           printks    "kArr1 = [%d, %d]\n", 0, kArr1[0], kArr1[1]
kArr2[]    ArrRmIndx kArr, 1
           printks    "kArr2 = [%d, %d]\n", 0, kArr2[0], kArr2[1]
kArr3[]    ArrRmIndx kArr, 2
           printks    "kArr3 = [%d, %d]\n", 0, kArr3[0], kArr3[1]
           turnoff
endin


</CsInstruments>
<CsScore>
i 1 0 0
i 2 0 1
</CsScore>
</CsoundSynthesizer>

prints:

iArr1 = [2, 3]
iArr2 = [1, 3]
iArr3 = [1, 2]
kArr1 = [2, 3]
kArr2 = [1, 3]
kArr3 = [1, 2]


