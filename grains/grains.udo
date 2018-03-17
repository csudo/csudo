/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN grains:
*****************************************************************************
GrPtkSmpA  : aout GrPtkSmpA ifiltab, iskip, kspeed, kgrainamp, kgrainrate, kgrainsize, kcent, kposrand, kcentrand, icosintab, idisttab, iwin
GrPtkSmpB  : apartikkel GrPtkSmpB ifiltab, apnter, kgrainamp, kgrainrate, kgrainsize, kcent, kposrand, kcentrand, icosintab, idisttab, iwin
GrPtkWrp   : aWrp GrPtkWrp aPos, iFilTab [,kAmp [,kCent [,kPosRnd [,kGrainRate [,kGrainSize [,kDistribution]]]]]]
*****************************************************************************
****************************************************************************/

/****************************************************************************
aout GrPtkSmpA ifiltab, iskip, kspeed, kgrainamp, kgrainrate, kgrainsize, kcent, kposrand, kcentrand, icosintab, idisttab, iwin
A simplified version of the Partikkel opcode, but with some additional parameters

A simplified version of the Partikkel opcode, but with some additional parameters. It performs asynchronous granular synthesis with a maximal displacement of 1/grainrate seconds.
written by joachim heintz

ifiltab - function table with the input sound file (usually with GEN01)
iskip - skiptime (sec)
icosintab - function table with cosine (e.g. giCosine ftgen 0, 0, 8193, 9, 1, 1, 90)
idisttab - function table with distribution (e.g. giDisttab ftgen 0, 0, 32768, 7, 0, 32768, 1)
iwin - function table with window shape (e.g. giWin ftgen 0, 0, 4096, 20, 9, 1)
kspeed - speed of the pointer
kgrainamp - multiplier of the grain amplitude (the overall amplitude depends also from grainrate and grainsize)
kgrainrate - number of grains per seconds
kgrainsize - grain duration in ms
kcent - transposition in cent
kposrand - random deviation (offset) of the pointer in ms
kcentrand - random transposition in cents (up and down) 
****************************************************************************/
/*length of input file*/
/*amplitude*/
/*transposition*/
/*pointer*/
/* other parameters */
/****************************************************************************
apartikkel GrPtkSmpB ifiltab, apnter, kgrainamp, kgrainrate, kgrainsize, kcent, kposrand, kcentrand, icosintab, idisttab, iwin
The same as PtkSmpA, but with a time pointer input

A simplified version of the Partikkel opcode, but with some additional parameters. It performs asynchronous granular synthesis with a maximal displacement of 1/grainrate seconds.
written by joachim heintz

ifiltab: function table with the input sound file (usually with GEN01)
icosintab: function table with cosine (e.g. giCosine ftgen 0, 0, 8193, 9, 1, 1, 90)
idisttab: function table with distribution (e.g. giDisttab ftgen 0, 0, 32768, 7, 0, 32768, 1)
iwin: function table with window shape (e.g. giWin ftgen 0, 0, 4096, 20, 9, 1)
apnter: pointer into the function table (0-1)
kgrainamp: multiplier of the grain amplitude (the overall amplitude depends also on grainrate and grainsize)
kgrainrate: number of grains per seconds
kgrainsize: grain duration in ms
kcent: transposition in cent
kposrand: random deviation (offset) of the pointer in ms
kcentrand: random transposition in cents (up and down) 
****************************************************************************/
/*amplitude*/
/*transposition*/
/* other parameters */
/****************************************************************************
aWrp GrPtkWrp aPos, iFilTab [,kAmp [,kCent [,kPosRnd [,kGrainRate [,kGrainSize [,kDistribution]]]]]]
Uses the partikkel opcode to do some sound warping, similar to sndwarp 

Uses the partikkel opcode to do standard sound warping like time freeze, stretch or compress, and pitch shift, on a table with one channel of an audio sample. The goal is to simplify the usage as much as possible, with just setting the position in the sound, and the GEN01 table as inputs. All other parameters are set to  default values.
General notes:
1. The quality of sound transformation with granular synthesis depends mainly on the combination of the different input parameters, at least grain rate, grain size and distribution. So you cannot expect to get excellent results with some default values. Try to use the optional inputs in case of bad results, and if you want to go very much in detail, use the partikkel opcode with all its flexibility. (See, for instance,  SF_Granular.csd in CsoundQt's example menu.)
2. Two function tables are generated from inside the UDO, which is actually bad style. The reason is not to bother the user with tables which are not important for him. But if you want to use this UDO in a real time context, you should definitely put the iWinTab and iDistTab tables outside the UDO.
3. The default values for grain rate (200 Hz) and grain size (100 ms) can be changed easily inside the UDO.
Requires Csound 5.18 or higher.
written by joachim heintz

aPos - position in the sound in seconds
iFilTab - function table containing the mono sound file (use GEN01 with 1 as last parameter to import any sample)
kAmp - amplitude (default = 1). note that the amplitude depends mainly on the combination of grain size and grain rate, so you cannot expect 0 dB when using kAmp=1
kCent - transposition in cent (default = 0)
kPosRnd - position randomness of the time pointer in the sound, in milliseconds (default=0). this can be used in combination with kDistribution to avoid artifacts deriving from synchronous granular synthesis
kGrainRate - grains per second (default = 200)
kGrainSize - grain size in milliseconds (default = 100)
kDistribution - distribution of the grains in time. 0 means periodic, 1 means scattered (which is the dafault), with any value in between possible
see the Csound Manual for partikkel for more information about the input parameters
****************************************************************************/

	opcode GrPtkSmpA, a, iikkkkkkkiii
ifiltab, iskip, kspeed, kgrainamp, kgrainrate, kgrainsize, kcent, kposrand, kcentrand, icosintab, idisttab, iwin xin

/*length of input file*/
itablen    tableng    ifiltab
ifilsr     =          ftsr(ifiltab)
ifildur    =          itablen / ifilsr
/*amplitude*/
kamp       =          kgrainamp * 0dbfs
/*transposition*/
kcentrand  rand       kcentrand; random transposition
iorig      =          1 / ifildur; original pitch
kwavfreq   =          iorig * cent(kcent + kcentrand)
/*pointer*/
istartpos  =          iskip / ifildur; start 0-1
afilposphas phasor    kspeed / ifildur, istartpos
arndpos    linrand    kposrand; random offset in phase values
asamplepos =          afilposphas + arndpos; resulting phase values (0-1)
/* other parameters */
imax_grains =         1000; maximum number of grains per k-period
idist      =          1; scattered distribution
async      =          0; no sync input
awavfm     =          0; no audio input for fm

aout       partikkel  kgrainrate, idist, idisttab, async, 1, iwin, \
-1, -1, 0, 0, kgrainsize, kamp, -1, \
kwavfreq, 0, -1, -1, awavfm, \
-1, -1, icosintab, kgrainrate, 1, \
1, -1, 0, ifiltab, ifiltab, ifiltab, ifiltab, \
-1, asamplepos, asamplepos, asamplepos, asamplepos, \
1, 1, 1, 1, imax_grains

           xout       aout
	endop

  opcode GrPtkSmpB, a, iakkkkkkiii
ifiltab, apnter, kgrainamp, kgrainrate, kgrainsize, kcent, kposrand, kcentrand, icosintab, idisttab, iwin xin

/*amplitude*/
kamp       =          kgrainamp * 0dbfs
/*transposition*/
kcentrand  rand       kcentrand; random transposition
iorig      =          1 / (ftlen(ifiltab)/sr); original pitch
kwavfreq   =          iorig * cent(kcent + kcentrand)
/* other parameters */
imax_grains =         1000; maximum number of grains per k-period
idist      =          1; scattered distribution
async      =          0; no sync input
awavfm     =          0; no audio input for fm

aout       partikkel  kgrainrate, idist, idisttab, async, 1, iwin, \
-1, -1, 0, 0, kgrainsize, kamp, -1, \
kwavfreq, 0, -1, -1, awavfm, \
-1, -1, icosintab, kgrainrate, 1, \
1, -1, 0, ifiltab, ifiltab, ifiltab, ifiltab, \
-1, apnter, apnter, apnter, apnter, \
1, 1, 1, 1, imax_grains
           xout       aout
  endop

  opcode GrPtkWrp, a, aiPOOOOP

aPos, iFilTab, kAmp, kCent, kPosRnd, kGrainRate, kGrainSize, kDistribution xin

;build tables for window shape and distribution
iWinTab    ftgentmp   0, 0, 4096, 20, 9, 1
iDistTab   ftgentmp   0, 0, 32768, 7, 0, 32768, 1

;resolve default parameters for grain size and grain rate
kGrainRate =          (kGrainRate == 0 ? 200 : kGrainRate)
kGrainSize =          (kGrainSize == 0 ? 100 : kGrainSize)

;transform position input from seconds to phase values (0-1)
iFilDur    =          ftlen(iFilTab)/ftsr(iFilTab)
aPos       =          aPos/iFilDur
kPosRnd    =          kPosRnd/1000/iFilDur

;calculate random deviations of the position for the four streams of grains
aRndPos1   random     0, kPosRnd
aRndPos2   random     0, kPosRnd
aRndPos3   random     0, kPosRnd
aRndPos4   random     0, kPosRnd
;add random deviation to the time pointer and make sure not to wrap around
aPos1      mirror     aPos+aRndPos1, 0, 1
aPos2      mirror     aPos+aRndPos2, 0, 1
aPos3      mirror     aPos+aRndPos3, 0, 1
aPos4      mirror     aPos+aRndPos4, 0, 1

;transposition
iOrigPitch =          1 / iFilDur; original pitch
kPitch     =          iOrigPitch * cent(kCent)

;other parameters
aSync      =          0; no sync input
aWavFM     =          0; no audio input for fm

aOut       partikkel  kGrainRate, kDistribution, iDistTab, aSync, 1, iWinTab, -1, -1, 0, 0, kGrainSize, kAmp/10, -1, kPitch, 0, -1, -1, aWavFM, -1, -1, iWinTab, kGrainRate, 1, 1, -1, 0, iFilTab, iFilTab, iFilTab, iFilTab, -1, aPos1, aPos2, aPos3, aPos4, 1, 1, 1, 1, 1000
           xout       aOut
  endop


