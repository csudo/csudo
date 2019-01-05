/****************************************************************************
iOutArr[] ArrRvrs iInArr[]
kOutArr[] ArrRvrs kInArr[]
Returns the reverse of an array.
written by joachim heintz

i(k)InArr[] - input array
i(k)OutArr[] - output array
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>

<CsInstruments>
ksmps = 32

opcode ArrRvrs, i[], i[]

 iInArr[] xin
 iOutArr[] init lenarray:i(iInArr)
 indx = 0
 while indx < lenarray:i(iInArr) do
  iOutArr[lenarray:i(iInArr)-indx-1] = iInArr[indx]
  indx += 1
 od
 xout iOutArr

endop

opcode ArrRvrs, k[], k[]

 kInArr[] xin
 kOutArr[] init lenarray:i(kInArr)
 kndx = 0
 while kndx < lenarray(kInArr) do
  kOutArr[lenarray(kInArr)-kndx-1] = kInArr[kndx]
  kndx += 1
 od
 xout kOutArr

endop



instr Test_i

 prints "i-VERSION:\n"
 iInArr[] fillarray 1, 2, 3, 4, 5, 6, 7, 8, 9
 printarray iInArr, "%.0f", "original array:"
 iOutArr[] ArrRvrs iInArr
 printarray iOutArr, "%.0f", "array reversed:"
   
endin

instr Test_k

 prints "k-VERSION:\n"
 kInArr[] fillarray 1, 2, 3, 4, 5, 6, 7, 8, 9
 printarray kInArr, 1, "%.0f", "original array:"
 kOutArr[] ArrRvrs kInArr
 printarray kOutArr, 1, "%.0f", "array reversed:"
 turnoff
 
endin

</CsInstruments>
<CsScore>
i "Test_i" 0 0
i "Test_k" 0 1
</CsScore>
</CsoundSynthesizer>
prints:

i-VERSION:
original array:
 1 2 3 4 5 6 7 8 9 
array reversed:
 9 8 7 6 5 4 3 2 1 

k-VERSION:
original array:
 1 2 3 4 5 6 7 8 9 
array reversed:
 9 8 7 6 5 4 3 2 1 

