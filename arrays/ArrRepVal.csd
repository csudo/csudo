/**********************************************************************
kOutArr[] ArrRepVal kInArr1[], iRepInx, iRep
iOutArr[] ArrRepVal iInArr1[], iRepInx, iRep

Repeats a value in an array for iRep times.
Written by Parham Izadyar and joachim heintz

i|kInArr[] - input array
iRepInx - index of value to be repeated
iRep - number of repetitions
i|kOutArr[] - output array 
***********************************************************************/


<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

//k-rate version
opcode ArrRepVal, k[], k[]ii
 kInArr[], iRepInx, iRep xin
 kOutArr[] init lenarray:i(kInArr)+iRep
 kRepNote = kInArr[iRepInx]
 kStart = 0
 kRepCount = iRepInx
 kEnd = iRepInx
 kRead = 0
 while kRead < lenarray(kInArr) do
	 kOutArr[kStart] = kInArr[kStart]
	 kOutArr[kRepCount] = kRepNote
	 kOutArr[kEnd+iRep] = kInArr[kEnd]
	 kStart += 1
		if kStart >=iRepInx then
			kStart = iRepInx
		endif
 	kRepCount += 1
		if kRepCount >= (iRepInx+iRep) then
			kRepCount = (iRepInx+iRep)
		endif
	 kEnd += 1
		if kEnd >= lenarray(kInArr) then
			kEnd = (lenarray(kInArr)-1)
		endif
	 kRead += 1
 od
 xout kOutArr
endop

//i-rate version
opcode ArrRepVal, i[], i[]ii
 iInArr[], iDupInx, iRep xin
 iOutArr[] init lenarray(iInArr)+iRep
 iIndex = 0
 iWriteDups = 0
 while iIndex < iDupInx do
	 iOutArr[iIndex] = iInArr[iIndex]
	 iIndex += 1
 od
 while iWriteDups < iRep do
  iOutArr[iIndex+iWriteDups] = iInArr[iIndex]
  iWriteDups += 1
 od
 while iIndex < lenarray(iInArr) do
  iOutArr[iIndex+iWriteDups] = iInArr[iIndex]
  iIndex += 1
 od
 xout iOutArr
endop

//example
instr 1
prints "\n  **k-rate version**\n"
iRepInx = 3
iRep = 2
kArrIn[] fillarray 60,61,62,63,68,69
kArrOut[] ArrRepVal kArrIn, iRepInx, iRep
printarray kArrIn, 1, "%.0f", "Original array:"
printarray kArrOut, 1, "%.0f", "Array with repeated value (index=3, rep=2):"
turnoff
endin

instr 2
prints "\n  **i-rate version**\n"
iRepInx = 3
iRep = 2
iArrIn[] genarray 60, 70
iArrOut[] ArrRepVal iArrIn, iRepInx, iRep
printarray iArrIn, "%.0f", "Original array:"
printarray iArrOut, "%.0f", "Array with repeated value (index=3, rep=2):"
endin

</CsInstruments>
<CsScore>
i 1 0 .1
i 2 .1 0
</CsScore>
</CsoundSynthesizer>

prints:
 
  **k-rate version**
Original array:
 60 61 62 63 68 69 
Array with repeated value (index=3, rep=2):
 60 61 62 63 63 63 68 69 

  **i-rate version**
Original array:
 60 61 62 63 64 65 66 67 68 69 70 
Array with repeated value (index=3, rep=2):
 60 61 62 63 63 63 64 65 66 67 68 69 70 
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
