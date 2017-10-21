/****************************************************************************
iftL, iftR, ilen BufFiCtNd2 Sfilenam [, ichnL [, ichnR [, iftnumL [, iftnumR [, inorm]]]]]
creates two non deferred function tables from a stereo soundfile and returns the length

Creates two non deferred function tables from a stereo (or any multichannel) soundfile and returns the length as table size (= sample frames). This can be useful is you want to use opcodes (for instance table3) which do not work with deferred size function tables
written by joachim heintz

Sfilenam - file name or path as string
ichnL, ichnR - channels in Sfilenam to read (default = 1 for ichnL and 2 for ichnR)
iftnumL, iftnumR - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
inorm - if zero, the table is not normalized. This is also the default, while any other number creates a normalized table
iftL, iftR - output table number
ilen - length of the function table created (which is also the length of the soundfile in samples)
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-d -o dac
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

  opcode BufFiCtNd2, iii, Sjjpoo
Sfilenam, ichnL, ichnR, iftnumL, iftnumR, inorm xin 
ichnL     =         (ichnL == -1 ? 1 : ichnL) ;default for chnL = 1
ichnR     =         (ichnR == -1 ? 2 : ichnR) ;default for chnR = 2
igen      =         (inorm == 0 ? -1 : 1)
ifttmpL   ftgen     0, 0, 0, igen, Sfilenam, 0, 0, ichnL
ifttmpR   ftgen     0, 0, 0, igen, Sfilenam, 0, 0, ichnR
ilen      tableng   ifttmpL
iftL      ftgen     iftnumL, 0, -ilen, -2, 0
iftR      ftgen     iftnumR, 0, -ilen, -2, 0
          vcopy_i   iftL, ifttmpL, ilen
          vcopy_i   iftR, ifttmpR, ilen
          ftfree    ifttmpL, 0
          ftfree    ifttmpR, 0
          xout      iftL, iftR, ilen
  endop
  
  opcode BufPlay1, ak, ikkkkkk
ift, kplay, kspeed, kvol, kstart, kend, kwrap xin
;kstart = begin of playing the buffer in seconds
;kend = end of playing in seconds. 0 means the end of the table
;kwrap = 0: no wrapping. stops at kend (positive speed) or kstart (negative speed). this makes just sense if the direction does not change and you just want to play the table once 
;kwrap = 1: wraps between kstart and kend
;kwrap = 2: wraps between 0 and kend
;kwrap = 3: wraps between kstart and end of table
;CALCULATE BASIC VALUES
kfin		init		0
iftlen		=		ftlen(ift)/sr ;ftlength in seconds
kend		=		(kend == 0 ? iftlen : kend) ;kend=0 means end of table
kstart01	=		kstart/iftlen ;start in 0-1 range
kend01		=		kend/iftlen ;end in 0-1 range
kfqbas		=		(1/iftlen) * kspeed ;basic phasor frequency
;DIFFERENT BEHAVIOUR DEPENDING ON WRAP:
if kplay == 1 && kfin == 0 then
 ;1. STOP AT START- OR ENDPOINT IF NO WRAPPING REQUIRED (kwrap=0)
 if kwrap == 0 then
kfqrel		=		kfqbas / (kend01-kstart01) ;phasor freq so that 0-1 values match distance start-end
andxrel	phasor 	kfqrel ;index 0-1 for distance start-end
andx		=		andxrel * (kend01-kstart01) + (kstart01) ;final index for reading the table (0-1)
kfirst		init		1 ;don't check condition below at the first k-cycle (always true)
kndx		downsamp	andx
kprevndx	init		0
 ;end of table check:
  ;for positive speed, check if this index is lower than the previous one
  if kfirst == 0 && kspeed > 0 && kndx < kprevndx then 
kfin		=		1
 ;for negative speed, check if this index is higher than the previous one
  else
kprevndx	=		(kprevndx == kstart01 ? kend01 : kprevndx) 
   if kfirst == 0 && kspeed < 0 && kndx > kprevndx then
kfin		=		1
   endif
kfirst		=		0 ;end of first cycle in wrap = 0
  endif
 ;sound out if end of table has not yet reached
asig		table3		andx, ift, 1	
kprevndx	=		kndx ;next previous is this index
 ;2. WRAP BETWEEN START AND END (kwrap=1)
 elseif kwrap == 1 then
kfqrel		=		kfqbas / (kend01-kstart01) ;same as for kwarp=0
andxrel	phasor 	kfqrel 
andx		=		andxrel * (kend01-kstart01) + (kstart01) 
asig		table3		andx, ift, 1	;sound out
 ;3. START AT kstart BUT WRAP BETWEEN 0 AND END (kwrap=2)
 elseif kwrap == 2 then
kw2first	init		1 
  if kw2first == 1 then ;at first k-cycle:
		reinit		wrap3phs ;reinitialize for getting the correct start phase
kw2first	=		0 
  endif
kfqrel		=		kfqbas / kend01 ;phasor freq so that 0-1 values match distance start-end
wrap3phs:
andxrel	phasor 	kfqrel, i(kstart01) ;index 0-1 for distance start-end
		rireturn	;end of reinitialization
andx		=		andxrel * kend01 ;final index for reading the table 
asig		table3		andx, ift, 1	;sound out
 ;4. WRAP BETWEEN kstart AND END OF TABLE(kwrap=3)
 elseif kwrap == 3 then
kfqrel		=		kfqbas / (1-kstart01) ;phasor freq so that 0-1 values match distance start-end
andxrel	phasor 	kfqrel ;index 0-1 for distance start-end
andx		=		andxrel * (1-kstart01) + kstart01 ;final index for reading the table 
asig		table3		andx, ift, 1	
 endif
else ;if either not started or finished at wrap=0
asig		=		0 ;don't produce any sound
endif
  		xout		asig*kvol, kfin
  endop
    
  opcode BufPlay2, aak, iikkkkkk
iftL, iftR, kplay, kspeed, kvol, kstart, kend, kwrap xin  
aL, kfin	BufPlay1	iftL, kplay, kspeed, kvol, kstart, kend, kwrap
aR, kfin	BufPlay1	iftR, kplay, kspeed, kvol, kstart, kend, kwrap
		xout		aL, aR, kfin
  endop

    
	
instr 1
giL,giR,ilen BufFiCtNd2 "../../_sourcefiles/2_channel_file.wav" ;creates two non-deferred function tables containing the sample
endin

instr 2
aL,aR,k0  BufPlay2	 giL, giR, 1, p4, 1, p5, p6, p7 ;speed (vol) start end wrap
          outs      aL,aR
endin


</CsInstruments>
<CsScore>
i 1 0 41
;         speed start end wrap
i 2 0 5   1     0     0   0   ;play all but stop (wrap=0) after reaching the end
i . 6 5   2     1     2   0   ;play from sec 1 to 2 in the file in double speed
i . 12 5  -.5   0.5   2   0   ;play from sec 2 to 0.5 backwards, half speed
i . 18 5  1     0.5   2   1   ;wrap between start and end
i . 24 5  -1    0.5   2   1   ;the same backwards
i . 30 5  1     1     2   2   ;start at sec 1, then wrap between 0 and end
i . 36 5  1     1     2   3   ;wrap between start and end of table
e
</CsScore>
</CsoundSynthesizer>

