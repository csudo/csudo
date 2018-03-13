/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN buffers/record_and_play:
*****************************************************************************
BufCt1     : ift BufCt1 ilen [, inum]
BufCt2     : iftL, iftR BufCt2 ilen [, inumL [, inumR]]
BufPlay1   : aout, kfin BufPlay1 ift, kplay, kspeed, kvol, kstart, kend, kwrap
BufPlay2   : aL, aR, kfin BufPlay2 iftL, iftR, kplay, kspeed, kvol, kstart, kend, kwrap
BufRec1    : kfin BufRec1 ain, ift, krec, kstart, kend, kwrap
BufRec2    : kfin BufRec2 ainL, ainR, iftL, iftR, krec, kstart, kend, kwrap
*****************************************************************************
****************************************************************************/

/****************************************************************************
ift BufCt1 ilen [, inum]
creates a function table of ilen seconds for recording

creates an "empty" function table (filled with zeros) of ilen seconds, using GEN02, for recording sound
written by joachim heintz

ilen - length in seconds
inum - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
ift - table number as output
****************************************************************************/
/****************************************************************************
iftL, iftR BufCt2 ilen [, inumL [, inumR]]
creates two function tables of ilen seconds for recording

creates two "empty" function tables (filled with zeros) of ilen seconds, using GEN02, for recording stereo sound input
written by joachim heintz

ilen - length in seconds
inumL, inumR - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
iftL, iftR - table numbers as output
****************************************************************************/
/****************************************************************************
aout, kfin BufPlay1 ift, kplay, kspeed, kvol, kstart, kend, kwrap
Plays audio from a mono buffer (function table), with different options

Plays audio from a mono buffer (function table), with control over speed (forward - backward), volume, start point, end point, and different options of wrapping/looping. All parameters can be modified during performance.
See the UDO BufFiPl if you want to play back a soundfile which has been loaded into a buffer. BufFiPl performs also sample rate conversion
written by joachim heintz

ift - function table to play. This can be a non-power-of-two function table (given by a negative size, see example), but no deferred size GEN01 table.
kplay - 1 for playing, 0 (or any other number) stops playing
kspeed - 1 for playing back in the same speed as the buffer has been recorded, 2 for double speed etc., negative numbers for backwards
kvol - volume as multiplier (1=normal)
kstart - begin of playing the buffer in seconds
kend - end of playing in seconds. Zero means the end of the table
kwrap -
kwrap = 0: no wrapping. Stops at kend (positive speed) or kstart (negative speed). This makes just sense if the direction does not change and you just want to play the table once
kwrap = 1: wraps between kstart and kend
kwrap = 2: wraps between 0 and kend
kwrap = 3: wraps between kstart and end of table
aout - audio output signal
kfin - 1 if playing has ended (wrap=0), otherwise 0  
****************************************************************************/
/****************************************************************************
aL, aR, kfin BufPlay2 iftL, iftR, kplay, kspeed, kvol, kstart, kend, kwrap
Plays audio from a stereo buffer (two function tables), with different options

Plays audio from a stereo buffer (two function tables), with control over speed (forward - backward), volume, start point, end point, and different options of wrapping/looping. All parameters can be modified during performance.
See the UDO BufFiPl if you want to play back a soundfile which has been loaded into a buffer. BufFiPl performs also sample rate conversion

iftL, iftR - function tables to play. It is possible to use non-power-of-two function tables (given by a negative size, see example), but no deferred size GEN01 table.
written by joachim heintz

kplay - 1 for playing, 0 (or any other number) stops playing
kspeed - 1 for playing back in the same speed as the buffer has been recorded, 2 for double speed etc., negative numbers for backwards
kvol - volume as multiplier (1=normal)
kstart - begin of playing the buffer in seconds
kend - end of playing in seconds. Zero means the end of the table
kwrap -
kwrap = 0: no wrapping. Stops at kend (positive speed) or kstart (negative speed). This makes just sense if the direction does not change and you just want to play the table once
kwrap = 1: wraps between kstart and kend
kwrap = 2: wraps between 0 and kend
kwrap = 3: wraps between kstart and end of table
aL, aR - audio output signal
kfin - 1 if playing has ended (wrap=0), otherwise 0  
****************************************************************************/
/****************************************************************************
kfin BufRec1 ain, ift, krec, kstart, kend, kwrap
Records in a mono buffer (function table)

Records in a mono buffer (function table), with optional start point, end point, and wrap (= loop record).
The example below has different tests for ensuring that BufRec works as expected. See the example for the UDO BufCt for another example with live recording.
written by joachim heintz

ift - function table for recording
ain - audio signal to record
krec - 1 for recording, 0 (or any other number) stops recording
kstart - begin of recording into the function table in seconds
kend - end of recording into the function table in seconds
kwrap - if 1, recording wraps between kend and the beginning of the buffer (see th examples below for instr 4); if 0 (or any other number), record stops at kend
kfin - 1 if record has finished
****************************************************************************/
/****************************************************************************
kfin BufRec2 ainL, ainR, iftL, iftR, krec, kstart, kend, kwrap
Records in a stereo buffer (= two function tables)

Records in a stereo buffer (two function tables), with optional start point, end point, and wrap (= loop record). 
written by joachim heintz

iftL, iftR - function tables for recording
ainL, ainR - audio signals to record
krec - 1 for recording, 0 (or any other number) stops recording
kstart - begin of recording into the function table in seconds
kend - end of recording into the function table in seconds
kwrap - if 1, recording wraps between kend and the beginning of the buffer (see th examples below for instr 4); if 0 (or any other number), record stops at kend
kfin - 1 if record has finished
****************************************************************************/

  opcode BufCt1, i, io
ilen, inum xin
ift        ftgen     inum, 0, -(ilen*sr), 2, 0
           xout      ift
  endop

  opcode BufCt2, ii, ioo
ilen, inumL, inumR xin 
iftL       ftgen     inumL, 0, -(ilen*sr), 2, 0
iftR       ftgen     inumR, 0, -(ilen*sr), 2, 0
           xout      iftL, iftR
  endop

  opcode BufPlay1, ak, ikkkkkk
ift, kplay, kspeed, kvol, kstart, kend, kwrap xin
;CALCULATE BASIC VALUES
kfin       init       0
iftlen     =          ftlen(ift)/sr ;ftlength in seconds
kend       =          (kend == 0 ? iftlen : kend) ;kend=0 means end of table
kstart01   =          kstart/iftlen ;start in 0-1 range
kend01     =          kend/iftlen ;end in 0-1 range
kfqbas     =          (1/iftlen) * kspeed ;basic phasor frequency
;DIFFERENT BEHAVIOUR DEPENDING ON WRAP:
if kplay == 1 && kfin == 0 then
 ;1. STOP AT START- OR ENDPOINT IF NO WRAPPING REQUIRED (kwrap=0)
 if kwrap == 0 then
kfqrel     =          kfqbas / (kend01-kstart01) ;phasor freq so that 0-1 values match distance start-end
andxrel    phasor     kfqrel ;index 0-1 for distance start-end
andx       =          andxrel * (kend01-kstart01) + (kstart01) ;final index for reading the table (0-1)
kfirst     init       1 ;don't check condition below at the first k-cycle (always true)
kndx       downsamp   andx
kprevndx   init       0
 ;end of table check:
  ;for positive speed, check if this index is lower than the previous one
  if kfirst == 0 && kspeed > 0 && kndx < kprevndx then
kfin       =          1
 ;for negative speed, check if this index is higher than the previous one
           else
kprevndx   =          (kprevndx == kstart01 ? kend01 : kprevndx)
   if kfirst == 0 && kspeed < 0 && kndx > kprevndx then
kfin       =          1
   endif
kfirst     =          0 ;end of first cycle in wrap = 0
  endif
 ;sound out if end of table has not yet reached
asig       table3     andx, ift, 1
kprevndx   =          kndx ;next previous is this index
 ;2. WRAP BETWEEN START AND END (kwrap=1)
 elseif kwrap == 1 then
kfqrel     =          kfqbas / (kend01-kstart01) ;same as for kwarp=0
andxrel    phasor     kfqrel
andx       =          andxrel * (kend01-kstart01) + (kstart01)
asig       table3     andx, ift, 1 ;sound out
 ;3. START AT kstart BUT WRAP BETWEEN 0 AND END (kwrap=2)
 elseif kwrap == 2 then
kw2first   init       1
  if kw2first == 1 then ;at first k-cycle:
           reinit     wrap3phs ;reinitialize for getting the correct start phase
kw2first   =          0
  endif
kfqrel     =          kfqbas / kend01 ;phasor freq so that 0-1 values match distance start-end
wrap3phs:
andxrel    phasor     kfqrel, i(kstart01) ;index 0-1 for distance start-end
           rireturn   ;end of reinitialization
andx       =          andxrel * kend01 ;final index for reading the table
asig       table3     andx, ift, 1 ;sound out
 ;4. WRAP BETWEEN kstart AND END OF TABLE(kwrap=3)
 elseif kwrap == 3 then
kfqrel     =          kfqbas / (1-kstart01) ;phasor freq so that 0-1 values match distance start-end
andxrel    phasor     kfqrel ;index 0-1 for distance start-end
andx       =          andxrel * (1-kstart01) + kstart01 ;final index for reading the table
asig       table3     andx, ift, 1
 endif
           else       ;if either not started or finished at wrap=0
asig       =          0 ;don't produce any sound
endif
           xout       asig*kvol, kfin
  endop

  opcode BufPlay2, aak, iikkkkkk
iftL, iftR, kplay, kspeed, kvol, kstart, kend, kwrap xin  
aL, kfin	BufPlay1	iftL, kplay, kspeed, kvol, kstart, kend, kwrap
aR, kfin	BufPlay1	iftR, kplay, kspeed, kvol, kstart, kend, kwrap
		xout		aL, aR, kfin
  endop

  opcode BufRec1, k, aikkkk
ain, ift, krec, kstart, kend, kwrap xin
		setksmps	1
kendsmps	=		kend*sr ;end point in samples
kendsmps	=		(kendsmps == 0 || kendsmps > ftlen(ift) ? ftlen(ift) : kendsmps)
kfinished	=		0
knew		changed	krec ;1 if record just started
 if krec == 1 then
  if knew == 1 then
kndx		=		kstart * sr - 1 ;first index to write minus one
  endif
  if kndx >= kendsmps-1 && kwrap == 1 then
kndx		=		-1
  endif
  if kndx < kendsmps-1 then
kndx		=		kndx + 1
andx		=		kndx
		tabw		ain, andx, ift
  else
kfinished	=		1
  endif
 endif
 		xout		kfinished
  endop

  opcode BufRec2, k, aaiikkkk
ainL, ainR, iftL, iftR, krec, kstart, kend, kwrap xin
kfinished	BufRec1	ainL, iftL, krec, kstart, kend, kwrap
kfinished	BufRec1	ainR, iftR, krec, kstart, kend, kwrap
 		xout		kfinished
  endop


