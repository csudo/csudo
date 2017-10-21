/****************************************************************************
ift BufFiCt1 Sfilenam [, iftnum [, inorm]]
creates a gen01 function table from a mono soundfile 

Creates a gen01 function table from a mono soundfile. This is nothing else than a simplification of creating the same with a ftgen statement.
Use BufFiCtNd to create a non-deferred function table from a soundfile 
written by joachim heintz

Sfilenam - file name or path as string
iftnum - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
inorm - if zero, the table is not normalized. This is also the default, while any other number creates a normalized table
ift - output table number
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-o dac -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

  opcode BufFiCt1, i, Soo
Sfilenam, iftnum, inorm xin
igen      =         (inorm == 0 ? -1 : 1)
ift       ftgen     iftnum, 0, 0, igen, Sfilenam, 0, 0, 1
          xout      ift  
  endop

  opcode BufFiPl1, a, ikkkop
ifn, kplay, kspeed, kvol, iskip, iwrap xin
;plays a file from a buffer. if iwrap=0 the file is just played once (stops at end of table for positive speed and at start of table for negative speed), or stops if the direction of speed changes.
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
          xout      asig
  endop
    
	
instr 1
ifil      BufFiCt1  "../../_sourcefiles/fox.wav"
asample   BufFiPl1	 ifil, 1, p4, p5, p6, p7 ;speed vol skip wrap
          out       asample
endin


</CsInstruments>
<CsScore>
;         speed vol skip wrap
i 1 0 5   1.2   1   0    1
i . 6 .   .7    1   0    0
i . 12 .  -1    .5  0    0
i . 16 .  1     1   1.2  0
e
</CsScore>
</CsoundSynthesizer>
