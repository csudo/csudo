/****************************************************************************
kOutArr[] ArrPermRndNk kInArr[], kN
Returns an array of kN length which contains randomly permuted elements of kInArr[]. 
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.
written by joachim heintz

kInArr[] - input array
kN - desired length of the output array (must not be longer than kInArr)
kOutArr[] - output array with kN randomly permuted elements of kInArr
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>
ksmps = 32
seed 0

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


instr 1
;create array
kArr[]     array      1, 2, 3, 4, 5

;count preformance cycles
kCount     init       0
kCount     +=         1

;get permuted arrays for n=1..5 and print
           printks    "\nCYCLE %d:\n", 0, kCount
kPrmRnd1[] ArrPermRndNk kArr, 1
           printks     "kPrmRnd1 = [%d]\n", 0, kPrmRnd1[0]
kPrmRnd2[] ArrPermRndNk kArr, 2
           printks    "kPrmRnd2 = [%d, %d]\n", 0, kPrmRnd2[0], kPrmRnd2[1]
kPrmRnd3[] ArrPermRndNk kArr, 3
           printks    "kPrmRnd3 = [%d, %d, %d]\n", 0, kPrmRnd3[0], kPrmRnd3[1], kPrmRnd3[2]
kPrmRnd4[] ArrPermRndNk kArr, 4
           printks    "kPrmRnd4 = [%d, %d, %d, %d]\n", 0, kPrmRnd4[0], kPrmRnd4[1], kPrmRnd4[2], kPrmRnd4[3]
kPrmRnd5[] ArrPermRndNk kArr, 5
           printks    "kPrmRnd5 = [%d, %d, %d, %d, %d]\n", 0, kPrmRnd5[0], kPrmRnd5[1], kPrmRnd5[2], kPrmRnd5[3], kPrmRnd5[4]

;turnoff after 5 performance periods
if kCount == 5 then
           turnoff
endif
endin

</CsInstruments>
<CsScore>
i 1 0 1
</CsScore>
</CsoundSynthesizer>

prints:

CYCLE 1:
kPrmRnd1 = [5]
kPrmRnd2 = [5, 1]
kPrmRnd3 = [5, 4, 3]
kPrmRnd4 = [5, 1, 3, 2]
kPrmRnd5 = [1, 5, 3, 2, 4]

CYCLE 2:
kPrmRnd1 = [3]
kPrmRnd2 = [5, 2]
kPrmRnd3 = [3, 4, 2]
kPrmRnd4 = [3, 2, 1, 4]
kPrmRnd5 = [4, 5, 3, 2, 1]

CYCLE 3:
kPrmRnd1 = [5]
kPrmRnd2 = [2, 4]
kPrmRnd3 = [4, 2, 5]
kPrmRnd4 = [5, 1, 2, 4]
kPrmRnd5 = [3, 5, 4, 2, 1]

CYCLE 4:
kPrmRnd1 = [3]
kPrmRnd2 = [1, 3]
kPrmRnd3 = [1, 5, 2]
kPrmRnd4 = [4, 5, 2, 3]
kPrmRnd5 = [4, 5, 3, 1, 2]

CYCLE 5:
kPrmRnd1 = [3]
kPrmRnd2 = [2, 1]
kPrmRnd3 = [5, 3, 1]
kPrmRnd4 = [3, 2, 5, 4]
kPrmRnd5 = [3, 5, 4, 1, 2]

