/****************************************************************************
kOnset, kDb OnDtct aIn [,kDbDiff [,kMinTim [,kMinDb [,iRmsFreq [,iDelComp]]]]]
Detects onsets (attacks). Returns also the dB of the rms at this time.

Onset detection is done via the comparision of the current rms value with the
rms value kDelTim seconds before. If the current rms is lager than kDbDiff decibel
compared to the one kDelTim seconds before, an onset is detected. Further conditions
are that kMinTime has passed since the last detection, and the rms value for the 
onset is larger that kMinDb. The velocity of the rms measurement can be adjusted 
with the iRmsFreq parameter.
Note that the kDb output is "too early" for a good estimation of the onset's 
intensity. As the example below shows, it can be taken a short time later.
written by joachim heintz

aIn - audio input signal
kDbDiff - dB difference to signify an offset (default = 10)
kMinTim - minimum time in seconds between two onsets (default = 0.1)
kMinDb - minimum dB to detect an offset (default = -50)
kDelTim - time in seconds which is compared to the current rms (default = 0.025)
iRmsFreq - approximate frequency for rms measurements (default = 50)
kOnset - 1 if onset is detected, otherwise 0
kDb - dB value in the moment of onset detection. Note that this is not the 
      perceived intensity of the beat. About 20 ms later should give a fair result.
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-m128 -o beats_onsetdetect_wav
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

opcode OnDtct, kk, aOOOOo

 aIn, kDbDiff, kMinTim, kMinDb, kDelTim, iRmsFreq xin
 
 //resolving defaults
 kDbDiff = (kDbDiff==0) ? 10 : kDbDiff
 kMinTim = (kMinTim==0) ? 0.1 : kMinTim
 kMinDb = (kMinDb==0) ? -50 : kMinDb
 kDelTim = (kDelTim==0) ? 0.025 : kDelTim
 iRmsFreq = (iRmsFreq==0) ? 50 : iRmsFreq
 
 kPrevDetect init 0.1
 iMaxDelTim init 0.5
 kOnset init 0

 kRms rms aIn,iRmsFreq
 kDb = dbamp(kRms)
 kDelRms vdelayk kDb, kDelTim, iMaxDelTim
 
 if (kDb>kDelRms+kDbDiff) && (kDb>kMinDb) && (kPrevDetect>kMinTim) then
  kOnset = 1
  kPrevDetect = 0
 else
  kOnset = 0
 endif

 kPrevDetect += 1/kr
 
 xout kOnset, kDb

endop


instr Detect

 //input sound and onset detection
 aSound diskin "../_sourcefiles/beats.wav"
 kOnset,kRms OnDtct aSound,6
 
 //trigger instrument on onset
 if kOnset == 1 then
  schedulek("Play",0,1/10)
 endif
 
 //show db value 1/20 sec later for intensity estimation
 kOnsetDelay delayk kOnset, 20/1000
 kCount init 1
 if kOnsetDelay == 1 then
  printks "Beat %d: %.1f dB\n", 0, kCount, kRms
  kCount += 1
 endif
 
 outch 1, aSound

endin

instr Play //render to file to see the result

 aPlay mpulse 1, p3+1
 outch 2, aPlay

endin

</CsInstruments>
<CsScore>
i "Detect" 0 3
</CsScore>
</CsoundSynthesizer>

prints:
Beat 1: -4.6 dB
Beat 2: -13.6 dB
Beat 3: -7.2 dB
Beat 4: -13.6 dB
Beat 5: -7.2 dB
Beat 6: -12.3 dB
Beat 7: -21.1 dB
Beat 8: -10.2 dB
Beat 9: -17.9 dB
Beat 10: -14.4 dB

