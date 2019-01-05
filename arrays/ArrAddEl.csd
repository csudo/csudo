/****************************************************************************
iOutArr[] ArrAddEl iInArr[], iEl [,iPos]
kOutArr[] ArrAddEl kInArr[], kEl [,kPos]
Adds an element to an array and returns the result as new array.
written by joachim heintz

i(k)InArr[] - input array (one dimension)
i(k)El - element to be added
i(k)Pos - index at which the element is to be added (default -1: end of array)
i(k)OutArr[] - output array 
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>
ksmps = 32


opcode ArrAddEl, i[], i[]ij

 iInArr[], iEl, iPos xin
 iOutArr[] init lenarray:i(iInArr)+1
 iPos = (iPos == -1) ? lenarray:i(iInArr) : iPos
 iWriteIndx = 0
 iIndxDiff = 0
 while iWriteIndx < lenarray:i(iOutArr) do
  iReadIndx = iWriteIndx - iIndxDiff
  if iWriteIndx == iPos then
   iOutArr[iWriteIndx] = iEl
   iIndxDiff = 1
  else
   iOutArr[iWriteIndx] = iInArr[iReadIndx]
  endif
  iWriteIndx += 1
 od
 xout iOutArr

endop

opcode ArrAddEl, k[], k[]kJ

 kInArr[], kEl, kPos xin
 kOutArr[] init lenarray:i(kInArr)+1
 kPos = (kPos == -1) ? lenarray:i(kInArr) : kPos
 kWriteIndx = 0
 kIndxDiff = 0
 while kWriteIndx < lenarray:k(kOutArr) do
  kReadIndx = kWriteIndx - kIndxDiff
  if kWriteIndx == kPos then
   kOutArr[kWriteIndx] = kEl
   kIndxDiff = 1
  else
   kOutArr[kWriteIndx] = kInArr[kReadIndx]
  endif
  kWriteIndx += 1
 od
 xout kOutArr

endop



instr Test

 puts "\ni-VERSION:", 1
 iInArr[] fillarray 2, 1, 3, 1, 2, 4  
 printarray iInArr, "%.0f", "original array:"
 iOutArr[] ArrAddEl iInArr, -1
 printarray iOutArr, "%.0f", "add element -1 at the end:"
 iOutArr[] ArrAddEl iInArr, -1, 0
 printarray iOutArr, "%.0f", "add element -1 at the beginning (iPos=0):"
 iOutArr[] ArrAddEl iInArr, -1, 2
 printarray iOutArr, "%.0f", "add element -1 at iPos=2:"

 puts "\nk-VERSION:", 1
 kInArr[] fillarray -2, -1, -3, -1, -2, -4  
 printarray kInArr, 1, "%.0f", "original array:"
 kOutArr[] ArrAddEl kInArr, 1
 printarray kOutArr, 1, "%.0f", "add element 1 at the end:"
 kOutArr[] ArrAddEl kInArr, 1, 0
 printarray kOutArr, 1, "%.0f", "add element 1 at the beginning (iPos=0):"
 kOutArr[] ArrAddEl kInArr, 1, 2
 printarray kOutArr, 1, "%.0f", "add element 1 at iPos=2:"
 
 turnoff
   
endin

</CsInstruments>
<CsScore>
i "Test" 0 1
</CsScore>
</CsoundSynthesizer>
prints:

original array:
 2 1 3 1 2 4 
add element -1 at the end:
 2 1 3 1 2 4 -1 
add element -1 at the beginning (iPos=0):
 -1 2 1 3 1 2 4 
add element -1 at iPos=2:
 2 1 -1 3 1 2 4 

k-VERSION:
original array:
 -2 -1 -3 -1 -2 -4 
add element 1 at the end:
 -2 -1 -3 -1 -2 -4 1 
add element 1 at the beginning (iPos=0):
 1 -2 -1 -3 -1 -2 -4 
add element 1 at iPos=2:
 -2 -1 1 -3 -1 -2 -4 

