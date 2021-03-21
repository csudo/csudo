

/**********************************************************************
kOutArr[] ArrRepVal kInArr1[], iRepInx,iRep

Repeats a value for (iRep)Times
	iRepInx: number of index for Repeating value
	iRep:		How many Times will be Repeated
	written by Parham Izadyar
	
kOutArr[] - output array 
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



opcode ArrRepVal, k[], k[]ii
 kInArr [], iRepInx,iRep xin
 kOutArr[]  init (lenarray:i(kInArr)+iRep)
 kRepNote  = kInArr [iRepInx]
 kStart    = 0
 kRepCount = iRepInx
 kEnd      = iRepInx
 kRead     = 0
while kRead < lenarray(kInArr) do
	kOutArr [kStart] = kInArr[kStart]
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


instr 1
iRepInx = 3
iRep     = 1
kArrIn  [] fillarray 60,61,62,63,68,69
kArrOut [] ArrRepVal kArrIn, iRepInx,iRep
printarray kArrOut,1, "%.0f", "Array with Repeated value:"
turnoff
endin

</CsInstruments>
<CsScore>
i 1 0 1
</CsScore>
</CsoundSynthesizer>

