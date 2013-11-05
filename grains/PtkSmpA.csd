/****************************************************************************
aout PtkSmpA ifiltab, iskip, kspeed, kgrainamp, kgrainrate, kgrainsize, kcent, kposrand, kcentrand, icosintab, idisttab, iwin
A simplified version of the Partikkel opcode, but with some additional parameters

A simplified version of the Partikkel opcode, but with some additional parameters. It performs asynchronous granular synthesis with a maximal displacement of 1/grainrate seconds.

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
kcentrand - random transposition in cents (up and down) ****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-o dac -d
</CsOptions>
<CsInstruments>

giCosine   ftgen      0, 0, 8193, 9, 1, 1, 90;cosine
giDisttab  ftgen      0, 0, 32768, 7, 0, 32768, 1; for kdistribution
giFile     ftgen      0, 0, 0, 1, "../_sourcefiles/fox.wav", 0, 0, 1
giWin      ftgen      0, 0, 4096, 20, 9, 1; window

	opcode PtkSmpA, a, iikkkkkkkiii
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

instr 1
iskip      =          p4
ispeed     =          p5
icent      =          p6
apartikkel PtkSmpA    giFile, iskip, ispeed, .1, 100, 30, icent, 0, 0, giCosine, giDisttab, giWin
           out        apartikkel
endin
</CsInstruments>
<CsScore>
;i1	st dur   skip speed cent
i1  0  2.757 0    1     0	
i1  3  3	     1.2  .5    400
i1  6  5.514 0    -1.5  -400
e
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
