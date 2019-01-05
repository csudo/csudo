/****************************************************************************
iOutArr[] ArrCat iArr1[], iArr2[]
kOutArr[] ArrCat kArr1[], kArr2[]
Concatenates two arrays and returns the result as new array.
written by joachim heintz

i(k)Arr1[], i(k)Arr2[] - input arrays (one dimension)
i(k)OutArr[] - output array 
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>

<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

opcode ArrCat, i[], i[]i[]

 iArr1[], iArr2[] xin
 iLenOutArr = lenarray(iArr1) + lenarray(iArr2)
 iOutArr[] init iLenOutArr
 indx = 0
 while indx < lenarray(iArr1) do
  iOutArr[indx] = iArr1[indx]
  indx += 1
 od
 while indx < iLenOutArr do
  iOutArr[indx] = iArr2[indx-lenarray(iArr1)]
  indx += 1
 od
 xout iOutArr

endop

opcode ArrCat, k[], k[]k[]

 kArr1[], kArr2[] xin
 iLenOutArr = lenarray:i(kArr1) + lenarray:i(kArr2)
 kOutArr[] init iLenOutArr
 kndx = 0
 while kndx < lenarray(kArr1) do
  kOutArr[kndx] = kArr1[kndx]
  kndx += 1
 od
 while kndx < iLenOutArr do
  kOutArr[kndx] = kArr2[kndx-lenarray(kArr1)]
  kndx += 1
 od
 xout kOutArr

endop


instr Test

 iArr1[] fillarray 1, 2, 3
 iArr2[] fillarray 4, 5, 6, 7
 iArr[] ArrCat iArr1, iArr2
 printarray iArr
 
 kArr1[] fillarray -1, -2, -3, -4
 kArr2[] fillarray -5, -6, -7
 kArr[] ArrCat kArr1, kArr2
 printarray kArr
 
 kArr1 += 10
 kArr2 += 20
 kArr ArrCat kArr1, kArr2
 printarray kArr
  
 turnoff 
 
endin

</CsInstruments>
<CsScore>
i "Test" 0 1
</CsScore>
</CsoundSynthesizer>
prints:
  1.0000 2.0000 3.0000 4.0000 5.0000 6.0000 7.0000 
  -1.0000 -2.0000 -3.0000 -4.0000 -5.0000 -6.0000 -7.0000 
  9.0000 8.0000 7.0000 6.0000 15.0000 14.0000 13.0000 


