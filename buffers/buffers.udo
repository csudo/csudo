/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN buffers:
*****************************************************************************
BufCt1     : ift BufCt1 ilen [, inum]
BufCt2     : iftL, iftR BufCt2 ilen [, inumL [, inumR]]
BufFiCt1   : ift BufFiCt1 Sfilenam [, iftnum [, inorm]]
BufFiCt2   : iftL, iftR BufFiCt2 Sfilenam [, ifnL [, ifnR [, inorm]]]
BufFiCt4   : ift1, ift2, ift3, ift4 BufFiCt4 Sfilenam [, ifn1 [, ifn2 [, ifn3 [, ifn4 [, inorm]]]]]
BufFiCt8   : ift1, ift2, ift3, ift4, ift5, ift6, ift7, ift8 BufFiCt8 Sfilenam [, ifn1 [, ifn2 [, ifn3 [, ifn4 [, ifn5 [, ifn6 [, ifn7 [, ifn8 [, inorm]]]]]]]]]
BufFiCtNd1 : ift, ilen BufFiCtNd1 Sfilenam [, ichn [, iftnum [, inorm]]]
BufFiCtNd2 : iftL, iftR, ilen BufFiCtNd2 Sfilenam [, ichnL [, ichnR [, iftnumL [, iftnumR [, inorm]]]]]
BufFiPl1   : aout, kfin BufFiPl1 ifn, kplay, kspeed, kvol [, iskip [, iwrap]]
BufFiPl2   : aL, aR BufFiPl2 ifnL, ifnR, kplay, kspeed, kvol [, iskip [, iwrap]]
BufFiPl4   : a1, a2, a3, a4 BufFiPl4 ifn1, ifn2, ifn3, ifn4, kplay, kspeed, kvol [, iskip [, iwrap]]
BufFiPl8   : a1, a2, a3, a4, a5, a6, a7, a8 BufFiPl8 ifn1, ifn2, ifn3, ifn4, ifn5, ifn6, ifn7, ifn8, kplay, kspeed, kvol [, iskip [, iwrap]]
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

ilen - length in seconds
inum - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
ift - table number as output
****************************************************************************/
/****************************************************************************
iftL, iftR BufCt2 ilen [, inumL [, inumR]]
creates two function tables of ilen seconds for recording

creates two "empty" function tables (filled with zeros) of ilen seconds, using GEN02, for recording stereo sound input

ilen - length in seconds
inumL, inumR - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
iftL, iftR - table numbers as output
****************************************************************************/
/****************************************************************************
ift BufFiCt1 Sfilenam [, iftnum [, inorm]]
creates a gen01 function table from a mono soundfile 

Creates a gen01 function table from a mono soundfile. This is nothing else than a simplification of creating the same with a ftgen statement.
Use BufFiCtNd to create a non-deferred function table from a soundfile 

Sfilenam - file name or path as string
iftnum - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
inorm - if zero, the table is not normalized. This is also the default, while any other number creates a normalized table
ift - output table number
****************************************************************************/
/****************************************************************************
iftL, iftR BufFiCt2 Sfilenam [, ifnL [, ifnR [, inorm]]]
creates two gen01 function table from a stereo soundfile

Creates two gen01 function table from a stereo soundfile. This is nothing else than a simplification of creating the same with a ftgen statement.
Use BufFiCtNd to create a non-deferred function table from a soundfile 

Sfilenam - file name or path as string
ifnL, ifnR - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
inorm - if zero, the table is not normalized. This is also the default, while any other number creates a normalized table
iftL, iftR - output table numbers for left and right channel
****************************************************************************/
/****************************************************************************
ift1, ift2, ift3, ift4 BufFiCt4 Sfilenam [, ifn1 [, ifn2 [, ifn3 [, ifn4 [, inorm]]]]]
creates fout gen01 function table from a four channel soundfile

Creates four gen01 function table from a four channel soundfile. This is nothing else than a simplification of creating the same with a ftgen statement.
Use BufFiCtNd to create a non-deferred function table from a soundfile 

Sfilenam - file name or path as string
ifn1 ... ifn4 - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
inorm - if zero, the table is not normalized. This is also the default, while any other number creates a normalized table
ift1 ... ift4 - output table numbers
****************************************************************************/
/****************************************************************************
ift1, ift2, ift3, ift4, ift5, ift6, ift7, ift8 BufFiCt8 Sfilenam [, ifn1 [, ifn2 [, ifn3 [, ifn4 [, ifn5 [, ifn6 [, ifn7 [, ifn8 [, inorm]]]]]]]]]
creates eight gen01 function table from an eight channel soundfile

Creates eight gen01 function table from an eight channel soundfile. This is nothing else than a simplification of creating the same with a ftgen statement.
Use BufFiCtNd to create a non-deferred function table from a soundfile 

Sfilenam - file name or path as string
ifn1 ... ifn8 - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
inorm - if zero, the table is not normalized. This is also the default, while any other number creates a normalized table
ift1 ... ift8 - output table numbers
****************************************************************************/
/****************************************************************************
ift, ilen BufFiCtNd1 Sfilenam [, ichn [, iftnum [, inorm]]]
creates a non deferred function table from a mono soundfile and returns its length

Creates a non deferred function table from a mono soundfile and returns its length. This can be useful is you want to use opcodes (for instance table3) which do not work with deferred size function tables

Sfilenam - file name or path as string
ichn - channel in Sfilenam to read (default=1)
iftnum - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
inorm - if zero, the table is not normalized. This is also the default, while any other number creates a normalized table
ift - output table number
ilen - length of the function table created (which is also the length of the soundfile in samples)
****************************************************************************/
/****************************************************************************
iftL, iftR, ilen BufFiCtNd2 Sfilenam [, ichnL [, ichnR [, iftnumL [, iftnumR [, inorm]]]]]
creates two non deferred function tables from a stereo soundfile and returns the length

Creates two non deferred function tables from a stereo (or any multichannel) soundfile and returns the length as table size (= sample frames). This can be useful is you want to use opcodes (for instance table3) which do not work with deferred size function tables

Sfilenam - file name or path as string
ichnL, ichnR - channels in Sfilenam to read (default = 1 for ichnL and 2 for ichnR)
iftnumL, iftnumR - if zero (which is also the default), the number of the function table is given by Csound. Any other positive integer will represent the function table, but the user must take care of not using a number twice
inorm - if zero, the table is not normalized. This is also the default, while any other number creates a normalized table
iftL, iftR - output table number
ilen - length of the function table created (which is also the length of the soundfile in samples)
****************************************************************************/
/****************************************************************************
aout, kfin BufFiPl1 ifn, kplay, kspeed, kvol [, iskip [, iwrap]]
Plays a mono sample from a GEN01 function table, including sample rate conversion

Plays a mono sample from a GEN01 function table, including sample rate conversion. The input parameters are similar to diskin (speed, loop play or play once, skiptime) plus a factor for amplitude scaling.
See the UDO BufPlay for playing any buffer, with some more options, but without sample rate conversion.

ifn - number of the function table which contains the sample (please use GEN01 - any other GEN routine will lead to an error because it does not contain the sample rate of the soundfile)
(you can also use BufFiCt1 for creating the table - see the example below)
iskip - skiptime (sec)
iwrap - iwrap=0 plays the file just once (stops at end of table for positive speed and at start of table for negative speed), or stops if the direction of speed changes. the default is 1 (loop play) 
kplay - 1 plays the table, 0 or any other number stops playing
kspeed - speed and direction (negative = backwards) of the pointer through the sample, e.g. 1 = normal, 2 = double (=octave higher), -0.5 = half (octave lower) and backwards
kvol - ampltude scaling factor (1 = original amplitude)
aout - audio output
kfin - 1 if iwrap=0 and playback has finished, otherwise 0
****************************************************************************/
/****************************************************************************
aL, aR BufFiPl2 ifnL, ifnR, kplay, kspeed, kvol [, iskip [, iwrap]]
Plays a stereo sample from two GEN01 function tables, including sample rate conversion

Plays a stereo sample from two GEN01 function tables for the left and right channel, including sample rate conversion. The input parameters are similar to diskin (speed, loop play or play once, skiptime) plus a factor for amplitude scaling.
See the UDO BufPlay for playing any buffer, with some more options, but without sample rate conversion.

ifnL - number of the function table which contains channel 1 of the sample (use GEN01 with 1 for the channel parameter - any other GEN routine will lead to an error because it does not contain the sample rate of the soundfile)
(you can also use BufFiCt2 for creating the tables for left and right channel - see the example below)
ifnR - number of the function table which contains channel 2 of the sample (use the same f-statement as for ifnL but with 2 for the channel parameter)
iskip - skiptime (sec)
iwrap - iwrap=0 plays the file is just once (stops at end of table for positive speed and at start of table for negative speed), or stops if the direction of speed changes.the default is 1 (loop play) 
kplay - 1 plays the table, 0 or any other number stops playing
kspeed - speed and direction (negative = backwards) of the pointer through the sample, e.g. 1 = normal, 2 = double (=octave higher), -0.5 = half (octave lower) and backwards
kvol - ampltude scaling factor (1 = original amplitude)
aL - audio output channel 1
aR - audio output channel 2
kfin - 1 if iwrap=0 and playback has finished, otherwise 0
****************************************************************************/
/****************************************************************************
a1, a2, a3, a4 BufFiPl4 ifn1, ifn2, ifn3, ifn4, kplay, kspeed, kvol [, iskip [, iwrap]]
Plays a four channel sample from four GEN01 function tables, including sample rate conversion

Plays a four channel sample from four GEN01 function tables, including sample rate conversion. The input parameters are similar to diskin (speed, loop play or play once, skiptime) plus a factor for amplitude scaling.
See the UDO BufPlay for playing any buffer, with some more options, but without sample rate conversion.

ifn1 - number of the function table which contains channel 1 of the sample (use GEN01 with 1 for the channel parameter - any other GEN routine will lead to an error because it does not contain the sample rate of the soundfile)
(you can also use BufFiCt4 for creating the tables for all channels - see the example below)
ifn2 - number of the function table which contains channel 2 of the sample (use the same f-statement as for ifnL but with 2 for the channel parameter)
ifn3 - number of the function table for the 3. channel
ifn4 - number of the function table for the 4. channel
iskip - skiptime (sec)
iwrap - iwrap=0 plays the file is just once (stops at end of table for positive speed and at start of table for negative speed), or stops if the direction of speed changes. the default is 1 (loop play)
kplay - 1 plays the table, 0 or any other number stops playing
kspeed - speed and direction (negative = backwards) of the pointer through the sample, e.g. 1 = normal, 2 = double (=octave higher), -0.5 = half (octave lower) and backwards
kvol - ampltude scaling factor (1 = original amplitude)
a1 - audio output channel 1
a2 - audio output channel 2
a3 - audio output channel 3
a4 - audio output channel 4
kfin - 1 if iwrap=0 and playback has finished, otherwise 0 ****************************************************************************/
/****************************************************************************
a1, a2, a3, a4, a5, a6, a7, a8 BufFiPl8 ifn1, ifn2, ifn3, ifn4, ifn5, ifn6, ifn7, ifn8, kplay, kspeed, kvol [, iskip [, iwrap]]
Plays an eight channel sample from eight GEN01 function tables, including sample rate conversion

Plays an eight channel sample from eight GEN01 function tables, including sample rate conversion. The input parameters are similar to diskin (speed, loop play or play once, skiptime) plus a factor for amplitude scaling.
See the UDO BufPlay for playing any buffer, with some more options, but without sample rate conversion.

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
kfin - 1 if iwrap=0 and playback has finished, otherwise 0  ****************************************************************************/
/****************************************************************************
aout, kfin BufPlay1 ift, kplay, kspeed, kvol, kstart, kend, kwrap
Plays audio from a mono buffer (function table), with different options

Plays audio from a mono buffer (function table), with control over speed (forward - backward), volume, start point, end point, and different options of wrapping/looping. All parameters can be modified during performance.
See the UDO BufFiPl if you want to play back a soundfile which has been loaded into a buffer. BufFiPl performs also sample rate conversion

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
kfin - 1 if playing has ended (wrap=0), otherwise 0  ****************************************************************************/
/****************************************************************************
aL, aR, kfin BufPlay2 iftL, iftR, kplay, kspeed, kvol, kstart, kend, kwrap
Plays audio from a stereo buffer (two function tables), with different options

Plays audio from a stereo buffer (two function tables), with control over speed (forward - backward), volume, start point, end point, and different options of wrapping/looping. All parameters can be modified during performance.
See the UDO BufFiPl if you want to play back a soundfile which has been loaded into a buffer. BufFiPl performs also sample rate conversion

iftL, iftR - function tables to play. It is possible to use non-power-of-two function tables (given by a negative size, see example), but no deferred size GEN01 table.
Performance

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
kfin - 1 if playing has ended (wrap=0), otherwise 0  ****************************************************************************/
/****************************************************************************
kfin BufRec1 ain, ift, krec, kstart, kend, kwrap
Records in a mono buffer (function table)

Records in a mono buffer (function table), with optional start point, end point, and wrap (= loop record).
The example below has different tests for ensuring that BufRec works as expected. See the example for the UDO BufCt for another example with live recording.

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

iftL, iftR - function tables for recording
ainL, ainR - audio signals to record
krec - 1 for recording, 0 (or any other number) stops recording
kstart - begin of recording into the function table in seconds
kend - end of recording into the function table in seconds
kwrap - if 1, recording wraps between kend and the beginning of the buffer (see th examples below for instr 4); if 0 (or any other number), record stops at kend
kfin - 1 if record has finished
****************************************************************************/

  opcode BufFiCt1, i, Soo
Sfilenam, iftnum, inorm xin
igen      =         (inorm == 0 ? -1 : 1)
ift       ftgen     iftnum, 0, 0, igen, Sfilenam, 0, 0, 1
          xout      ift  
  endop

  opcode BufFiCt2, ii, Sooo
Sfilenam, ifnL, ifnR, inorm xin
igen      =         (inorm == 0 ? -1 : 1)
iftL      ftgen     ifnL, 0, 0, igen, Sfilenam, 0, 0, 1
iftR      ftgen     ifnR, 0, 0, igen, Sfilenam, 0, 0, 2
          xout      iftL, iftR  
  endop

  opcode BufFiCt4, iiii, Sooooo
Sfilenam, ifn1, ifn2, ifn3, ifn4, inorm xin
igen       =          (inorm == 0 ? -1 : 1)
ift1       ftgen      ifn1, 0, 0, igen, Sfilenam, 0, 0, 1
ift2       ftgen      ifn2, 0, 0, igen, Sfilenam, 0, 0, 2
ift3       ftgen      ifn3, 0, 0, igen, Sfilenam, 0, 0, 3
ift4       ftgen      ifn4, 0, 0, igen, Sfilenam, 0, 0, 4
           xout       ift1, ift2, ift3, ift4
  endop

  opcode BufFiCt8, iiiiiiii, Sooooooooo
Sfilenam, ifn1, ifn2, ifn3, ifn4, ifn5, ifn6, ifn7, ifn8, inorm xin 
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

  opcode BufFiCtNd1, ii, Spoo
Sfilenam, ichn, iftnum, inorm xin
igen      =         (inorm == 0 ? -1 : 1)
ifttmp    ftgen     0, 0, 0, igen, Sfilenam, 0, 0, ichn
ilen      tableng   ifttmp
ift       ftgen     iftnum, 0, -ilen, -2, 0
          vcopy_i   ift, ifttmp, ilen
          ftfree    ifttmp, 0
          xout      ift, ilen
  endop

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

  opcode BufFiPl1, ak, ikkkop
ifn, kplay, kspeed, kvol, iskip, iwrap xin
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

  opcode BufFiPl2, aak, iikkkop
ifnL, ifnR, kplay, kspeed, kvol, iskip, iwrap xin
aL, kfin  BufFiPl1  ifnL, kplay, kspeed, kvol, iskip, iwrap
aR, kfin  BufFiPl1  ifnR, kplay, kspeed, kvol, iskip, iwrap
          xout      aL, aR, kfin
  endop

  opcode BufFiPl4, aaaak, iiiikkkop
ifn1, ifn2, ifn3, ifn4, kplay, kspeed, kvol, iskip, iwrap xin
a1, kfin  BufFiPl1  ifn1, kplay, kspeed, kvol, iskip, iwrap
a2, kfin  BufFiPl1  ifn2, kplay, kspeed, kvol, iskip, iwrap
a3, kfin  BufFiPl1  ifn3, kplay, kspeed, kvol, iskip, iwrap
a4, kfin  BufFiPl1  ifn4, kplay, kspeed, kvol, iskip, iwrap
          xout      a1, a2, a3, a4, kfin
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


