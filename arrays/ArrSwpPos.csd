/****************************************************************************
iOutArr[] ArrRtt iInArr[], iSwapPos[]
kOutArr[] ArrRtt kInArr[], kSwapPos[]
Swaps values pairwise in an array. The i/kSwapPos array contains pairs of position,
so must be of even length. 
written by joachim heintz

i(k)InArr[] - input array
i(k)SwapPos[] - array with pairs of indices to be swapped, like [0,2,3,5]
i(k)OutArr[] - output array
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>

<CsInstruments>
ksmps = 32

opcode ArrSwpPos, i[], i[]i[]
  iInArr[], iSwapPos[] xin
  iOutArr[] = iInArr
  indx = 0
  while (indx < lenarray(iSwapPos)) do
    indx_1,indx_2 = iSwapPos[indx],iSwapPos[indx+1]
    iVal_1,iVal_2 = iInArr[indx_1],iInArr[indx_2]
    iOutArr[indx_1],iOutArr[indx_2] = iVal_2,iVal_1
    indx += 2
  od
  xout(iOutArr)
endop

opcode ArrSwpPos, k[], k[]k[]
  kInArr[], kSwapPos[] xin
  kOutArr[] = kInArr
  kndx = 0
  while (kndx < lenarray(kSwapPos)) do
    kndx_1,kndx_2 = kSwapPos[kndx],kSwapPos[kndx+1]
    kVal_1,kVal_2 = kInArr[kndx_1],kInArr[kndx_2]
    kOutArr[kndx_1],kOutArr[kndx_2] = kVal_2,kVal_1
    kndx += 2
  od
  xout(kOutArr)
endop


instr Test_i

 prints("i-VERSION:\n")
 iArr[] = genarray(1,10)
 printarray(iArr, "%.0f", "input array:")
 iSwap[] = fillarray(0,2,4,9)
 printarray(iSwap, "%.0f", "swap positions:")
 iArr = ArrSwpPos(iArr,iSwap)
 printarray(iArr, "%.0f", "array after swap:")
   
endin

instr Test_k

 prints("k-VERSION:\n")
 kArr[] = genarray(1,10)
 printarray(kArr, "%.0f", "input array:")
 kSwap[] = fillarray(0,9,1,8)
 printarray(kSwap, "%.0f", "swap positions:")
 kArr = ArrSwpPos(kArr,kSwap)
 printarray(kArr, "%.0f", "array after swap:")
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
 1 2 3 4 5 6 7 8 9 10 
swap positions:
 0 2 4 9 
array after swap:
 3 2 1 4 10 6 7 8 9 5 
k-VERSION:
input array:
 1 2 3 4 5 6 7 8 9 10 
swap positions:
 0 9 1 8 
array after swap:
 10 9 3 4 5 6 7 8 2 1 
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
