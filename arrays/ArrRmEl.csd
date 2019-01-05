/****************************************************************************
iOutArr[] ArrRmEl iInArr[], iEl
kOutArr[] ArrRmEl kInArr[], kEl
Removes an element from an array and returns the result as new array.
written by joachim heintz

i(k)InArr[] - input array (one dimension)
i(k)El - element to be removed
i(k)OutArr[] - output array 
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>
ksmps = 32

opcode ArrRmEl, i[], i[]i
 iInArr[], iEl xin
 iOutArr[] init lenarray:i(iInArr)
 iReadIndx = 0
 iWriteIndx = 0
 while iReadIndx < lenarray:i(iInArr) do
  if iInArr[iReadIndx] != iEl then
   iOutArr[iWriteIndx] = iInArr[iReadIndx]
   iWriteIndx += 1
  endif
  iReadIndx += 1
 od
 trim_i iOutArr, iWriteIndx
 xout iOutArr
endop

opcode ArrRmEl, k[], k[]k
 kInArr[], kEl xin
 kOutArr[] init lenarray:i(kInArr)
 kReadIndx = 0
 kWriteIndx = 0
 while kReadIndx < lenarray(kInArr) do
  if kInArr[kReadIndx] != kEl then
   kOutArr[kWriteIndx] = kInArr[kReadIndx]
   kWriteIndx += 1
  endif
  kReadIndx += 1
 od
 trim kOutArr, kWriteIndx
 xout kOutArr
endop




instr Test

 puts "\ni-VERSION:", 1
 iInArr[] fillarray 2, 1, 3, 1, 2, 4  
 printarray iInArr, "%.0f", "original array:"
 iOutArr[] ArrRmEl iInArr, 1
 printarray iOutArr, "%.0f", "removing 1:"
 iOutArr[] ArrRmEl iInArr, 2
 printarray iOutArr, "%.0f", "removing 2:"
 iOutArr[] ArrRmEl iInArr, 3
 printarray iOutArr, "%.0f", "removing 3:"
 iOutArr[] ArrRmEl iInArr, 4
 printarray iOutArr, "%.0f", "removing 4:"
 iOutArr[] ArrRmEl iInArr, 5
 printarray iOutArr, "%.0f", "removing 5 (not in array):"


 puts "\nk-VERSION:", 1
 kInArr[] fillarray -2, -1, -3, -1, -2, -4  
 printarray kInArr, 1, "%.0f", "original array:"
 kOutArr[] ArrRmEl kInArr, -1
 printarray kOutArr, 1, "%.0f", "removing -1:"
 kOutArr[] ArrRmEl kInArr, -2
 printarray kOutArr, 1, "%.0f", "removing -2:"
 kOutArr[] ArrRmEl kInArr, -3
 printarray kOutArr, 1, "%.0f", "removing -3:"
 kOutArr[] ArrRmEl kInArr, -4
 printarray kOutArr, 1, "%.0f", "removing -4:"
 kOutArr[] ArrRmEl kInArr, 0
 printarray kOutArr, 1, "%.0f", "removing 0 (not in array):"
 
 turnoff
   
endin

</CsInstruments>
<CsScore>
i "Test" 0 1
</CsScore>
</CsoundSynthesizer>
prints:

i-VERSION:
original array:
 2 1 3 1 2 4 
removing 1:
 2 3 2 4 
removing 2:
 1 3 1 4 
removing 3:
 2 1 1 2 4 
removing 4:
 2 1 3 1 2 
removing 5 (not in array):
 2 1 3 1 2 4 

k-VERSION:
original array:
 -2 -1 -3 -1 -2 -4 
removing -1:
 -2 -3 -2 -4 
removing -2:
 -1 -3 -1 -4 
removing -3:
 -2 -1 -1 -2 -4 
removing -4:
 -2 -1 -3 -1 -2 
removing 0 (not in array):
 -2 -1 -3 -1 -2 -4 

