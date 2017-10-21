/****************************************************************************
a1, a2, a3, a4, a5, a6, a7, a8 BufFiPl8 ifn1, ifn2, ifn3, ifn4, ifn5, ifn6, ifn7, ifn8, kplay, kspeed, kvol [, iskip [, iwrap]]
Plays an eight channel sample from eight GEN01 function tables, including sample rate conversion

Plays an eight channel sample from eight GEN01 function tables, including sample rate conversion. The input parameters are similar to diskin (speed, loop play or play once, skiptime) plus a factor for amplitude scaling.
See the UDO BufPlay for playing any buffer, with some more options, but without sample rate conversion.
written by joachim heintz

ifn1 - number of the function table which contains channel 1 of the sample (use GEN01 with 1 for the channel parameter - any other GEN routine will lead to an error because it does not contain the sample rate of the soundfile)
(you can also use BufFiCt8 for creating the tables for all channels - see the example below)
ifn2 - number of the function table which contains channel 2 of the sample (use the same f-statement as for ifnL but with 2 for the channel parameter)
ifn3 - number of the function table for the 3. channel
ifn4 - number of the function table for the 4. channel
ifn5 - number of the function table for the 5. channel
ifn6 - number of the function table for the 6. channel
ifn7 - number of the function table for the 7. channel
ifn8 - number of the function table for the 8. channel
iskip - skiptime (sec)
iwrap - iwrap=0 plays the file is just once (stops at end of table for positive speed and at start of table for negative speed), or stops if the direction of speed changes. the default is 1 (loop play)
kplay - 1 plays the table, 0 or any other number stops playing
kspeed - speed and direction (negative = backwards) of the pointer through the sample, e.g. 1 = normal, 2 = double (=octave higher), -0.5 = half (octave lower) and backwards
kvol - ampltude scaling factor (1 = original amplitude)
a1 - audio output channel 1
a2 - audio output channel 2
a3 - audio output channel 3
a4 - audio output channel 4
a5 - audio output channel 5
a6 - audio output channel 6
a7 - audio output channel 7
a8 - audio output channel 8
kfin - 1 if iwrap=0 and playback has finished, otherwise 0  
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-o dac -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1


  opcode BufFiPl1, ak, ikkkop
ifn, kplay, kspeed, kvol, iskip, iwrap xin
;plays a file from a buffer. if iwrap=0 the file is just played once (stops at end of table for positive speed and at start of table for negative speed), or stops if the direction of speed changes. the sample rate of the sample is converted to the sample rate of the orchestra
;SAFETY CHECK IF THE TABLE IS REALLY GENERATED BY GEN01
if ftsr(ifn) == 0 then
 prints    "ERROR!\n FUNCTION TABLE %d HAS NO SAMPLE RATE VALUE (NOT GENERATED BY GEN01?)\n", ifn
 prints    "PERFORMANCE HAS BEEN TURNED OF.\n"
 turnoff
endif
iftlen    =         ftlen(ifn)/ftsr(ifn)
kcps      =         kspeed / iftlen
iphs      =         iskip / iftlen
kfin      init      0
;CALCULATIONS ONLY REQUIRED FOR WRAP=0
if iwrap == 0 then
kndx      phasor    kcps, iphs
kfirst    init      1 ;don't check condition below at the first k-cycle (always true)
kprevndx  init      0
 ;end of table check:
  ;for positive speed, check if this index is lower than the previous one
  if kfirst == 0 && kspeed > 0 && kndx < kprevndx then 
kfin      =         1
  else
 ;for negative speed, check if this index is higher than the previous one
kprevndx  =         (kprevndx == iphs ? 1 : kprevndx) 
   if kfirst == 0 && kspeed < 0 && kndx > kprevndx then
kfin      =         1
   endif
kfirst    =         0 ;end of first cycle in wrap = 0
  endif
kprevndx  =         kndx ;next previous is this index
endif
;READING THE SOUND WITH POSCIL3
if kplay == 1 && kfin == 0 then
asig      poscil3   kvol, kcps, ifn, iphs
else
asig      =         0
endif
          xout      asig, kfin
  endop
  
  opcode BufFiPl8, aaaaaaaak, iiiiiiiikkkop
ifn1, ifn2, ifn3, ifn4, ifn5, ifn6, ifn7, ifn8, kplay, kspeed, kvol, iskip, iwrap xin
a1, kfin  BufFiPl1  ifn1, kplay, kspeed, kvol, iskip, iwrap
a2, kfin  BufFiPl1  ifn2, kplay, kspeed, kvol, iskip, iwrap
a3, kfin  BufFiPl1  ifn3, kplay, kspeed, kvol, iskip, iwrap
a4, kfin  BufFiPl1  ifn4, kplay, kspeed, kvol, iskip, iwrap
a5, kfin  BufFiPl1  ifn5, kplay, kspeed, kvol, iskip, iwrap
a6, kfin  BufFiPl1  ifn6, kplay, kspeed, kvol, iskip, iwrap
a7, kfin  BufFiPl1  ifn7, kplay, kspeed, kvol, iskip, iwrap
a8, kfin  BufFiPl1  ifn8, kplay, kspeed, kvol, iskip, iwrap
          xout      a1, a2, a3, a4, a5, a6, a7, a8, kfin
  endop
  
  opcode BufFiCt8, iiiiiiii, Sooooooooo
;creates eight gen01 function tables from an eight channel soundfile  
Sfilenam, ifn1, ifn2, ifn3, ifn4, ifn5, ifn6, ifn7, ifn8, inorm xin ;filename, numbers of ftables (0=automatic(=default)), normalization (1=yes, 0=no(=default))
igen      =         (inorm == 0 ? -1 : 1)
ift1      ftgen     ifn1, 0, 0, igen, Sfilenam, 0, 0, 1
ift2      ftgen     ifn2, 0, 0, igen, Sfilenam, 0, 0, 2
ift3      ftgen     ifn3, 0, 0, igen, Sfilenam, 0, 0, 3
ift4      ftgen     ifn4, 0, 0, igen, Sfilenam, 0, 0, 4
ift5      ftgen     ifn5, 0, 0, igen, Sfilenam, 0, 0, 5
ift6      ftgen     ifn6, 0, 0, igen, Sfilenam, 0, 0, 6
ift7      ftgen     ifn7, 0, 0, igen, Sfilenam, 0, 0, 7
ift8      ftgen     ifn8, 0, 0, igen, Sfilenam, 0, 0, 8
          xout      ift1, ift2, ift3, ift4, ift5, ift6, ift7, ift8
  endop
  
	
instr 1
gi1,gi2, gi3, gi4, gi5, gi6, gi7, gi8   BufFiCt8  "../../_sourcefiles/8_channel_file.wav"
endin

instr 2
a1,a2,a3,a4,a5,a6,a7,a8,kfin BufFiPl8	 gi1, gi2, gi3, gi4, gi5, gi6, gi7, gi8, 1, p4, p5/4, p6, p7 ;speed vol skip wrap
 if p7 == 0 && kfin == 1 then
          printks   "Playback finished!\n", 10
 endif
          outs       a1+a2+a3+a4, a5+a6+a7+a8
endin


</CsInstruments>
<CsScore>
i 1 0 21
;         speed vol skip wrap
i 2 0 5   1.2   1   0    1
i . 6 .   .7    1   0    0
i . 12 .  -1    .5  0    0
i . 16 .  1     1   1.2  0
e
</CsScore>
</CsoundSynthesizer>

