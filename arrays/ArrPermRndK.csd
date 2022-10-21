/****************************************************************************
kOutArr[] ArrPermRnd kInArr[]
Returns an array which contains randomly permuted elements the input array. In contrary 
to ArrPermRnd there is no i-time operation — all is done at performance.
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.
written by joachim heintz

kInArr[] - input array
kOutArr[] - output array with randomly permuted elements of kInArr
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32
seed 0


opcode ArrPermRndK, k[], k[]
 kInArr[] xin
 kOutArr[] = kInArr
 kIndx = 0
 kOutLen = lenarray:k(kOutArr)
 kReadLen = kOutLen
 while kIndx < kOutLen do
  kRndIndx = int(random:k(0,kReadLen-.0001))
  kOutArr[kIndx] = kInArr[kRndIndx]
  while kRndIndx < kReadLen-1 do
   kInArr[kRndIndx] = kInArr[kRndIndx+1]
   kRndIndx += 1
  od
 kReadLen -= 1
 kIndx += 1
 od
 xout kOutArr
endop

opcode MyArr, k[], k
 //returns array at k-rate (default for maximum length is 1000)
 kLen xin
 kArr[] init 1000
 trim(kArr,kLen)
 xout kArr
endop

opcode Fill, k[], k[]
 //fills the input array with 1, 2, 3, ...
 kArr[] xin
 kIndx = 0
 while kIndx < lenarray:k(kArr) do
 	kArr[kIndx] = kIndx+1
 	kIndx += 1
 od
 xout kArr
endop


instr Permut

 kLen = int(random:k(5,10))
 printks("Length = %d\n",0,kLen)
 kEmpty[] = MyArr(kLen)
 kArr[] = Fill(kEmpty)
 kPerm[] = ArrPermRndK(kArr)
 printarray kPerm
 kLen = int(random:k(5,10))
 printks("Length = %d\n",0,kLen)
 kEmpty[] = MyArr(kLen)
 kArr[] = Fill(kEmpty)
 kPerm[] = ArrPermRndK(kArr)
 printarray kPerm
 kLen = int(random:k(5,10))
 printks("Length = %d\n",0,kLen)
 kEmpty[] = MyArr(kLen)
 kArr[] = Fill(kEmpty)
 kPerm[] = ArrPermRndK(kArr)
 printarray kPerm
 turnoff

endin

</CsInstruments>
<CsScore>
i "Permut" 0 .01
</CsScore>
</CsoundSynthesizer>
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
