/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN misc:
*****************************************************************************
DelTp      : aPitchShift DelTp aSnd, kPitch, kDelTim, iMaxDel
ExtrOrc    : Sorc ExtrOrc Sfil
OnDtct     : kOnset, kDb OnDtct aIn [,kDbDiff [,kMinTim [,kMinDb [,iRmsFreq [,iDelComp]]]]]
*****************************************************************************
****************************************************************************/

/****************************************************************************
aPitchShift DelTp aSnd, kPitch, kDelTim, iMaxDel
Delay line based pitch shift; optimized for very small latencies.

This is a version of the well-known strategy to use a variable delay line for
pitch shifting. It is based on the version by Victor Lazzarini in the Csound
Book (Springer 2017) in Listing 13.12 (online also here: 
https://github.com/csound/book/blob/master/part4/chapter13/13.12.orc).
The differences here are:
1. Use half sine rather than triangle as cross envelopes.
2. Use only one phasor and get the second one from it.
3. Use a small and always changing delay line which aims to allow very small
   latencies (< 1/100 sec) by avoiding amplitude modulating artefacts as much
   as possible.
written by joachim heintz

aSnd - audio input signal
kPitch - transposition as ratio (.5 = octave lower, 1.5 fifth higher etc)
kDelTim - the moving delay time signal (see below for an example)
iMaxDel - maximum possible delay time (sec)
aPitchShift - transposed (pitch shifted) sound
****************************************************************************/
/****************************************************************************
Sorc ExtrOrc Sfil
Extracts the orc part of a csd file.

Extracts the orc part (= the text in the <CsInstruments> tag) from the csd 
file Sfil, and returns it as string Sorc. Requires the UDO StripL.
written by joachim heintz

Sfil - csd file (either full path or name if in the same directory)
Sorc - orc part of Sfil as string
****************************************************************************/
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

opcode DelTp,a,akkp
 aSnd, kPitch, kDelTim, iMaxDel xin
 iEnvTable = ftgen(0,0,4096,9,.5,1,0)
 kPhasorFreq = -(kPitch-1) / kDelTim
 aPhasor_1 = phasor:a(kPhasorFreq)
 aPhasor_2 = (aPhasor_1+0.5) % 1
 aDelay_1 = vdelayx(aSnd,aPhasor_1*kDelTim,iMaxDel,4)
 aDelay_2 = vdelayx(aSnd,aPhasor_2*kDelTim,iMaxDel,4)
 aDelay_1 *= tablei:a(aPhasor_1,iEnvTable,1)
 aDelay_2 *= tablei:a(aPhasor_2,iEnvTable,1)
 xout aDelay_1+aDelay_2
endop

  opcode StripL, S, S
  ;strips all tabs or spaces at the left from an input string
Source     xin
Sin        strcpy     Source
iLen       strlen     Sin
again:
Sel        strsub     Sin, 0, 1
iSpace     strcmp     Sel, " "
iTab       strcmp     Sel, "	"
 ;if space or tab, remove it and go back if not end of string
if iSpace == 0 || iTab == 0 then
Sin        strsub     Sin, 1
iLen       =          iLen-1
 if iLen != 0 igoto again
endif
           xout       Sin
  endop

  opcode ExtrOrc, S, S
  ;extracts the orc part of a csd Sfile
Sfile      xin
iRead      init       0
Sorc       init       ""
read:
Sline, iLineNum readfi Sfile
 ;remove left side spaces or tabs to check tags
Slinestrp  StripL     Sline
 ;check for CsInstruments start tag
iIsStart   strindex   Slinestrp, "<CsInstruments>"
iIsEnd     strindex   Slinestrp, "</CsInstruments>"
 ;set toggle to read
 if iIsStart == 0 then
iRead      =          1
 elseif iIsEnd == 0 then
iRead      =          0
 endif
 ;collect lines inside the tags
if iRead == 1 && iIsStart != 0 then
Sorc       strcat     Sorc, Sline
endif
 ;go back if not eof or end tag
if iLineNum != -1 && iIsEnd != 0 igoto read
           xout       Sorc
  endop

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


