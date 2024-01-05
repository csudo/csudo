/****************************************************************************
aRes CmbRsn aIn, iFreqs[], iRvrbtm, kAmp[, indx]
A resonator from an array of comb filters.

written by joachim heintz

aIn - audio input signal
iFreqs[] - array with frequencies of the single resonator partials
iRvrbtm - reverb time as defined in the comb opcode
kAmp - amplitude
indx - first index in iFreqs[] (default=0)
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-m128 -odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

opcode CmbRsn,a,ai[]iko
  aIn,iFreqs[],iRvrbtm,kAmp,indx xin
  aComb = comb(aIn*kAmp,iRvrbtm,1/iFreqs[indx])
  if (indx+1 < lenarray(iFreqs)) then
    aComb += CmbRsn(aIn,iFreqs,iRvrbtm,kAmp,indx+1)
  endif
  xout aComb
endop

instr WineGlass
  aImp = mpulse(1,1)
  iRt = 2
  iF[] = fillarray(	1000, 2320, 4250, 6630, 9380)
  aOut = CmbRsn(aImp,iF,iRt,.1)
  outall(aOut)
endin

</CsInstruments>
<CsScore>
i "WineGlass" 0 10
</CsScore>
</CsoundSynthesizer>
