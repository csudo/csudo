/****************************************************************************
iOutArr[] ArrRmDup iInArr[]
kOutArr[] ArrRmDup kInArr[]
Removes duplicates from an array and returns the result as new array.
Requires the UDO ArrElIn.
written by joachim heintz

i(k)InArr[] - input array (one dimension)
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

opcode ArrElIn, i, ii[]

 iEl, iArr[] xin
 iRes = 0
 indx = 0
 while indx < lenarray:i(iArr) do
  if iEl == iArr[indx] then
   iRes = 1
   igoto end
  endif
  indx += 1
 od
 end:
 xout iRes

endop

opcode ArrElIn, k, kk[]

 kEl, kArr[] xin
 kRes = 0
 kndx = 0
 while kndx < lenarray:k(kArr) do
  if kEl == kArr[kndx] then
   kRes = 1
   kgoto end
  endif
  kndx += 1
 od
 end:
 xout kRes

endop


opcode ArrRmDup, i[], i[]

 iInArr[] xin
 iOutArr[] init lenarray:i(iInArr)
 iReadIndx = 0
 iWriteIndx = 0
 iCnt = 0
 while iReadIndx < lenarray:i(iInArr) do
  if ArrElIn:i(iInArr[iReadIndx],iOutArr) == 0 then
   iOutArr[iWriteIndx] = iInArr[iReadIndx]
   iWriteIndx += 1
   iCnt += 1
  endif
  iReadIndx += 1
 od
 trim_i iOutArr, iCnt
 xout iOutArr

endop

opcode ArrRmDup, k[], k[]

 kInArr[] xin
 kOutArr[] init lenarray:i(kInArr)
 kReadIndx = 0
 kWriteIndx = 0
 kCnt = 0
 while kReadIndx < lenarray:i(kInArr) do
  if ArrElIn:k(kInArr[kReadIndx],kOutArr) == 0 then
   kOutArr[kWriteIndx] = kInArr[kReadIndx]
   kWriteIndx += 1
   kCnt += 1
  endif
  kReadIndx += 1
 od
 trim kOutArr, kCnt
 xout kOutArr

endop




instr Test

 puts "\ni-VERSION:", 1
 iInArr[] fillarray 2, 1, 3, 1, 2, 4  
 iOutArr[] ArrRmDup iInArr
 prints "lenarray(iOutArr) = %d\n", lenarray:i(iOutArr)
 prints "elements without duplicates:\n"
 printarray iOutArr

 puts "\nk-VERSION:", 1
 kInArr[] fillarray -2, -1, -3, -1, -2, -4  
 kOutArr[] ArrRmDup kInArr
 printks "lenarray(kOutArr) = %d\n", 0, lenarray:k(kOutArr)
 printks "elements without duplicates:\n", 0
 printarray kOutArr
 
 turnoff
   
endin

</CsInstruments>
<CsScore>
i "Test" 0 1
</CsScore>
</CsoundSynthesizer>
returns:

i-VERSION:
lenarray(iOutArr) = 4
elements without duplicates:
  2.0000 1.0000 3.0000 4.0000 

k-VERSION:
lenarray(kOutArr) = 4
elements without duplicates:
  -2.0000 -1.0000 -3.0000 -4.0000 


