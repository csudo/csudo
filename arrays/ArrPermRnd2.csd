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

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32
seed 0

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

;create i- and k-array
giArr[]     fillarray  1, 2, 3, 4, 5
gkArr[]     fillarray  11, 12, 13, 14, 15

instr Permut_i

;get permuted arrays for n=1..5 and print

iPrmRnd1[] ArrPermRnd2 giArr, 2, 3
 prints    "iPrmRnd1 (Start = 2, End = 3) = [%d, %d, %d, %d, %d]\n", iPrmRnd1[0], iPrmRnd1[1], iPrmRnd1[2], iPrmRnd1[3], iPrmRnd1[4]
iPrmRnd2[] ArrPermRnd2 giArr, 1, 3
 prints    "iPrmRnd2 (Start = 1, End = 3)= [%d, %d, %d, %d, %d]\n", iPrmRnd2[0], iPrmRnd2[1], iPrmRnd2[2], iPrmRnd2[3], iPrmRnd2[4]
iPrmRnd3[] ArrPermRnd2 giArr, 1, 4
 prints    "iPrmRnd3 (Start = 1, End = 4)= [%d, %d, %d, %d, %d]\n", iPrmRnd3[0], iPrmRnd3[1], iPrmRnd3[2], iPrmRnd3[3], iPrmRnd3[4]
iPrmRnd4[] ArrPermRnd2 giArr, 0, 4
 prints    "iPrmRnd4 (Start = 0, End = 4)= [%d, %d, %d, %d, %d]\n", iPrmRnd4[0], iPrmRnd4[1], iPrmRnd4[2], iPrmRnd4[3], iPrmRnd4[4]
 
iPrmRnd5[] ArrPermRnd2 giArr
 prints    "iPrmRnd5 (default) = [%d, %d, %d, %d, %d]\n", iPrmRnd5[0], iPrmRnd5[1], iPrmRnd5[2], iPrmRnd5[3], iPrmRnd5[4]

endin

instr Show_i ;make sure the root array is not touched by the udo

prints    "giArr[] = [%d, %d, %d, %d, %d]\n", giArr[0], giArr[1], giArr[2], giArr[3], giArr[4]

endin

instr Permut_k

;count preformance cycles
kCount     init       0
kCount     +=         1

;get permuted arrays for n=1..5 and print
 printks    "CYCLE %d:\n", 0, kCount
kPrmRnd1[] ArrPermRnd2 gkArr, 2, 3
 printks     "kPrmRnd1 (Start=2, End=3) = [%d, %d, %d, %d, %d]\n", 0, kPrmRnd1[0], kPrmRnd1[1], kPrmRnd1[2], kPrmRnd1[3], kPrmRnd1[4]
kPrmRnd2[] ArrPermRnd2 gkArr, 1, 3
 printks    "kPrmRnd2 (Start=1, End=3) = [%d, %d, %d, %d, %d]\n", 0, kPrmRnd2[0], kPrmRnd2[1], kPrmRnd2[2], kPrmRnd2[3], kPrmRnd2[4]
kPrmRnd3[] ArrPermRnd2 gkArr, 1, 4
 printks    "kPrmRnd3 (Start=1, End=4) = [%d, %d, %d, %d, %d]\n", 0, kPrmRnd3[0], kPrmRnd3[1], kPrmRnd3[2], kPrmRnd3[3], kPrmRnd3[4]
kPrmRnd4[] ArrPermRnd2 gkArr, 0, 4
 printks    "kPrmRnd4 (Start=0, End=4) = [%d, %d, %d, %d, %d]\n", 0, kPrmRnd4[0], kPrmRnd4[1], kPrmRnd4[2], kPrmRnd4[3], kPrmRnd4[4]
kPrmRnd5[] ArrPermRnd2 gkArr
 printks    "kPrmRnd5 (default) = [%d, %d, %d, %d, %d]\n", 0, kPrmRnd5[0], kPrmRnd5[1], kPrmRnd5[2], kPrmRnd5[3], kPrmRnd5[4]

;turnoff after 5 performance periods
if kCount == 5 then
           turnoff
endif

endin

instr Show_k

printks "gkArr[] = [%d, %d, %d, %d, %d]\n", 0, gkArr[0], gkArr[1], gkArr[2], gkArr[3], gkArr[4]
turnoff

endin
</CsInstruments>
<CsScore>
i "Permut_i" 0 .01
i . + .
i . + .
i . + .
i . + .
i "Show_i" .1 0
i "Permut_k" .2 .1
i "Show_k" .3 .1
</CsScore>
</CsoundSynthesizer>

prints (as one possibility):

iPrmRnd1 (Start = 2, End = 3) = [1, 2, 3, 4, 5]
iPrmRnd2 (Start = 1, End = 3)= [1, 4, 3, 2, 5]
iPrmRnd3 (Start = 1, End = 4)= [1, 4, 3, 5, 2]
iPrmRnd4 (Start = 0, End = 4)= [5, 1, 3, 2, 4]
iPrmRnd5 (default) = [1, 3, 2, 4, 5]
iPrmRnd1 (Start = 2, End = 3) = [1, 2, 3, 4, 5]
iPrmRnd2 (Start = 1, End = 3)= [1, 2, 4, 3, 5]
iPrmRnd3 (Start = 1, End = 4)= [1, 2, 4, 3, 5]
iPrmRnd4 (Start = 0, End = 4)= [2, 5, 1, 3, 4]
iPrmRnd5 (default) = [1, 2, 5, 4, 3]
iPrmRnd1 (Start = 2, End = 3) = [1, 2, 3, 4, 5]
iPrmRnd2 (Start = 1, End = 3)= [1, 2, 3, 4, 5]
iPrmRnd3 (Start = 1, End = 4)= [1, 4, 2, 5, 3]
iPrmRnd4 (Start = 0, End = 4)= [2, 3, 1, 5, 4]
iPrmRnd5 (default) = [2, 4, 5, 3, 1]
iPrmRnd1 (Start = 2, End = 3) = [1, 2, 4, 3, 5]
iPrmRnd2 (Start = 1, End = 3)= [1, 4, 2, 3, 5]
iPrmRnd3 (Start = 1, End = 4)= [1, 4, 3, 5, 2]
iPrmRnd4 (Start = 0, End = 4)= [4, 2, 1, 3, 5]
iPrmRnd5 (default) = [3, 1, 2, 4, 5]
iPrmRnd1 (Start = 2, End = 3) = [1, 2, 4, 3, 5]
iPrmRnd2 (Start = 1, End = 3)= [1, 3, 4, 2, 5]
iPrmRnd3 (Start = 1, End = 4)= [1, 2, 5, 3, 4]
iPrmRnd4 (Start = 0, End = 4)= [3, 4, 1, 2, 5]
iPrmRnd5 (default) = [5, 3, 1, 2, 4]
giArr[] = [1, 2, 3, 4, 5]
CYCLE 1:
kPrmRnd1 (Start=2, End=3) = [11, 12, 14, 13, 15]
kPrmRnd2 (Start=1, End=3) = [11, 13, 14, 12, 15]
kPrmRnd3 (Start=1, End=4) = [11, 13, 12, 15, 14]
kPrmRnd4 (Start=0, End=4) = [15, 14, 12, 11, 13]
kPrmRnd5 (default) = [12, 15, 14, 13, 11]
CYCLE 2:
kPrmRnd1 (Start=2, End=3) = [11, 12, 13, 14, 15]
kPrmRnd2 (Start=1, End=3) = [11, 12, 13, 14, 15]
kPrmRnd3 (Start=1, End=4) = [11, 12, 14, 15, 13]
kPrmRnd4 (Start=0, End=4) = [12, 11, 15, 14, 13]
kPrmRnd5 (default) = [13, 11, 15, 14, 12]
CYCLE 3:
kPrmRnd1 (Start=2, End=3) = [11, 12, 13, 14, 15]
kPrmRnd2 (Start=1, End=3) = [11, 13, 14, 12, 15]
kPrmRnd3 (Start=1, End=4) = [11, 12, 14, 13, 15]
kPrmRnd4 (Start=0, End=4) = [13, 11, 12, 14, 15]
kPrmRnd5 (default) = [15, 11, 13, 12, 14]
CYCLE 4:
kPrmRnd1 (Start=2, End=3) = [11, 12, 13, 14, 15]
kPrmRnd2 (Start=1, End=3) = [11, 12, 14, 13, 15]
kPrmRnd3 (Start=1, End=4) = [11, 14, 12, 15, 13]
kPrmRnd4 (Start=0, End=4) = [11, 14, 15, 13, 12]
kPrmRnd5 (default) = [15, 13, 12, 11, 14]
CYCLE 5:
kPrmRnd1 (Start=2, End=3) = [11, 12, 13, 14, 15]
kPrmRnd2 (Start=1, End=3) = [11, 14, 13, 12, 15]
kPrmRnd3 (Start=1, End=4) = [11, 14, 12, 13, 15]
kPrmRnd4 (Start=0, End=4) = [11, 15, 13, 12, 14]
kPrmRnd5 (default) = [13, 11, 14, 12, 15]
gkArr[] = [11, 12, 13, 14, 15]

