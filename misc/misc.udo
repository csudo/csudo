/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN misc:
*****************************************************************************
ExtrOrc    : Sorc ExtrOrc Sfil
OnDtct     : kOnset, kDb OnDtct aIn [,kDbDiff [,kMinTim [,kMinDb [,iRmsFreq [,iDelComp]]]]]
*****************************************************************************
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


