/****************************************************************************
iAvrg ArrAvrg iArr[] [,iStart [,iEnd]]
kAvrg ArrAvrg kArr[] [,iStart [,iEnd]]
Calutates the average of the values in an array, 
or optional a slice of an array.
written by joachim heintz

i(k)Arr[] - input array
iStart - first position to read (default=0)
iEnd - last position to read (excluded) (default=-1 means the last element)
i(k)Avrg - average of all values in iArr
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>

<CsInstruments>
ksmps = 32

opcode ArrAvrg, i, i[]oj

 iArr[], iStart, iEnd xin
 iEnd = (iEnd == -1) ? lenarray(iArr) : iEnd
 iAvrg = 0
 if iStart >= iEnd then
  prints "ERROR in ArrAvrg: iEnd must be larger than iStart\n"
  igoto end
 endif
 iCnt = 0
 while iStart < iEnd do
  iAvrg += iArr[iStart]
  iStart += 1
  iCnt += 1
 od
 iAvrg /= iCnt
 end:
 xout iAvrg

endop

opcode ArrAvrg, k, k[]oj

 kArr[], iStart, iEnd xin
 iEnd = (iEnd == -1) ? lenarray(kArr) : iEnd
 kAvrg = 0
 if iStart >= iEnd then
  prints "ERROR in ArrAvrg: iEnd must be larger than iStart\n"
  igoto end
 endif
 kStart = iStart
 kCnt = 0
 while kStart < iEnd do
  kAvrg += kArr[kStart]
  kStart += 1
  kCnt += 1
 od
 kAvrg /= kCnt
 end:
 xout kAvrg

endop


instr Test_i

 iArr[] fillarray 1, 2, 3, 4, 5, 6, 7, 8, 9
 iAvrg ArrAvrg iArr
 print iAvrg
 iAvrg ArrAvrg iArr, 3
 print iAvrg
 iAvrg ArrAvrg iArr, 3, 6
 print iAvrg
 iAvrg ArrAvrg iArr, 3, 3 ;error
 print iAvrg
   
endin

instr Test_k

 kArr[] fillarray 1, 2, 3, 4, 5, 6, 7, 8, 9
 kAvrg ArrAvrg kArr
 printks "kAvrg = %.3f\n", 0, kAvrg
 kAvrg ArrAvrg kArr, 3
 printks "kAvrg = %.3f\n", 0, kAvrg
 kAvrg ArrAvrg kArr, 3, 6
 printks "kAvrg = %.3f\n", 0, kAvrg
 kAvrg ArrAvrg kArr, 6, 3 ;error
 printks "kAvrg = %.3f\n", 0, kAvrg
 kArr[8] = -100 ;change array
 kAvrg ArrAvrg kArr
 printks "kAvrg = %.3f\n", 0, kAvrg
 turnoff
 
endin

</CsInstruments>
<CsScore>
i "Test_i" 0 0
i "Test_k" 0 1
</CsScore>
</CsoundSynthesizer>
prints:

instr 1:  iAvrg = 5.000
instr 1:  iAvrg = 6.500
instr 1:  iAvrg = 5.000
ERROR in ArrAvrg: iEnd must be larger than iStart
instr 1:  iAvrg = 0.000
ERROR in ArrAvrg: iEnd must be larger than iStart
kAvrg = 5.000
kAvrg = 6.500
kAvrg = 5.000
kAvrg = -nan
kAvrg = -7.111


