/****************************************************************************
iOutArr[] ArrPermRnd iInArr[] [, iN]
kOutArr[] ArrPermRnd kInArr[] [, iN]
SoutArr[] ArrPermRnd SInArr[] [, iN]
Returns an array of i/k/S N length which contains randomly permuted elements of i/k/S InArr[]. 
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.
written by joachim heintz

i/k/SInArr[] - input array
iN - desired length of the output array (must not be longer than i/k/SInArr), default = -1 which means that the whole length of the input array is taken
i/k/sOutArr[] - output array with iN randomly permuted elements of i/k/SInArr
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32
seed 0

  opcode ArrPermRnd, i[], i[]j
iInArr[], iN xin
iLen       =          lenarray(iInArr)
;get output length
iN = (iN == -1) ? iLen : iN
;create out array and set index
iOutArr[]  init       iN
iIndx      =          0
;for iN elements:
 until iIndx == iN do
 ;get one random element and put it in iOutArr
iRndIndx   random     0, iLen-.0001
iRndIndx   =          int(iRndIndx)
iOutArr[iIndx] =      iInArr[iRndIndx]
 ;shift the elements after this one to the left
  until iRndIndx == iLen-1 do
iInArr[iRndIndx] = iInArr[iRndIndx+1]
iRndIndx   +=         1
  enduntil
 ;reset iLen and increase counter
iLen       -=         1
iIndx      +=         1
 enduntil
           xout       iOutArr
  endop

  opcode ArrPermRnd, k[], k[]j
kInArr[], iN xin
iLen       =          lenarray(kInArr)
iN = (iN == -1) ? iLen : iN
kOutArr[]  init       iN
kIndx = 0
kLen = iLen
;for kN elements:
until kIndx == iN do
 ;get one random element and put it in kOutArr
kRndIndx   random     0, kLen-.0001
kRndIndx   =          int(kRndIndx)
kOutArr[kIndx] =      kInArr[kRndIndx]
 ;shift the elements after this one to the left
 until kRndIndx == kLen-1 do
kInArr[kRndIndx] = kInArr[kRndIndx+1]
kRndIndx   +=         1
 enduntil
 ;reset kLen and increase counter
kLen       -=         1
kIndx      +=         1
enduntil
           xout       kOutArr
  endop

  opcode ArrPermRnd, S[], S[]j
SInArr[], iN xin
iLen       =          lenarray(SInArr)
iN = (iN == -1) ? iLen : iN
SOutArr[]  init       iN
indx      =          0
while indx < iN do
 iRndIndx   random     0, iLen-.0001
 iRndIndx   =          int(iRndIndx)
 SOutArr[indx] =      SInArr[iRndIndx]
 while iRndIndx < iLen-1 do
  SInArr[iRndIndx] = SInArr[iRndIndx+1]
  iRndIndx   +=         1
 od
 iLen       -=         1
 indx      +=         1
od
           xout       SOutArr
  endop



;create i- and k-array
giArr[]     fillarray  1, 2, 3, 4, 5
gkArr[]     fillarray  11, 12, 13, 14, 15

instr Permut_i

;get permuted arrays for n=1..5 and print
iPrmRnd1[] ArrPermRnd giArr, 1
           prints    "iPrmRnd1 = [%d]\n", iPrmRnd1[0]
iPrmRnd2[] ArrPermRnd giArr, 2
           prints    "iPrmRnd2 = [%d, %d]\n", iPrmRnd2[0], iPrmRnd2[1]
iPrmRnd3[] ArrPermRnd giArr, 3
           prints    "iPrmRnd3 = [%d, %d, %d]\n", iPrmRnd3[0], iPrmRnd3[1], iPrmRnd3[2]
iPrmRnd4[] ArrPermRnd giArr, 4
           prints    "iPrmRnd4 = [%d, %d, %d, %d]\n", iPrmRnd4[0], iPrmRnd4[1], iPrmRnd4[2], iPrmRnd4[3]
iPrmRnd5[] ArrPermRnd giArr
           prints    "iPrmRnd5 = [%d, %d, %d, %d, %d]\n", iPrmRnd5[0], iPrmRnd5[1], iPrmRnd5[2], iPrmRnd5[3], iPrmRnd5[4]

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
kPrmRnd1[] ArrPermRnd gkArr, 1
           printks     "kPrmRnd1 = [%d]\n", 0, kPrmRnd1[0]
kPrmRnd2[] ArrPermRnd gkArr, 2
           printks    "kPrmRnd2 = [%d, %d]\n", 0, kPrmRnd2[0], kPrmRnd2[1]
kPrmRnd3[] ArrPermRnd gkArr, 3
           printks    "kPrmRnd3 = [%d, %d, %d]\n", 0, kPrmRnd3[0], kPrmRnd3[1], kPrmRnd3[2]
kPrmRnd4[] ArrPermRnd gkArr, 4
           printks    "kPrmRnd4 = [%d, %d, %d, %d]\n", 0, kPrmRnd4[0], kPrmRnd4[1], kPrmRnd4[2], kPrmRnd4[3]
kPrmRnd5[] ArrPermRnd gkArr
           printks    "kPrmRnd5 = [%d, %d, %d, %d, %d]\n", 0, kPrmRnd5[0], kPrmRnd5[1], kPrmRnd5[2], kPrmRnd5[3], kPrmRnd5[4]

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

iPrmRnd1 = [3]
iPrmRnd2 = [1, 5]
iPrmRnd3 = [2, 5, 4]
iPrmRnd4 = [5, 2, 1, 4]
iPrmRnd5 = [1, 2, 5, 4, 3]
iPrmRnd1 = [4]
iPrmRnd2 = [1, 5]
iPrmRnd3 = [3, 5, 4]
iPrmRnd4 = [3, 1, 2, 4]
iPrmRnd5 = [4, 5, 2, 3, 1]
iPrmRnd1 = [4]
iPrmRnd2 = [2, 3]
iPrmRnd3 = [1, 5, 4]
iPrmRnd4 = [5, 1, 4, 2]
iPrmRnd5 = [1, 5, 3, 4, 2]
iPrmRnd1 = [1]
iPrmRnd2 = [4, 2]
iPrmRnd3 = [3, 2, 1]
iPrmRnd4 = [4, 3, 5, 1]
iPrmRnd5 = [2, 3, 5, 1, 4]
iPrmRnd1 = [3]
iPrmRnd2 = [5, 4]
iPrmRnd3 = [5, 3, 1]
iPrmRnd4 = [1, 2, 5, 4]
iPrmRnd5 = [3, 1, 4, 5, 2]
giArr[] = [1, 2, 3, 4, 5]
CYCLE 1:
kPrmRnd1 = [14]
kPrmRnd2 = [15, 14]
kPrmRnd3 = [11, 15, 12]
kPrmRnd4 = [11, 13, 12, 14]
kPrmRnd5 = [13, 12, 14, 11, 15]
CYCLE 2:
kPrmRnd1 = [15]
kPrmRnd2 = [11, 15]
kPrmRnd3 = [13, 11, 12]
kPrmRnd4 = [15, 13, 11, 14]
kPrmRnd5 = [14, 15, 11, 12, 13]
CYCLE 3:
kPrmRnd1 = [12]
kPrmRnd2 = [15, 14]
kPrmRnd3 = [13, 15, 11]
kPrmRnd4 = [11, 14, 12, 13]
kPrmRnd5 = [13, 14, 15, 11, 12]
CYCLE 4:
kPrmRnd1 = [14]
kPrmRnd2 = [11, 13]
kPrmRnd3 = [13, 14, 15]
kPrmRnd4 = [15, 14, 11, 13]
kPrmRnd5 = [13, 12, 11, 14, 15]
CYCLE 5:
kPrmRnd1 = [13]
kPrmRnd2 = [13, 12]
kPrmRnd3 = [11, 13, 12]
kPrmRnd4 = [15, 11, 13, 12]
kPrmRnd5 = [14, 12, 15, 11, 13]
gkArr[] = [11, 12, 13, 14, 15]

<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
