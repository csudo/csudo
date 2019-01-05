/****************************************************************************
iOutArr[] ArrPldrm iInArr[] [,iOpt]
kOutArr[] ArrPldrm kInArr[] [,iOpt]
Creates a palindrome of the input array, 
with some options.
written by joachim heintz

i(k)InArr[] - input array
iOpt - if 0 (default), the reverse of the array is appended except the last element
       if 1, the reverse is appended except the last and the first element
       if 2, the reverse is appended with both, the last and first element
i(k)OutArry[] - output array
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>

<CsInstruments>
ksmps = 32

opcode ArrPldrm, i[], i[]o
 iInArr[], iOpt xin
 iReadIndx = 0
 iWriteIndx = 0
 if iOpt == 0 then
  iOutArr[] init lenarray:i(iInArr) * 2 - 1
  while iWriteIndx < lenarray:i(iOutArr) do
   iOutArr[iWriteIndx] = iInArr[iReadIndx]
   iWriteIndx += 1
   iReadIndx = (iWriteIndx < lenarray:i(iInArr)) ? iReadIndx+1 : iReadIndx-1
  od
 elseif iOpt == 1 then
  iOutArr[] init lenarray:i(iInArr) * 2 - 2
  while iWriteIndx < lenarray:i(iOutArr) do
   iOutArr[iWriteIndx] = iInArr[iReadIndx]
   iWriteIndx += 1
   iReadIndx = (iWriteIndx < lenarray:i(iInArr)) ? iReadIndx+1 : iReadIndx-1
  od
 elseif iOpt == 2 then
  iOutArr[] init lenarray:i(iInArr) * 2
  while iWriteIndx < lenarray:i(iOutArr) do
   iOutArr[iWriteIndx] = iInArr[iReadIndx]
   iWriteIndx += 1
   iReadIndx = (iWriteIndx < lenarray:i(iInArr)) ? iReadIndx+1 : ((iWriteIndx > lenarray:i(iInArr)) ? iReadIndx-1 : iReadIndx)
  od
 endif
 xout iOutArr
endop

opcode ArrPldrm, k[], k[]o
 kInArr[], iOpt xin
 kReadIndx = 0
 kWriteIndx = 0
 if iOpt == 0 then
  kOutArr[] init lenarray:i(kInArr) * 2 - 1
  while kWriteIndx < lenarray:i(kOutArr) do
   kOutArr[kWriteIndx] = kInArr[kReadIndx]
   kWriteIndx += 1
   kReadIndx = (kWriteIndx < lenarray:i(kInArr)) ? kReadIndx+1 : kReadIndx-1
  od
 elseif iOpt == 1 then
  kOutArr[] init lenarray:i(kInArr) * 2 - 2
  while kWriteIndx < lenarray:i(kOutArr) do
   kOutArr[kWriteIndx] = kInArr[kReadIndx]
   kWriteIndx += 1
   kReadIndx = (kWriteIndx < lenarray:i(kInArr)) ? kReadIndx+1 : kReadIndx-1
  od
 elseif iOpt == 2 then
  kOutArr[] init lenarray:i(kInArr) * 2
  while kWriteIndx < lenarray:i(kOutArr) do
   kOutArr[kWriteIndx] = kInArr[kReadIndx]
   kWriteIndx += 1
   kReadIndx = (kWriteIndx < lenarray:i(kInArr)) ? kReadIndx+1 : ((kWriteIndx > lenarray:i(kInArr)) ? kReadIndx-1 : kReadIndx)
  od
 endif
 xout kOutArr
endop


instr Test_i

 prints "i-VERSION:\n"
 iInArr[] fillarray 1, 2, 3, 4, 5, 6, 7, 8, 9
 printarray iInArr, "%.0f", "input array:"
 iOutArr[] ArrPldrm iInArr
 printarray iOutArr, "%.0f", "palindrome with iOpt=0 (default):"
 iOutArr[] ArrPldrm iInArr, 1
 printarray iOutArr, "%.0f", "palindrome with iOpt=1:"
 iOutArr[] ArrPldrm iInArr, 2
 printarray iOutArr, "%.0f", "palindrome with iOpt=2:"

    
endin

instr Test_k

 prints "k-VERSION:\n"
 kInArr[] fillarray 1, 2, 3, 4, 5, 6, 7, 8, 9
 printarray kInArr, 1, "%.0f", "input array:"
 kOutArr[] ArrPldrm kInArr
 printarray kOutArr, 1, "%.0f", "palindrome with iOpt=0 (default):"
 kOutArr[] ArrPldrm kInArr, 1
 printarray kOutArr, 1, "%.0f", "palindrome with iOpt=1:"
 kOutArr[] ArrPldrm kInArr, 2
 printarray kOutArr, 1, "%.0f", "palindrome with iOpt=2:"

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
input array:
 1 2 3 4 5 6 7 8 9 
palindrome with iOpt=0 (default):
 1 2 3 4 5 6 7 8 9 8 7 6 5 4 3 2 1 
palindrome with iOpt=1:
 1 2 3 4 5 6 7 8 9 8 7 6 5 4 3 2 
palindrome with iOpt=2:
 1 2 3 4 5 6 7 8 9 9 8 7 6 5 4 3 2 1 

k-VERSION:
input array:
 1 2 3 4 5 6 7 8 9 
palindrome with iOpt=0 (default):
 1 2 3 4 5 6 7 8 9 8 7 6 5 4 3 2 1 
palindrome with iOpt=1:
 1 2 3 4 5 6 7 8 9 8 7 6 5 4 3 2 
palindrome with iOpt=2:
 1 2 3 4 5 6 7 8 9 9 8 7 6 5 4 3 2 1 


