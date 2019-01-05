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

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32
seed 0

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


instr 1
prints "\ni-ARRAYS:\n"
iArr[]     fillarray  1, 2, 3, 4, 5
iPrmRnd[] ArrPermRndIndx iArr, 1
prints   "iPrmRnd1 = [%d]\n", iPrmRnd[0]
iPrmRnd[] ArrPermRndIndx iArr, 2
prints   "iPrmRnd2 = [%d, %d]\n", iPrmRnd[0], iPrmRnd[1]
iPrmRnd[] ArrPermRndIndx iArr, 3
prints   "iPrmRnd3 = [%d, %d, %d]\n", iPrmRnd[0], iPrmRnd[1], iPrmRnd[2]
iPrmRnd[] ArrPermRndIndx iArr, 4
prints   "iPrmRnd4 = [%d, %d, %d, %d]\n", iPrmRnd[0], iPrmRnd[1], iPrmRnd[2], iPrmRnd[3]
iPrmRnd   ArrPermRndIndx iArr
prints   "iPrmRnd5 = [%d, %d, %d, %d, %d]\n", iPrmRnd[0],  iPrmRnd[1], iPrmRnd[2], iPrmRnd[3], iPrmRnd[4]
endin

instr 2
prints "\nk-ARRAYS:\n"
;create array
kArr[]     fillarray  1, 2, 3, 4, 5

;count preformance cycles
kCount     init       0
kCount     +=         1

;get permuted indices for n=1..5 and print
           printks    "\nCYCLE %d:\n", 0, kCount
kPrmRnd1[] ArrPermRndIndx kArr, 1
           printks    "kPrmRnd1 = [%d]\n", 0, kPrmRnd1[0]
kPrmRnd2[] ArrPermRndIndx kArr, 2
           printks    "kPrmRnd2 = [%d, %d]\n", 0, kPrmRnd2[0], kPrmRnd2[1]
kPrmRnd3[] ArrPermRndIndx kArr, 3
           printks    "kPrmRnd3 = [%d, %d, %d]\n", 0, kPrmRnd3[0], kPrmRnd3[1], kPrmRnd3[2]
kPrmRnd4[] ArrPermRndIndx kArr, 4
           printks    "kPrmRnd4 = [%d, %d, %d, %d]\n", 0, kPrmRnd4[0], kPrmRnd4[1], kPrmRnd4[2], kPrmRnd4[3]
kPrmRnd5[] ArrPermRndIndx kArr
           printks    "kPrmRnd5 = [%d, %d, %d, %d, %d]\n", 0, kPrmRnd5[0], kPrmRnd5[1], kPrmRnd5[2], kPrmRnd5[3], kPrmRnd5[4]


;turnoff after 5 performance periods
if kCount == 5 then
           turnoff
endif
endin

</CsInstruments>
<CsScore>
i 1 0 0
i 2 0 1
</CsScore>
</CsoundSynthesizer>

prints:

i-ARRAYS:
iPrmRnd1 = [4]
iPrmRnd2 = [4, 1]
iPrmRnd3 = [1, 3, 0]
iPrmRnd4 = [0, 4, 2, 3]
iPrmRnd5 = [0, 3, 1, 2, 4]

k-ARRAYS:

CYCLE 1:
kPrmRnd1 = [1]
kPrmRnd2 = [1, 2]
kPrmRnd3 = [3, 1, 4]
kPrmRnd4 = [0, 3, 4, 2]
kPrmRnd5 = [0, 1, 3, 2, 4]

CYCLE 2:
kPrmRnd1 = [4]
kPrmRnd2 = [1, 4]
kPrmRnd3 = [3, 0, 1]
kPrmRnd4 = [4, 0, 2, 3]
kPrmRnd5 = [4, 0, 3, 2, 1]

CYCLE 3:
kPrmRnd1 = [3]
kPrmRnd2 = [1, 4]
kPrmRnd3 = [0, 4, 1]
kPrmRnd4 = [4, 2, 1, 3]
kPrmRnd5 = [1, 0, 2, 4, 3]

CYCLE 4:
kPrmRnd1 = [3]
kPrmRnd2 = [1, 2]
kPrmRnd3 = [1, 3, 0]
kPrmRnd4 = [0, 2, 4, 3]
kPrmRnd5 = [4, 1, 2, 0, 3]

CYCLE 5:
kPrmRnd1 = [4]
kPrmRnd2 = [4, 0]
kPrmRnd3 = [1, 2, 0]
kPrmRnd4 = [1, 3, 2, 4]
kPrmRnd5 = [0, 2, 3, 1, 4]

