/****************************************************************************
iOutArr[] ArrRtt iInArr[] [,iRot]
kOutArr[] ArrRtt kInArr[] [,kRot]
Rotates an array for N positions (positive = right, negative = left)
and returns the result as new array.
written by joachim heintz

i(k)InArr[] - input array
iRot - positions to rotate right or left (default=1)
i(k)OutArr[] - output array
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>

<CsInstruments>
ksmps = 32

opcode ArrRtt, i[], i[]p
 iInArr[], iPos xin
 iLen lenarray iInArr
 iOutArr[] init iLen
 iPos = (iPos < 0) ? iLen-(abs(iPos%iLen)) : iPos
 indx = 0
 while indx < iLen do
  iOutArr[indx] = iInArr[(iPos+indx)%iLen]
  indx += 1
 od
 xout iOutArr
endop

opcode ArrRtt, k[], k[]P
 kInArr[], kPos xin
 iLen lenarray kInArr
 kOutArr[] init iLen
 kPos = (kPos < 0) ? iLen-(abs(kPos%iLen)) : kPos
 kndx = 0
 while kndx < iLen do
  kOutArr[kndx] = kInArr[(kPos+kndx)%iLen]
  kndx += 1
 od
 xout kOutArr
endop


instr Test_i

 prints "i-VERSION:\n"
 iInArr[] fillarray 1, 2, 3, 4, 5
 printarray iInArr, "%.0f", "input array:"
 iOutArr[] ArrRtt iInArr
 printarray iOutArr, "%.0f", "default rotation (iRot=1):"
 iOutArr[] ArrRtt iInArr, -1
 printarray iOutArr, "%.0f", "rotation iRot = -1:"
 iOutArr[] ArrRtt iInArr, 4
 printarray iOutArr, "%.0f", "rotation iRot = 4:"
 iOutArr[] ArrRtt iInArr, 5
 printarray iOutArr, "%.0f", "rotation iRot = 5:"
 iOutArr[] ArrRtt iInArr, -5
 printarray iOutArr, "%.0f", "rotation iRot = -5:"
 iOutArr[] ArrRtt iInArr, -6
 printarray iOutArr, "%.0f", "rotation iRot = -6:"
 iOutArr[] ArrRtt iInArr, 7
 printarray iOutArr, "%.0f", "rotation iRot = 7:"
   
endin

instr Test_k

 prints "\nk-VERSION:\n"
 kInArr[] fillarray 1, 2, 3, 4, 5
 printarray kInArr, 1, "%.0f", "input array:"
 kOutArr[] ArrRtt kInArr
 printarray kOutArr, 1, "%.0f", "default rotation (kRot=1):"
 kOutArr[] ArrRtt kInArr, -1
 printarray kOutArr, 1, "%.0f", "rotation kRot = -1:"
 kOutArr[] ArrRtt kInArr, 4
 printarray kOutArr, 1, "%.0f", "rotation kRot = 4:"
 kOutArr[] ArrRtt kInArr, 5
 printarray kOutArr, 1, "%.0f", "rotation kRot = 5:"
 kOutArr[] ArrRtt kInArr, -5
 printarray kOutArr, 1, "%.0f", "rotation kRot = -5:"
 kOutArr[] ArrRtt kInArr, -6
 printarray kOutArr, 1, "%.0f", "rotation kRot = -6:"
 kOutArr[] ArrRtt kInArr, 7
 printarray kOutArr, 1, "%.0f", "rotation kRot = 7:"

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
 1 2 3 4 5 
default rotation (iRot=1):
 2 3 4 5 1 
rotation iRot = -1:
 5 1 2 3 4 
rotation iRot = 4:
 5 1 2 3 4 
rotation iRot = 5:
 1 2 3 4 5 
rotation iRot = -5:
 1 2 3 4 5 
rotation iRot = -6:
 5 1 2 3 4 
rotation iRot = 7:
 3 4 5 1 2 

k-VERSION:
input array:
 1 2 3 4 5 
default rotation (kRot=1):
 2 3 4 5 1 
rotation kRot = -1:
 5 1 2 3 4 
rotation kRot = 4:
 5 1 2 3 4 
rotation kRot = 5:
 1 2 3 4 5 
rotation kRot = -5:
 1 2 3 4 5 
rotation kRot = -6:
 5 1 2 3 4 
rotation kRot = 7:
 3 4 5 1 2 

