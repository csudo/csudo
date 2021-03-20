

/*-------------------------------------------------------------------------
kOutArr[] DupArr kInArr1[], iDupInx,iHT

Duplicate a value for (iHT)Times
	iDupInx: number of index for duplicated value
	iHT:		How many Times will be duplicated
	
kOutArr[] - output array 
-------------------------------------------------------------------------*/


<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1



opcode DupArr, k[], k[]ii
 kInArr [], iDupInx,iHT xin
 kOutArr[] init (lenarray:i(kInArr)+iHT)
 kDupNote  = kInArr[iDupInx]
 kStart    = 0
 kDupCount = iDupInx
 kEnd      = iDupInx
 kRead     = 0
while kRead < lenarray(kInArr) do
	kOutArr [kStart] = kInArr[kStart]
	kOutArr[kDupCount] = kDupNote
	kOutArr[kEnd+iHT] = kInArr[kEnd]
	kStart += 1
		if kStart >=iDupInx then
			kStart = iDupInx
		endif
	kDupCount += 1
		if kDupCount >= (iDupInx+iHT) then
			kDupCount = iDupInx+iHT
		endif
	kEnd += 1
		if kEnd >= lenarray(kInArr) then
			kEnd =lenarray(kInArr)-1
		endif
	kRead += 1
od
 xout kOutArr
endop


instr 1
iDupInx = 2 
iHT     = 1
kArrIn  [] fillarray 60,61,62,63,68,69
kArrOut [] DupArr kArrIn, iDupInx,iHT
printarray kArrIn,-1, "%.0f", "Dublicated value:"
turnoff
endin

</CsInstruments>
<CsScore>
i 1 0 1
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>0</width>
 <height>0</height>
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
