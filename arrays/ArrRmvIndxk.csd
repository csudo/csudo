/****************************************************************************
kOutArr[] ArrRmvIndxk kInArr[], kIndx, iLenInArr
Removes the element with the index Kindx from kInArr and returns the result as new array.
written by joachim heintz

kInArr[] - input array
kIndx - index to be removed from kInArr
iLenInArr - length of input array
kOutArr[] - output array as copy of kInArr without kIndx
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>
ksmps = 32
seed 0

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


instr 1
kArr[]     array      1, 2, 3
kArr1[]    ArrRmvIndxk kArr, 0, 3
           printks    "kArr1 = [%d, %d]\n", 0, kArr1[0], kArr1[1]
kArr2[]    ArrRmvIndxk kArr, 1, 3
           printks    "kArr2 = [%d, %d]\n", 0, kArr2[0], kArr2[1]
kArr3[]    ArrRmvIndxk kArr, 2, 3
           printks    "kArr3 = [%d, %d]\n", 0, kArr3[0], kArr3[1]
           turnoff
endin

</CsInstruments>
<CsScore>
i 1 0 1
</CsScore>
</CsoundSynthesizer>

