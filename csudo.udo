/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN csudo:
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
Counter    : kcount Counter kup, kdown [, kstep [, istart]]
ExtrOrc    : Sorc ExtrOrc Sfil
F2M        : iNotNum F2M iFreq [,iRound]
FilDir     : Sdir FilDir Spath
FilDirUp   : SUpDir FilDirUp SCurDir
FilNam     : Snam FilNam Spath
FilPlay1   : aout FilPlay1 Sfil, kspeed [, iskip [, iloop]]
FilPlay2   : aL, aR FilPlay2 Sfil, kspeed [, iskip [, iloop]]
FilSuf     : Suf FilSuf Spath [,ilow]
FracLen    : iFracs FracLen iNum
Linek      : kval, kfin Linek kthis, knext, ktim, ktrig
LpPhsr     : atimpt LpPhsr kloopstart, kloopend, kspeed, kdir, irefdur
Print_a    : Print_a aSig [,kPeriod [,kSpaces]]
PrtArr1i   : PrtArr1 iArr [,istart [,iend [,iprec [,ippr]]]]]
PrtArr1k   : PrtArr1k kArr [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
PtkSmpA    : aout PtkSmpA ifiltab, iskip, kspeed, kgrainamp, kgrainrate, kgrainsize, kcent, kposrand, kcentrand, icosintab, idisttab, iwin
PtkSmpB    : apartikkel PtkSmpB ifiltab, apnter, kgrainamp, kgrainrate, kgrainsize, kcent, kposrand, kcentrand, icosintab, idisttab, iwin
PtkWrp     : aWrp PtkWrp aPos, iFilTab [,kAmp [,kCent [,kPosRnd [,kGrainRate [,kGrainSize [,kDistribution]]]]]]
SrtArrk    : kOutArr[] SrtArrk kInArr[], iLen
StrAgrm    : Sout StrAgrm Sin [,iLen]
StrAgrmk   : Sout StrAgrm Sin [,iLen]
StrExpr1   : iNum StrExpr1 Str
StrExpr2   : iNum StrExpr2 Str
StrMems    : iSumEls StrMems Str, Sel
StrNumP    : itest StrNumP String
StrToAscS  : Sout StrToAscS Sin
StrayElMem : ipos StrayElMem Stray, Stest [, isep1 [, isep2]]
StrayGetEl : Sel StrayGetEl Stray, ielindx [, isep1 [, isep2]]
StrayGetNum: inum StrayGetNum Stray, ielindx [, isep1 [, isep2]]
StrayLen   : ilen StrayLen Stray [, isep1 [, isep2]]
StrayNumLen: ilen StrayNumLen Stray [, isep1 [, isep2]]
StrayNumMem: itest StrayNumMem Stray, inum [, isep1 [, isep2]]
StrayNumSum: isum StrayNumSum Stray [, isep1 [, isep2]]]
StrayNumToFt: ift, iftlen StrayNumToFt Stray [, iftno [, isep1 [, isep2]]]
StrayRemDup: Srem StrayRemDup Stray [, isep1 [, isep2]]
StrayRev   : Srev StrayRev Stray [,isepA [, isepB [, isepOut]]]
StrayRndEl : Sel StrayRndEl Stray [, isep1 [, isep2]]
StraySetEl : Sres StraySetEl Stray, Sin [, ielindx [, isep1 [, isep2 [,isepOut]]]]
StraySetNum: Sres StraySetNum Stray, inum [, ielindx [, isep1 [, isep2 [,isepOut]]]]
StraySub   : Sub StraySub Stray [, istart [, iend [, isepA [, isepB [, isepOut]]]]]
StripL     : Sout StripL Sin
TbDmp      : TbDmp ifn [,istart [,iend [,iprec [,ippr]]]]
TbDmpS     : TbDmpS ifn, String [,istart [,iend [,iprec [,ippr]]]]
TbDmpSk    : TbDmpSk ifn, String [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
TbDmpk     : TbDmpk ifn [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
TbMem      : ipos TbMem ival, ift [, indxstrt [, indxend]]
TbPrmRnd   : TbPrmRnd ift
TbPrmRndk  : TbPrmRndk ift, ktrig
TbRmDp     : iend TbRmDp iftsrc, iftdst [, ioffset [, inumels]]
TbToLin    : kLin TbToLin iFt
TbToSF     : TbToSF ift, Soutname, ktrig [,iformat [,istart [,iend]]]
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
/****************************************************************************
kcount Counter kup, kdown [, kstep [, istart]]
Step counter

Counts steps upwards or downwards, whenever a trigger signal has been received. This is meant to be used in live interaction, and is simliar to counter objects in realtime programs like Max or Pd. The example shows how the basic function can be extended to repeat sequences in a certain range.

kstep - step size (default = 1)
istart - starting value (default = 0)
kup - counts upwards when 1
kdown - counts downwards when 1
kcount - current count as output
****************************************************************************/
/****************************************************************************
Sorc ExtrOrc Sfil
Extracts the orc part of a csd file.

Extracts the orc part (= the text in the <CsInstruments> tag) from the csd 
file Sfil, and returns it as string Sorc. Requires the UDO StripL.

Sfil - csd file (either full path or name if in the same directory)
Sorc - orc part of Sfil as string
****************************************************************************/
/****************************************************************************
iNotNum F2M iFreq [,iRound]
Converts a frequency to MIDI.Cent note number, with optional rounding to the next key.

Converts a frequency to MIDI.Cent note number, for instance 60.024759 for an input of 262 Hz. If the round option is turned on, the frequency is mapped to the nearest key, so that an integer is returned.

iFreq - Frequency to be converted
iRound - 0 = off (default), 1 = on
iNotNum - Midi note number (60 = middle c)
****************************************************************************/
/****************************************************************************
Sdir FilDir Spath
Returns the directory in a given path

Returns the directory part of a given file path string (=everything before the last slash), at i-rate (csound 5.15 or higher).

Spath - full path name as string
Sdir - directory
****************************************************************************/
/****************************************************************************
SUpDir FilDirUp SCurDir
Returns the directory above the current directory

Returns the directory above the current directory.

SCurDir - current directory (with or without an ending slash)
SUpDir - directory above the current directory (returned without an ending slash)
****************************************************************************/
/****************************************************************************
Snam FilNam Spath
Returns the file name in a given path

Returns the file name (= everything after the last slash) in a given path.
Requires Csound 5.15 or higher.

Spath - full path name as string
Snam - name part
****************************************************************************/
/****************************************************************************
aout FilPlay1 Sfil, kspeed [, iskip [, iloop]]
Plays a mono signal from a mono or stereo soundfile

Gives mono output regardless a soundfile is mono or stereo (if stereo, just the first channel is used).

Sfil - Sound file name (or path) in double quotes
iskip - skiptime in seconds (default=0)
iloop - 1 = loop, 0 = no loop (default=0)
kspeed - speed to read the file (1 = normal, 2 = octave higher, 0.5 = octave lower) ****************************************************************************/
/****************************************************************************
aL, aR FilPlay2 Sfil, kspeed [, iskip [, iloop]]
Plays a stereo signal from a mono or stereo soundfile

Gives stereo output regardless a soundfile is mono or stereo (if mono, this signal is sent to both channels).

Sfil - Sound file name (or path) in double quotes
iskip - skiptime in seconds (default=0)
iloop - 1 = loop, 0 = no loop (default=0)
kspeed - speed to read the file (1 = normal, 2 = octave higher, 0.5 = octave lower)
****************************************************************************/
/****************************************************************************
Suf FilSuf Spath [,ilow]
Returns the suffix of a filename or path, optional in lower case 

Returns the suffix (extension) of a filename or a full path, optional in lower case.

Spath - full pathname (or filename) as string
ilow - return ensuring lower case (1) or return as in Spath (0 = default)
****************************************************************************/
/****************************************************************************
iFracs FracLen iNum
Returns the real length of the fractional part of a number

Returns the real length of digits in the the fractional part of a number. "Real" means that the number 1.000 actually has no fractional part but is in this sense an integer.

iNum - incoming number
iFracs - number of digits in the fractional part. 0 means that iNum is an integer
****************************************************************************/
/****************************************************************************
kval, kfin Linek kthis, knext, ktim, ktrig
performs a linear interpolation from one value to another value in a certain time whenever a trigger is received

Performs a linear interpolation from kthis to knext in ktim whenever ktrig is 1. Otherwise kthis is bypassed (before the first trigger impulse) or kval is held. The behaviour should be the same as in PD's/Max' "line" object.

kthis - starting value
knext - target value
ktim - time for linear ramp in seconds
ktrig - if 1, ramping starts
kval - output value
kfin - 1 if target has been reached
****************************************************************************/
/****************************************************************************
atimpt LpPhsr kloopstart, kloopend, kspeed, kdir, irefdur
creates a time pointer for loops

creates a time pointer signal for typical loop applications, for instance in the mincer opcode, with optional backward playing

irefdur - the overall duration. must be in the same scale as kloopstart and kloopend (e.g. seconds)
kloopstart - starting point of the loop (in the scale of irefdur)
kloopend - end point of the loop (in the scale of irefdur)
kspeed - 1 = normal speed, 0.5 = half speed, etc.
kdir - 1 = forward, -1 = backward
****************************************************************************/
/****************************************************************************
Print_a aSig [,kPeriod [,kSpaces]]
Prints an audio signal (vector) every kPeriod seconds.

Prints the values of an audio signal. As this is a list of single sample values in the length of ksmps, ksmps values are printed in []. Like in the printk opcode, you can specify the period between print operations, and the starting spaces.
You may have to set the flag -+max_str_len=10000 to avoid buffer overflow. 

aSig - input signal to be printed
kPeriod - time in seconds between print operations (default = 1). 0 means that printing is performed in each control cycle.
kSpaces - number of spaces to insert before printing (default = 0)

****************************************************************************/
/****************************************************************************
PrtArr1 iArr [,istart [,iend [,iprec [,ippr]]]]]
Prints a one-dimensional array at i-time.

Prints the content of a one-dimensional array at i-time. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
Requires Csound 6.

iArr - array to be printed
istart - first index to be printed (default = 0)
iend - first index not to be printed. -1 (default) mean the end of the array
iprec - float precision while printing (default = 3)
ippr - parameters per row (default = 10, maximum = 32)
****************************************************************************/
/****************************************************************************
PrtArr1k kArr [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
Prints a one-dimensional array at k-time.

Prints the content of a one-dimensional array at k-time, whenever a trigger is positive. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
Requires Csound 6.

kArr - array to be printed
ktrig - if > 0, kArr is printed once in each k-cycle (= default). for any other value, no printing is performed
kstart - first index to be printed (default = 0)
kend - first index not to be printed. -1 or 0.5 (default) mean the end of the array
kprec - float precision while printing (default = 3)
kppr - parameters per row (default = 10, maximum = 32)
****************************************************************************/
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
/*length of input file*/
/*amplitude*/
/*transposition*/
/*pointer*/
/* other parameters */
/****************************************************************************
apartikkel PtkSmpB ifiltab, apnter, kgrainamp, kgrainrate, kgrainsize, kcent, kposrand, kcentrand, icosintab, idisttab, iwin
The same as PtkSmpA, but with a time pointer input

A simplified version of the Partikkel opcode, but with some additional parameters. It performs asynchronous granular synthesis with a maximal displacement of 1/grainrate seconds.

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
kcentrand: random transposition in cents (up and down) ****************************************************************************/
/*amplitude*/
/*transposition*/
/* other parameters */
/****************************************************************************
aWrp PtkWrp aPos, iFilTab [,kAmp [,kCent [,kPosRnd [,kGrainRate [,kGrainSize [,kDistribution]]]]]]
Uses the partikkel opcode to do some sound warping, similar to sndwarp 

Uses the partikkel opcode to do standard sound warping like time freeze, stretch or compress, and pitch shift, on a table with one channel of an audio sample. The goal is to simplify the usage as much as possible, with just setting the position in the sound, and the GEN01 table as inputs. All other parameters are set to  default values.
General notes:
1. The quality of sound transformation with granular synthesis depends mainly on the combination of the different input parameters, at least grain rate, grain size and distribution. So you cannot expect to get excellent results with some default values. Try to use the optional inputs in case of bad results, and if you want to go very much in detail, use the partikkel opcode with all its flexibility. (See, for instance,  SF_Granular.csd in CsoundQt's example menu.)
2. Two function tables are generated from inside the UDO, which is actually bad style. The reason is not to bother the user with tables which are not important for him. But if you want to use this UDO in a real time context, you should definitely put the iWinTab and iDistTab tables outside the UDO.
3. The default values for grain rate (200 Hz) and grain size (100 ms) can be changed easily inside the UDO.
Requires Csound 5.18 or higher.

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
/****************************************************************************
kOutArr[] SrtArrk kInArr[], iLen
Sorts the content of kInArr[] and returns the sorted array as kOutArr[].

kInArr[] - array to sort
iLen - its length
kOutArr[] - sorted array
****************************************************************************/
/****************************************************************************
Sout StrAgrm Sin [,iLen]
Changes the order of the characters in Sin randomly, like in an anagram.

Changes the order of the characters in Sin randomly, like in an anagram, and returns the result as new string.

Sin - input string 
iLen - length of Sin. If -1 (default), the length is calculated internally. 
Sout - output string
****************************************************************************/
/****************************************************************************
Sout StrAgrm Sin [,iLen]
Changes the order of the characters in Sin randomly, like in an anagram.

Changes the order of the characters in Sin randomly, like in an anagram, and returns the result as new string.

Sin - input string 
iLen - length of Sin. If -1 (default), the length is calculated internally. 
Sout - output string
****************************************************************************/
/****************************************************************************
iNum StrExpr1 Str
Calculates a simple binary expression in a string and returns the result as a number

Calculates a simple binary expression in a string and returns the result as a number. No spaces and no parentheses are allowed. Supported math operations are +, -, *, /, ^, and %. A simple number string is also accepted and converted to a number.

Str - Input string with a simple binary math expression. Supported math operations are +, -, *, /, ^, and %. No spaces and no parentheses are allowed. A simple number string is also accepted and converted to a number.
iNum - result of the binary operation as number
****************************************************************************/
/****************************************************************************
iNum StrExpr2 Str
Calculates a binary numerical expression in a string and returns the result as a number. One of the elements can be itself a binary expression, in which case it must be set in parentheses. Requires the UDO StrExpr1

Calculates a binary numerical expression in a string and returns the result as a number. One of the elements can be itself a binary expression, in which case it must be set in parentheses. No spaces are allowed. Supported math operations are +, -, *, /, ^, and %. A simple number string or a simple expression (like in StrExpr1) is also accepted and converted to a number.

Str - Input string with a binary math expression. One of the elements can be itself a binary expression, in which case it must be set in parentheses. No spaces are allowed. Supported math operations are +, -, *, /, ^, and %. A simple number string or a simple expression (like in StrExpr1) is also accepted and converted to a number.
iNum - result of the binary operation as number
****************************************************************************/
/****************************************************************************
iSumEls StrMems Str, Sel
Returns the number of occurencies of a string in another string.

Returns the number of occurencies of a string in another string.

Str - Input string
Sel - Another string which is asked to be a member of Str
iSumEls - Number of occurencies of Sel in Str
****************************************************************************/
/****************************************************************************
itest StrNumP String
Tests whether a string is a numerical string

Tests whether a string is a numerical string ("1" or "1.23435" but not "1a"). Returns 1 for "yes" and 0 for "no". If "yes", the string can be converted to a number by the opcode strtod.

String - any string
itest - 1 if String is a numerical string, 0 if not
****************************************************************************/
/****************************************************************************
Sout StrToAscS Sin
Returns the ASCII numbers of the input string as string.

Returns the ASCII numbers of the input string as string. The integers in the output string are seperated by one space.
You may have to set the flag -+max_str_len=10000 to avoid buffer overflow. 

Sin - Input string with any sequence of characters or numbers.
Sout - Output string containing the ASCII numbers of all characters, seperated by spaces.
****************************************************************************/
/****************************************************************************
ipos StrayElMem Stray, Stest [, isep1 [, isep2]]
Tests whether a string is contained as an element in an array-string

Looks whether a string equals one of the elements in Stray. If yes, itest returns the position of the element, if no, -1. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). if just one seperator is used, isep2 equals isep1.
Requires Csound 5.15 or higher.

Stray - a string as array
Stest - a string to be looked for in Stray
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
ipos - if Stest has been found as element in Stray, the position (starting at 0) is returned. if Stest has not been found as a member of Stray, -1 is returned
****************************************************************************/
/****************************************************************************
Sel StrayGetEl Stray, ielindx [, isep1 [, isep2]]
Gets one element from a string-array

Returns (at i-rate) the element for ielindex in String, or an empty string, if the element has not been found. By default, the seperators between the elements are spaces and tabs. Others seperators can be defined by their ASCII code number.
Requires Csound 5.15 or higher

Input:
Stray - a string as array
ielindx - the index of the element (starting with 0)
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab)
If the defaults are not used and just isep1 is given, it's the only seperator. If you want two seperators (as in the dafault), you must give isep1 and isep2
Output:
Sel - the element at position ielindx, as a string. if the element has not been found, an empty string is returned
****************************************************************************/
/****************************************************************************
inum StrayGetNum Stray, ielindx [, isep1 [, isep2]]
Gets one number from a string-array

Returns the element with the position ielindex (starting from 0) in Stray. This element must be a number (the other elements can be strings or charcters). By default, the seperators between the elements are spaces and tabs. Others seperators can be defined by their ASCII code number.
If ielindx is out of range, or if the element is not a number, an error occurs

Input:
Stray - a string as array
ielindx - the index of the element (starting with 0)
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab)
If the defaults are not used and just isep1 is given, it's the only seperator. If you want two seperators (as in the dafault), you must give isep1 and isep2
Output:
inum - the number which is at the ielindx position of Stray
****************************************************************************/
/****************************************************************************
ilen StrayLen Stray [, isep1 [, isep2]]
Returns the length of an array-string

Returns the number of elements in Stray. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.

Stray - a string as array
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
****************************************************************************/
/****************************************************************************
ilen StrayNumLen Stray [, isep1 [, isep2]]
Returns the length of numerical elements in an array-string

Returns the number of numerical elements in Stray. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). if just one seperator is used, isep2 equals isep1.
Requires the UDOs StrayGetEl, StrayLen and StrNumP

Stray - a string as array
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
****************************************************************************/
/****************************************************************************
itest StrayNumMem Stray, inum [, isep1 [, isep2]]
Tests whether a number is a member of an array-string

Looks whether the number inum is a member of Stray. If yes, itest returns the position of inum in Stray, if no, -1. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
Requires the UDO StrNumP

Stray - a string as array
inum - the number which is being looked for
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
****************************************************************************/
/****************************************************************************
isum StrayNumSum Stray [, isep1 [, isep2]]]
Adds the elements in a numerical array-string

Adds all numbers in Stray (which must not contain non-numerical elements). Simple math expressions like +, -, *, /, ^ and % are allowed (no parentheses at the moment). Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
Requires the UDOs StrayLen and StrayGetEl.

Stray - a string as array
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
****************************************************************************/
/****************************************************************************
ift, iftlen StrayNumToFt Stray [, iftno [, isep1 [, isep2]]]
Converts a string-array which just consists of numbers or simple math expressions to a function table

Puts all numbers in Stray (which must not contain non-numerical elements) in a function table and returns its variable ift (which is produced by iftno, default=0) and the length of the elements written iftlen. (An empty string as input writes a function table of size=1 to avoid an error but returns 0 as length of elements written.) Simple binary math expressions using +, -, *, /, ^ and % are allowed, with just one parenthesis in total (see the examples below). 
Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
Requires csound 5.15 or higher, and the UDOs StrayLen, StrExpr1 and StrExpr2

Stray - a string as array
iftno - like in an ftgen statement: if 0 (which is also the default) an automatic number is generated by Csound; if any positive number, this is then the number of the function table
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
ift - the number of the function table which has been created
iftlen - the length of the elements written to the function table (usually this equals the length of the function table; just an empty string as input will create a function table of size=1 but with iftlen=0)
****************************************************************************/
/****************************************************************************
Srem StrayRemDup Stray [, isep1 [, isep2]]
Removes duplicates in an array-string

Removes duplicates in Stray and returns the result. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
Requires the UDOs StrayLen and StrayGetEl

Stray - a string as array
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
Srem - the resulting output string
****************************************************************************/
/****************************************************************************
Srev StrayRev Stray [,isepA [, isepB [, isepOut]]]
Reverses the elements of an array-string

Reverses the elements in Stray and returns the result. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1. The elements in the resulting string Sres are seperated by isepOut (default=isep1)
Requires Csound 5.16 or higher (new parser)

Stray - a string as array
isepA - the first seperator for the elements in Stray (default=32: space)
isepB - the second seperator for the elements in Stray (default=9: tab) 
isepOut - the seperator for the output string (default=isep1)
Srev - Stray with elements in reverse order
****************************************************************************/
/****************************************************************************
Sel StrayRndEl Stray [, isep1 [, isep2]]
Gets a random element from a string-array.

Returns a random element from a string-array.
Requires Csound 5.15 or higher and the UDOs StrayLen and StrayGetEl.

Input:
Stray - a string as array
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab)
If the defaults are not used and just isep1 is given, it's the only seperator. If you want two seperators (as in the dafault), you must give isep1 and isep2
Output:
Sel - the random element as a string
****************************************************************************/
/****************************************************************************
Sres StraySetEl Stray, Sin [, ielindx [, isep1 [, isep2 [,isepOut]]]]
Inserts an element in an array-string at a certain position

Puts the string Sin at the position ielindx (default=-1: at the end) of Stray, and returns the result as a string. Elements in the string are seperated by the two ascii-coded seperators isepA (default=32: space) and isepB (default=9: tab). If just isepA is given, it is also read as isepB. The new element is inserted using the seperator isepOut (default=isep1)
Requires Csound 5.16 or higher (new parser)

Stray - a string as array 
Sin - a string to be inserted 
ielindx - the element position in Stray at which the new element is to be inserted (starting with 0); the default -1 means append at the end of Stray
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
isepOut - the seperator for the insertion (default=isep1)
****************************************************************************/
/****************************************************************************
Sres StraySetNum Stray, inum [, ielindx [, isep1 [, isep2 [,isepOut]]]]
Inserts a number in an array-string at a certain position

Puts the number inum at the position ielindx (default=-1: at the end) of Stray, and returns the result as Sres. Elements in Stray are seperated by the two ascii-coded seperators isepA (default=32: space) and isepB (default=9: tab). if just isepA is given, it is also read as isepB. the element is inserted using the seperator isepOut (default=isep1)
Requires Csound 5.16 or higher, and the UDO FracLen.

Stray - a string as array
inum - the number to be inserted
ielindx - the element position in Stray at which the number is inserted (starting with 0); the default -1 means append at the end of Stray
istrout - a number for the strset opcode, denoting the resulting string (Stray with the insertion of the new element). the default is 1; as strset creates global numbers you should be careful in using this number
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab)
isepOut - the seperator for the insertion (default=isep1)
****************************************************************************/
/****************************************************************************
Sub StraySub Stray [, istart [, iend [, isepA [, isepB [, isepOut]]]]]
Returns a subset of elements in an array-string

Returns a subset of elements in Stray, from istart (included) to iend (excluded). The defaults are istart=0 (first element) and iend=-1 (end of string). Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
The resulting substring will use isepOut as seperator (default=isep1)
Requires Csound 5.16 or higher (new parser)

Stray - a string as array
istart - first element to extract (default=0)
iend - first element after selection (default=-1: end of string)
isep1 - first seperator for the elements in Stray (default=32: space)
isep2 - second seperator for the elements in Stray (default=9: tab) 
isepOut - seperator for the elements in the output string (default=isep1)
Sub - resulting subset of Stray
****************************************************************************/
/****************************************************************************
Sout StripL Sin
Strips all initial spaces or tabs from a string.

Strips all spaces or tabs at the beginning of the input string Sin and returns the result as Sout.

Sin - Input string which may contain starting spaces or tabs.
Sout - Output string with removed initial spaces/tabs.
****************************************************************************/
/****************************************************************************
TbDmp ifn [,istart [,iend [,iprec [,ippr]]]]
Prints a function table at i-time.

Prints the content of a function table at i-time, i.e. once at the initialization of an instrument. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
You may have to set the flag -+max_str_len=10000 to avoid buffer overflow. See TbDmpk for the k-rate equivalent.

ifn - function table number
istart - first index to be printed (default = 0)
iend - first index not to be printed (default = -1: end of table)
iprec - float precision while printing (default = 3)
ippr - parameters per row (default = 10, maximum = 32)

****************************************************************************/
/****************************************************************************
TbDmpS ifn, String [,istart [,iend [,iprec [,ippr]]]]
Prints a table with an introducing string at i-time

Prints the content of a table, with an additional string as 'introduction' at i-time (= once at the initialization of an instrument). You may have to set the flag -+max_str_len=10000 for avoiding buffer overflow. See TbDmpSk for the k-rate variant

ifn - function table number
String - string to be printed as introduction
istart - first index to be printed (default = 0)
iend - first index not to be printed (default = -1: end of table)
iprec - float precision while printing (default = 3)
ippr - parameters per row (default = 10, maximum = 32)
****************************************************************************/
/****************************************************************************
TbDmpSk ifn, String [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
Prints a table with an introducing string at k-time

Prints the content of a function table with a string as 'introduction' at k-time, whenever a trigger is positive. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
You may have to set the flag -+max_str_len=10000 to avoid buffer overflow. See TbDmpS for the i-time equivalent.
Requires Csound 5.18 or higher for the usage of the k-rate default values P, O and V (thanks to Victor Lazzarini for implementing this feature).

ifn - function table number
String - string to be printed as introduction / comment
ktrig - if > 0, ifn is printed once in each k-cycle (= default). for any other value, no printing is performed
kstart - first index to be printed
kend - first index not to be printed. -1 means the end of the table
kprec - float precision while printing
kppr - parameters per row (maximum = 32)
****************************************************************************/
/****************************************************************************
TbDmpk ifn [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
Prints a function table at k-time.

Prints the content of a function table at k-time, whenever a trigger is positive. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
You may have to set the flag -+max_str_len=10000 to avoid buffer overflow. See TbDmp for the i-time equivalent.
Requires Csound 5.18 or higher for the usage of the k-rate default values P, O and V (thanks to Victor Lazzarini for implementing this feature).

ifn - function table number
ktrig - if > 0, ifn is printed once in each k-cycle (= default). for any other value, no printing is performed
kstart - first index to be printed (default = 0)
kend - first index not to be printed. -1 or 0.5 (default) mean the end of the table
kprec - float precision while printing (default = 3)
kppr - parameters per row (default = 10, maximum = 32)
****************************************************************************/
/****************************************************************************
ipos TbMem ival, ift [, indxstrt [, indxend]]
Looks whether a number is in a function table

Looks whether a number is a member of a function table, in a range between indxstart (included) and indxend (excluded). Returns the position of the element if found, or -1 otherwise.

ival - element (number) to be looked for
ift - function table
indxstart - starting index in ift to look for ival (default=0)
indxend - position after the last index which is tested (default = -1 = length of the table). if a number is given for indxend which exceeds the length of the function table, an error occurs
ipos - if ival has been found in ift, the position of the first occurence is returned, or -1, if ival has not been found
****************************************************************************/
/****************************************************************************
TbPrmRnd ift
Permutes the values of a function table randomly, at i-time

Permutes the values of ift randomly and overwrites this table with the result. See TbPrmRndk for the k-rate version

ift: function table to be permuted
****************************************************************************/
/****************************************************************************
TbPrmRndk ift, ktrig
Permutes the values of a function table randomly, at k-time

Permutes the values of ift randomly and overwrites this table with the result. This operation is performed once a k-cycle, as long as a trigger is positive. See TbPrmRnd for the i-rate version

ift - function table to be permuted
ktrig - if > 0, the permutation is performed once a k-cycle
****************************************************************************/
/****************************************************************************
iend TbRmDp iftsrc, iftdst [, ioffset [, inumels]]
Removes duplicates from a function table

Removes duplicates from a function table, copies the elements in a new table, and returns the end position (which can be used to build a table with just these elements).
Requires the UDO TbMem

iftsrc - source function table
iftdst - table (usually with the same length as iftsrc) for copying the non-duplicated elements of iftsrc
ioffset - index to start copying of elements in iftsrc
inumels - number of elements to investigate
iend - position after the last index which has been written in iftdest
****************************************************************************/
/****************************************************************************
kLin TbToLin iFt
Reads a table in the same way as a linseg opcode

Reads a table which contains segments of value - duration - value in the same way as a linseg opcocde would do.

iFt - a function table, usually generated with GEN02 and not normaized
kLin - k-rate output
****************************************************************************/
/****************************************************************************
TbToSF ift, Soutname, ktrig [,iformat [,istart [,iend]]]
Writes the content of a table to a soundfile

Writes the content of a table to a soundfile, with optional start and end point

ift - function table to write
Soutname - output file name in double quotes
iformat - output file format according to the fout manual page. if not specified or -1, the file is written with a wav header and 24 bit
istart - start in seconds in the function table to write (default=0)
iend - last point to write in the function table in seconds (default=-1: until the end)
ktrig - if 1, the file is being written in one control-cycle. Make sure the trigger is 1 just for one k-cycle; otherwise the writing operation will be repeated again and again in each control cycle
****************************************************************************/

  opcode SrtArrk, k[], k[]i
kInArr[], iLen xin    
kOutArr[]  init       iLen
kMax       maxarray   kInArr
kIndx      =          0
 until kIndx == iLen do
kMin, kMinIndx minarray kInArr
kOutArr[kIndx] =      kInArr[kMinIndx]
kInArr[kMinIndx] =    kMax+1
kIndx += 1
 od
           xout       kOutArr
  endop

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

  opcode PtkSmpB, a, iakkkkkkiii
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

  opcode PtkWrp, a, aiPOOOOP

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

  opcode Linek, kk, kkkk
;performs a linear interpolation from kthis to knext in ktim whenever ktrig is 1
kthis, knext, ktim, ktrig xin 
kstat     init      0 ;status at the begin
kfin      init      0
knprd     =         round(ktim*kr) ;number of k-cycles for ktim
ktimek    timek
 if ktrig == 1 then ;freeze values 
kthistim  =         ktimek 
kstrt     =         kthis
kend      =         knext
kstat     =         1
 endif
 if kstat == 0 then
kval      =         kthis
 elseif kstat == 1 then
kcount    =         ktimek-kthistim ;number of k-cycles in the time needed
kinc      =         (kend-kstrt) / knprd ;increment
kval      =         kstrt + kcount * kinc 
  if ktimek == kthistim+knprd then ;if target reached
kfin      =         1 ;tell it
kstat     =         2 ;set status
  else
kfin      =         0
  endif
 elseif kstat == 2 then
kval      =         kval ;stay at kval if no new trigger
kfin      =         0
 endif
          xout      kval, kfin ;value and 1 if target reached
  endop

  opcode F2M, i, io
iFq, iRnd xin
iNotNum = 12 * (log(iFq/220)/log(2)) + 57
iNotNum = (iRnd == 1 ? round(iNotNum) : iNotNum)
xout iNotNum
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

  opcode Counter, k, kkPo
kup, kdown, kstep, istart xin
kcount    init      istart
kchange   changed   kup, kdown
if kchange == 1 then
 if kup == 1 then
kcount    =         kcount+kstep
 elseif kdown == 1 then	
kcount    =         kcount-kstep
 endif
endif
          xout      kcount
  endop

  opcode FracLen, i, io
;returns the number of digits in the fractional part of inum (0=integer)
inum, ifracs xin
ifac      =         10^ifracs
if int(inum*ifac) == inum*ifac then
          igoto     end
else
ifracs    FracLen   inum, ifracs+1
endif
end:      xout      ifracs
  endop

  opcode LpPhsr, a, kkkki
kloopstart, kloopend, kspeed, kdir, irefdur xin

kstart01   =          kloopstart/irefdur ;start in 0-1 range
kend01     =	        kloopend/irefdur ;end in 0-1 range
ifqbas     =	        1 / irefdur ;phasor frequency for the whole irefdur range
kfqrel     =          ifqbas / (kend01-kstart01) * kspeed ;phasor frequency for the selected section
andxrel    phasor     kfqrel*kdir ;phasor 0-1 
atimpt     =	        andxrel * (kloopend-kloopstart) + kloopstart ;adjusted to start and end

           xout       atimpt
  
  endop

  opcode PrtArr1i, 0, i[]ojjj
iArr[], istart, iend, iprec, ippr xin
iprint     init       0
ippr       =          (ippr == -1 ? 10 : ippr)
iend       =          (iend == -1 ? lenarray(iArr) : iend)
iprec      =          (iprec == -1 ? 3 : iprec)
indx       =          istart
Sformat    sprintf    "%%%d.%df, ", iprec+3, iprec
Sdump      sprintf    "%s", "["
loop:
Snew       sprintf    Sformat, iArr[indx]
Sdump      strcat     Sdump, Snew
imod       =          (indx+1-istart) % ippr
 if imod == 0 && indx != iend-1 then
           printf_i   "%s\n", iprint+1, Sdump
Sdump      strcpy     " "
 endif
iprint     =          iprint + 1
           loop_lt    indx, 1, iend, loop
ilen       strlen     Sdump
Slast      strsub     Sdump, 0, ilen-2
           printf_i   "%s]\n", iprint+1, Slast
  endop

  opcode PrtArr1k, 0, k[]POVVO
kArr[], ktrig, kstart, kend, kprec, kppr xin
kprint     init       0
if ktrig > 0 then
kppr       =          (kppr == 0 ? 10 : kppr)
kend       =          (kend == -1 || kend == .5 ? lenarray(kArr) : kend)
kprec      =          (kprec == -1 || kprec == .5 ? 3 : kprec)
kndx       =          kstart
Sformat    sprintfk   "%%%d.%df, ", kprec+3, kprec
Sdump      sprintfk   "%s", "["
loop:
Snew       sprintfk   Sformat, kArr[kndx]
Sdump      strcatk    Sdump, Snew
kmod       =          (kndx+1-kstart) % kppr
 if kmod == 0 && kndx != kend-1 then
           printf     "%s\n", kprint+1, Sdump
Sdump      strcpyk    " "
 endif
kprint     =          kprint + 1
           loop_lt    kndx, 1, kend, loop
klen       strlenk    Sdump
Slast      strsubk    Sdump, 0, klen-2
           printf     "%s]\n", kprint+1, Slast
endif
  endop

  opcode Print_a, 0, aPO
aSig, kPeriod, kSpaces xin
kTim       timeinsts
kNextPeriod init      0
kPrevTim   init       0 
;perform printout if period has been reached
if kTim >= kPrevTim + kNextPeriod - ksmps/sr then
kIndx      =          0
Sformat    sprintfk   "%%%ds %%.6f: [", kSpaces + 5
Sout       sprintfk   Sformat, "Time:", kTim
;collect all values in a string
printloop:
kVal       vaget      kIndx, aSig
Sval       sprintfk   "%f, ", kVal
Sout       strcatk    Sout, Sval
           loop_lt    kIndx, 1, ksmps, printloop
;remove the last comma and close the bracket
kLen       strlenk    Sout
Scut       strsubk    Sout, 0, kLen-2
           printf     "%s]\n", kTim, Scut
;reset previous time and next period
kPrevTim   =          kTim      
kNextPeriod =         kPeriod
endif
  endop

  opcode TbDmp, 0, iojjo
ifn, istart, iend, iprec, ippr xin
ippr       =          (ippr == 0 ? 10 : ippr)
iend       =          (iend == -1 ? ftlen(ifn) : iend)
iprec      =          (iprec == -1 ? 3 : iprec)
indx       =          istart
Sformat    sprintf    "%%.%df, ", iprec
Sdump      sprintf    "%s", "["
loop:
ival       tab_i      indx, ifn
Snew       sprintf    Sformat, ival
Sdump      strcat     Sdump, Snew
imod       =          (indx+1-istart) % ippr
 if imod == 0 && indx != iend-1 then
           puts       Sdump, 1
Sdump      =          ""
 endif
           loop_lt    indx, 1, iend, loop
ilen       strlen     Sdump
Slast      strsub     Sdump, 0, ilen-2
           printf_i   "%s]\n", 1, Slast
  endop

  opcode TbDmpk, 0, iPOVVO
ifn, ktrig, kstart, kend, kprec, kppr xin
kprint     init       0
if ktrig > 0 then
kppr       =          (kppr == 0 ? 10 : kppr)
kend       =          (kend == -1 || kend == .5 ? ftlen(ifn) : kend)
kprec      =          (kprec == -1 || kprec == .5 ? 3 : kprec)
kndx       =          kstart
Sformat    sprintfk   "%%.%df, ", kprec
Sdump      sprintfk   "%s", "["
loop:
kval       tab        kndx, ifn
Snew       sprintfk   Sformat, kval
Sdump      strcatk    Sdump, Snew
kmod       =          (kndx+1-kstart) % kppr
 if kmod == 0 && kndx != kend-1 then
           printf     "%s\n", kprint+1, Sdump
Sdump      strcpyk    ""
 endif
kprint     =          kprint + 1
           loop_lt    kndx, 1, kend, loop
klen       strlenk    Sdump
Slast      strsubk    Sdump, 0, klen-2
           printf     "%s]\n", kprint+1, Slast
endif
  endop

  opcode TbDmpS, 0, iSojjo
;prints the content of a table in a simple way, with an additional string as 'introduction'
ifn, String, istart, iend, iprec, ippr xin; function table, first index to print, first index not to be printed (-1 =whole table), float precision while printing, String, parameters per row (maximum =  32)
ippr       =          (ippr == 0 ? 10 : ippr)
iend       =          (iend == -1 ? ftlen(ifn) : iend)
iprec      =          (iprec == -1 ? 3 : iprec)
indx       =          istart
Sformat    sprintf    "%%.%df, ", iprec
Sdump      sprintf    "%s[", String
loop:
ival       tab_i      indx, ifn
Snew       sprintf    Sformat, ival
Sdump      strcat     Sdump, Snew
imod       =          (indx+1-istart) % ippr
 if imod == 0 && indx != iend-1 then
           puts       Sdump, 1
Sdump      =          ""
 endif
           loop_lt    indx, 1, iend, loop
ilen       strlen     Sdump
Slast      strsub     Sdump, 0, ilen-2
           printf_i   "%s]\n", 1, Slast
  endop

  opcode TbDmpSk, 0, iSPOVVO
ifn, String, ktrig, kstart, kend, kprec, kppr xin
kprint     init       0
if ktrig > 0 then
kppr       =          (kppr == 0 ? 10 : kppr)
kend       =          (kend == -1 || kend == .5 ? ftlen(ifn) : kend)
kprec      =          (kprec == -1 || kprec == .5 ? 3 : kprec)
kndx       =          kstart
Sformat    sprintfk   "%%.%df, ", kprec
Sdump      sprintfk   "%s[", String
loop:
kval       tab        kndx, ifn
Snew       sprintfk   Sformat, kval
Sdump      strcatk    Sdump, Snew
kmod       =          (kndx+1-kstart) % kppr
 if kmod == 0 && kndx != kend-1 then
           printf     "%s\n", kprint+1, Sdump
Sdump      strcpyk    ""
 endif
kprint     =          kprint + 1
           loop_lt    kndx, 1, kend, loop
klen       strlenk    Sdump
Slast      strsubk    Sdump, 0, klen-2
           printf     "%s]\n", kprint+1, Slast
endif
  endop

  opcode FilPlay1, a, Skoo
Sfil, kspeed, iskip, iloop xin
ichn       filenchnls Sfil
if ichn == 1 then
aout       diskin2    Sfil, kspeed, iskip, iloop
           else
aout, ano  diskin2    Sfil, kspeed, iskip, iloop
endif
           xout       aout
  endop

  opcode FilPlay2, aa, Skoo
Sfil, kspeed, iskip, iloop xin
ichn       filenchnls Sfil
if ichn == 1 then
aL         diskin2    Sfil, kspeed, iskip, iloop
aR         =          aL
           else
aL, aR     diskin2    Sfil, kspeed, iskip, iloop
endif
           xout       aL, aR
  endop

  opcode StrayElMem, i, SSjj
;looks whether Stest is an element of Stray. returns the index of the element if found, and -1 if not.
Stray, Stest, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iout      =         -1 ;default output
iel       =         -1; actual number of element while searching
iwarleer  =         1; is this the start of a new element
indx      =         0 ;character index
inewel    =         0 ;new element to find
;;LOOP
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Schar     strsub    Stray, indx, indx+1; this character
isep1p    strcmp    Schar, Sep1; returns 0 if Schar is sep1
isep2p    strcmp    Schar, Sep2; 0 if Schar is sep2
is_sep    =         (isep1p == 0 || isep2p == 0 ? 1 : 0) ;1 if Schar is a seperator
 ;END OF STRING AND NO SEPARATORS BEFORE?
 if indx == ilen && iwarleer == 0 then
Sel       strsub    Stray, istartsel, -1
inewel    =         1
 ;FIRST CHARACTER OF AN ELEMENT?
 elseif is_sep == 0 && iwarleer == 1 then
istartsel =         indx ;if so, set startindex
iwarleer  =         0 ;reset info about previous separator 
iel       =         iel+1 ;increment element count
 ;FIRST SEPERATOR AFTER AN ELEMENT?
 elseif iwarleer == 0 && is_sep == 1 then
Sel       strsub    Stray, istartsel, indx ;get elment
inewel    =         1 ;tell about
iwarleer  =         1 ;reset info about previous separator
 endif
 ;CHECK THE ELEMENT
 if inewel == 1 then ;for each new element
icmp      strcmp    Sel, Stest ;check whether equals Stest
  ;terminate and return the position of the element if successful
  if icmp == 0 then
iout      =         iel
          igoto     end
  endif
 endif
inewel    =         0
          loop_le   indx, 1, ilen, loop 
end:
          xout      iout
  endop 

  opcode StrayGetEl, S, Sijj
;returns the element at position ielindx in Stray, or an empty string if the element has not been found
Stray, ielindx, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iendsel   =         -1; endindex for searched element
iel       =         0; actual number of element while searching
iwarleer  =         1
indx      =         0
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Snext     strsub    Stray, indx, indx+1; next sign
isep1p    strcmp    Snext, Sep1; returns 0 if Snext is sep1
isep2p    strcmp    Snext, Sep2; 0 if Snext is sep2
;;NEXT SIGN IS NOT SEP1 NOR SEP2
if isep1p != 0 && isep2p != 0 then
 if iwarleer == 1 then; first character after a seperator 
  if iel == ielindx then; if searched element index
istartsel =         indx; set it
iwarleer  =         0
  else 			;if not searched element index
iel       =         iel+1; increase it
iwarleer  =         0; log that it's not a seperator 
  endif 
 endif 
;;NEXT SIGN IS SEP1 OR SEP2
else 
 if istartsel > -1 then; if this is first selector after searched element
iendsel   =         indx; set iendsel
          igoto     end ;break
 else	
iwarleer  =         1
 endif 
endif
          loop_lt   indx, 1, ilen, loop 
end:
Sout      strsub    Stray, istartsel, iendsel
          xout      Sout
  endop 

  opcode StrayGetNum, i, Sijj
;returns ielindex in Stray. this element must be a number
Stray, ielindx, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iendsel   =         -1; endindex for searched element
iel       =         0; actual number of element while searching
iwarleer  =         1
indx      =         0
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Snext     strsub    Stray, indx, indx+1; next sign
isep1p    strcmp    Snext, Sep1; returns 0 if Snext is sep1
isep2p    strcmp    Snext, Sep2; 0 if Snext is sep2
;;NEXT SIGN IS NOT SEP1 NOR SEP2
if isep1p != 0 && isep2p != 0 then
 if iwarleer == 1 then; first character after a seperator 
  if iel == ielindx then; if searched element index
istartsel =         indx; set it
iwarleer  =         0
  else 			;if not searched element index
iel       =         iel+1; increase it
iwarleer  =         0; log that it's not a seperator 
  endif 
 endif 
;;NEXT SIGN IS SEP1 OR SEP2
else 
 if istartsel > -1 then; if this is first selector after searched element
iendsel   =         indx; set iendsel
          igoto     end ;break
 else	
iwarleer  =         1
 endif 
endif
          loop_lt   indx, 1, ilen, loop 
end: 		
Snum      strsub    Stray, istartsel, iendsel
inum      strtod    Snum
          xout      inum
  endop 

  opcode StrayLen, i, Sjj
;returns the number of elements in Stray. elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). if just one seperator is used, isep2 equals isep1
Stray, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
icount    =         0; number of elements
iwarsep   =         1
indx      =         0
 if ilen == 0 igoto end ;don't go into the loop if String is empty
loop:
Snext     strsub    Stray, indx, indx+1; next sign
isep1p    strcmp    Snext, Sep1; returns 0 if Snext is sep1
isep2p    strcmp    Snext, Sep2; 0 if Snext is sep2
 if isep1p == 0 || isep2p == 0 then; if sep1 or sep2
iwarsep   =         1; tell the log so
 else 				; if not 
  if iwarsep == 1 then	; and has been sep1 or sep2 before
icount    =         icount + 1; increase counter
iwarsep   =         0; and tell you are ot sep1 nor sep2 
  endif 
 endif	
          loop_lt   indx, 1, ilen, loop 
end:      xout      icount
  endop 

  opcode StrNumP, i, S
Str        xin
ip         =          1; start at yes and falsify
ilen       strlen     Str
 if ilen == 0 then
ip         =          0
           igoto      end
 endif
ifirst     strchar    Str, 0
 if ifirst == 45 then; a "-" is just allowed as first character
Str        strsub     Str, 1, -1
ilen       =          ilen-1
 endif
indx       =          0
inpnts     =          0; how many points have there been
loop:
iascii     strchar    Str, indx; 48-57
 if iascii < 48 || iascii > 57 then; if not 0-9
  if iascii == 46 && inpnts == 0 then; if not the first point
inpnts     =          1
           else
ip         =          0
  endif
 endif
           loop_lt    indx, 1, ilen, loop
end:       xout       ip
  endop

  opcode StrayNumLen, i, Sjj
  ;requires the UDOs StrayGetEl, StrayLen and StrNumP
Stray, isepA, isepB xin
isep1      =          (isepA == -1 ? 32 : isepA)
isep2      =          (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
ilen       StrayLen   Stray, isep1, isep2
 if ilen == 0 igoto end ;don't go into the loop if there is nothing to do
icount     =          0; number of elements
indx       =          0
loop:
Snext      StrayGetEl Stray, indx, isep1, isep2
inump      StrNumP    Snext
 if inump == 1 then
icount     =          icount + 1
 endif
           loop_lt    indx, 1, ilen, loop
end:       xout       icount
  endop

  opcode StrayNumMem, i, Sijj
;looks whether inum is an element of Stray. returns the index of the element if found, and -1 if not.
Stray, inum, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iout      =         -1 ;default output
iel       =         -1; actual number of element while searching
iwarleer  =         1; is this the start of a new element
indx      =         0 ;character index
inewel    =         0 ;new element to find
;;LOOP
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Schar     strsub    Stray, indx, indx+1; this character
isep1p    strcmp    Schar, Sep1; returns 0 if Schar is sep1
isep2p    strcmp    Schar, Sep2; 0 if Schar is sep2
is_sep    =         (isep1p == 0 || isep2p == 0 ? 1 : 0) ;1 if Schar is a seperator
 ;END OF STRING AND NO SEPARATORS BEFORE?
 if indx == ilen && iwarleer == 0 then
Sel       strsub    Stray, istartsel, -1
inewel    =         1
 ;FIRST CHARACTER OF AN ELEMENT?
 elseif is_sep == 0 && iwarleer == 1 then
istartsel =         indx ;if so, set startindex
iwarleer  =         0 ;reset info about previous separator 
iel       =         iel+1 ;increment element count
 ;FIRST SEPERATOR AFTER AN ELEMENT?
 elseif iwarleer == 0 && is_sep == 1 then
Sel       strsub    Stray, istartsel, indx ;get element
inewel    =         1 ;tell about
iwarleer  =         1 ;reset info about previous separator
 endif
 ;CHECK THE ELEMENT
 if inewel == 1 then ;for each new element
inump     StrNumP   Sel ;check whether element is number
  if inump == 1 then
inumber   strtod    Sel ;if so, convert
   if inumber == inum then ;check if equals inum
iout      =         iel
          igoto     end ;if so, terminate
   endif
  endif
 endif
inewel    =         0
          loop_le   indx, 1, ilen, loop 
end:
          xout      iout
  endop 

  opcode StrayNumSum, i, Sjj
  ;requires the UDOs StrayLen and StrayGetEl
Stray, isepA, isepB xin
isep1      =          (isepA == -1 ? 32 : isepA)
isep2      =          (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1       sprintf    "%c", isep1
Sep2       sprintf    "%c", isep2
isumtot    =          0
ilen       StrayLen   Stray, isep1, isep2
if ilen == 0 igoto end
indx       =          0
loop:
Snum       StrayGetEl Stray, indx, isep1, isep2
;test if Snum is an math expression
isum       strindex   Snum, "+"; sum
idif       strindex   Snum, "-"; difference
ipro       strindex   Snum, "*"; product
irat       strindex   Snum, "/"; ratio
ipow       strindex   Snum, "^"; power
imod       strindex   Snum, "%"; modulo
 if ipow > -1 then
ifirst     strindex   Snum, "^"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
iratio     strindex   S2, "/"
ifirst     strtod     S1
  if iratio == -1 then
isec       strtod     S2
           else
Snumer     strsub     S2, 0, iratio
Sdenom     strsub     S2, iratio+1
inumer     strtod     Snumer
idenom     strtod     Sdenom
isec       =          inumer / idenom
  endif
inum       =          ifirst ^ isec
 elseif imod > -1 then
ifirst     strindex   Snum, "%"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst % isec
 elseif ipro > -1 then
ifirst     strindex   Snum, "*"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst * isec
 elseif irat > -1 then
ifirst     strindex   Snum, "/"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst / isec
 elseif isum > -1 then
ifirst     strindex   Snum, "+"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst + isec
 elseif idif > -1 then
ifirst     strrindex  Snum, "-";(last occurrence: -3-4 is possible, but not 3--4)
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst - isec
           else
inum       strtod     Snum
 endif
isumtot    =          isumtot + inum
           loop_lt    indx, 1, ilen, loop
end:       xout       isumtot
  endop

  opcode StrExpr1, i, S
Str       xin
isum      strindex  Str, "+"; sum
idif      strindex  Str, "-"; difference
ipro      strindex  Str, "*"; product
irat      strindex  Str, "/"; ratio
ipow      strindex  Str, "^"; power
imod      strindex  Str, "%"; modulo
 if ipow > 0 then
ifirst    strindex  Str, "^"
S1        strsub    Str, 0, ifirst
S2        strsub    Str, ifirst+1
i1        strtod    S1
i2        strtod    S2
ires      =         i1 ^ i2
 elseif imod > 0 then
ifirst    strindex  Str, "%"
S1        strsub    Str, 0, ifirst
S2        strsub    Str, ifirst+1
i1        strtod    S1
i2        strtod    S2
ires      =         i1 % i2
 elseif ipro > 0 then
ifirst    strindex  Str, "*"
S1        strsub    Str, 0, ifirst
S2        strsub    Str, ifirst+1
i1        strtod    S1
i2        strtod    S2
ires      =         i1 * i2
 elseif irat > 0 then
ifirst    strindex  Str, "/"
S1        strsub    Str, 0, ifirst
S2        strsub    Str, ifirst+1
i1        strtod    S1
i2        strtod    S2
ires      =         i1 / i2
 elseif isum > 0 then 
ifirst    strindex  Str, "+"
S1        strsub    Str, 0, ifirst
S2        strsub    Str, ifirst+1
i1        strtod    S1
i2        strtod    S2
ires      =         i1 + i2
 elseif idif > -1 then
ifirst    strrindex Str, "-";(last occurrence: -3-4 is possible, but not 3--4)
S1        strsub    Str, 0, ifirst
S2        strsub    Str, ifirst+1
iS1len    strlen    S1
 if iS1len == 0 then ;just a negative number
inum      strtod    S2
ires      =         -inum
 else	 
ifirst    strtod    S1
isec      strtod    S2
ires      =         ifirst - isec
  endif
 else
ires      strtod    Str
 endif
          xout      ires
  endop 

  opcode StrExpr2, i, S
Sin       xin
ilen      strlen    Sin
;if a parenthesis can be found
iparenth  strindex  Sin, "("
if iparenth > -1 then
  ;if in first half and no '-' preceeds
  if iparenth == 0 then
    ;then first element ends in ")"
iprend    strindex   Sin, ")"
S1        strsub     Sin, 1, iprend
    ;convert this element into a number
i1        StrExpr1   S1
    ;append the rest and convert again
S2        strsub     Sin, iprend+2 
Sep       strsub     Sin, iprend+1, iprend+2
Scoll     sprintf    "%f%s%s", i1, Sep, S2
ires      StrExpr1   Scoll
  ;if in first half and '-' preceeds
  elseif iparenth == 1 then
    ;then first element ends in ")"
iprend    strindex   Sin, ")"
S1        strsub     Sin, 2, iprend
    ;convert this element into a number
i1        StrExpr1   S1
i1        =          -i1
    ;append the rest and convert again
S2        strsub     Sin, iprend+2 
Sep       strsub     Sin, iprend+1, iprend+2
Scoll     sprintf    "%f%s%s", i1, Sep, S2
ires      StrExpr1   Scoll
  ;if the parenthesis is in the second half
  else
    ;isolate first element and the conjunction
S1        strsub     Sin, 0, iparenth-1
Sep       strsub     Sin, iparenth-1, iparenth
    ;convert the second element
S2        strsub     Sin, iparenth+1, ilen-1
i2        StrExpr1   S2
      ;if subtraction and i2 negative, convert to addition
isepminus strcmp     Sep, "-"
      if i2 < 0 && isepminus == 0 then
i2        =          -i2
Sep       =          "+"
      endif
    ;convert the whole
Scoll     sprintf    "%s%s%f", S1, Sep, i2
ires      StrExpr1   Scoll
  endif
;if no parenthesis, simply convert
else	
ires      StrExpr1   Sin
endif
          xout       ires
  endop

  opcode StrayNumToFt, ii, Sojj
  ;requires the UDOs StrayLen, StrExpr1 and StrExpr2
Stray, iftno, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;CREATE A FUNCTION TABLE
iftlen    StrayLen  Stray, isep1, isep2
 if iftlen == 0 then
          prints    "WARNING! StrayNumToFt got empty string as input. Function table with length=1 created, but iftlen=0 returned.\n"
iftl      =         1
 else
iftl      =         iftlen
 endif
ift       ftgen     iftno, 0, -iftl, -2, 0 
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iel       =         -1; number of element in Stray and ift
iwarleer  =         1; is this the start of a new element
indx      =         0 ;character index
inewel    =         0 ;new element to find
;;LOOP
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Schar     strsub    Stray, indx, indx+1; this character
isep1p    strcmp    Schar, Sep1; returns 0 if Schar is sep1
isep2p    strcmp    Schar, Sep2; 0 if Schar is sep2
is_sep    =         (isep1p == 0 || isep2p == 0 ? 1 : 0) ;1 if Schar is a seperator
 ;END OF STRING AND NO SEPARATORS BEFORE?
 if indx == ilen && iwarleer == 0 then
Sel       strsub    Stray, istartsel, -1
inewel    =         1
 ;FIRST CHARACTER OF AN ELEMENT?
 elseif is_sep == 0 && iwarleer == 1 then
istartsel =         indx ;if so, set startindex
iwarleer  =         0 ;reset info about previous separator 
iel       =         iel+1 ;increment element count
 ;FIRST SEPERATOR AFTER AN ELEMENT?
 elseif iwarleer == 0 && is_sep == 1 then
Sel       strsub    Stray, istartsel, indx ;get element
inewel    =         1 ;tell about
iwarleer  =         1 ;reset info about previous separator
 endif
 ;WRITE THE ELEMENT TO THE TABLE
 if inewel == 1 then
inum      StrExpr2  Sel ;convert expression to number
          tabw_i    inum, iel, ift ;write to ift
 endif
inewel    =         0
          loop_le   indx, 1, ilen, loop 
end:
          xout      ift, iftlen
  endop 

  opcode StrayRemDup, S, Sjj
;removes duplicates in Stray and returns the result. elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). if just one seperator is used, isep2 equals isep1.
;requires the UDOs StrayLen and StrayGetEl
Stray, isepA, isepB xin
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
ilen1     StrayLen  Stray, isep1, isep2
Sres      =         ""
if ilen1 == 0 igoto end1 
indx1     =         0
loop1:
Sel       StrayGetEl Stray, indx1, isep1, isep2; get element
ires      =         0
ilen      StrayLen  Sres, isep1, isep2; length of Sres
if ilen == 0 igoto end 
indx      =         0
loop:	;iterate over length of Sres
Snext     StrayGetEl Sres, indx, isep1, isep2
icomp     strcmp    Snext, Sel
 if icomp == 0 then
ires      =         1
          igoto     end 
 endif
          loop_lt   indx, 1, ilen, loop 
end:		
 if ires == 0 then ;if element is not already in Sres, append
Sdran     sprintf   "%s%s", Sep1, Sel
Sres      strcat    Sres, Sdran
 endif

          loop_lt	indx1, 1, ilen1, loop1 
end1:		
Sout      strsub    Sres, 1; remove starting sep1
          xout      Sout
  endop 

  opcode StrayRev, S, Sjjj
;reverses the elements in Stray and returns the result. elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). if just one seperator is used, isep2 equals isep1. the elements in the resulting string Sres are seperated by isepOut (default=isep1)
Stray, isepA, isepB, isepOut xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
isepOut   =         (isepOut == -1 ? isep1 : isepOut)
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
Sres      =         ""
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iwarleer  =         1; is this the start of a new element
indx      =         0 ;character index
inewel    =         0 ;new element to find
;;LOOP
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Schar     strsub    Stray, indx, indx+1; this character
isep1p    strcmp    Schar, Sep1; returns 0 if Schar is sep1
isep2p    strcmp    Schar, Sep2; 0 if Schar is sep2
is_sep    =         (isep1p == 0 || isep2p == 0 ? 1 : 0) ;1 if Schar is a seperator
 ;END OF STRING AND NO SEPARATORS BEFORE?
 if indx == ilen && iwarleer == 0 then
Sel       strsub    Stray, istartsel, -1
inewel    =         1
 ;FIRST CHARACTER OF AN ELEMENT?
 elseif is_sep == 0 && iwarleer == 1 then
istartsel =         indx ;if so, set startindex
iwarleer  =         0 ;reset info about previous separator 
 ;FIRST SEPERATOR AFTER AN ELEMENT?
 elseif iwarleer == 0 && is_sep == 1 then
Sel       strsub    Stray, istartsel, indx ;get elment
inewel    =         1 ;tell about
iwarleer  =         1 ;reset info about previous separator
 endif
 ;PREPEND THE ELEMENT TO THE RESULT
 if inewel == 1 then ;for each new element
Selsep    sprintf   "%c%s", isepOut, Sel ;prepend seperator
Sres      strcat    Selsep, Sres ;prepend to result
 endif
inewel    =         0
          loop_le   indx, 1, ilen, loop 
end:
Sout      strsub    Sres, 1; remove starting seperator
          xout      Sout
  endop 

  opcode StrayRndEl, S, Sjj
Stray, isepA, isepB xin
iLen       StrayLen   Stray, isepA, isepB
iElIndx    rnd31      iLen, 0
Sel        StrayGetEl Stray, abs(int(iElIndx)), isepA, isepB
           xout       Sel
  endop

  opcode StraySetEl, S, SSjjjj
;puts the string Sin at the position ielindx (default=-1: at the end) of Stray, and returns the result as a string. elements in the string are seperated by the two ascii-coded seperators isepA (default=32: space) and isepB (default=9: tab). if just isepA is given, it is also read as isepB. the element is inserted using the seperator isepOut (default=isep1)
Stray, Sin, ielindx, isepA, isepB, isepOut xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
isepOut   =         (isepOut == -1 ? isep1 : isepOut)
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
SepOut    sprintf   "%c", isepOut
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
iel       =         0; actual element position
iwarsep   =         1
indx      =         0
;;APPEND Sin IF ielindx=-1
 if ielindx == -1 then
Sres      sprintf   "%s%s%s", Stray, SepOut, Sin
          igoto     end	
 endif
;;PREPEND Sin IF ielindx=0
 if ielindx == 0 then
Sres      sprintf   "%s%s%s", Sin, SepOut, Stray
          igoto     end	
  endif
loop:
Snext     strsub    Stray, indx, indx+1; next sign
isep1p    strcmp    Snext, Sep1; returns 0 if Snext is sep1
isep2p    strcmp    Snext, Sep2; 0 if Snext is sep2
;;NEXT SIGN IS NOT SEP1 NOR SEP2
if isep1p != 0 && isep2p != 0 then
 if iwarsep == 1 then; first character after a seperator 
  if iel == ielindx then; if searched element index
S1        strsub    Stray, 0, indx; string before Sin
S2        strsub    Stray, indx, -1; string after Sin
Sres      sprintf   "%s%s%s%s", S1, Sin, SepOut, S2
          igoto     end
  else 			;if not searched element index
iel       =         iel+1; increase it
iwarsep   =         0; log that it's not a seperator 
  endif 
 endif 
;;NEXT SIGN IS SEP1 OR SEP2
else 
iwarsep   =         1
endif
          loop_lt   indx, 1, ilen, loop 
;;APPEND Sin IF ielindx is >= number of elements
Sres      sprintf   "%s%s%s", Stray, SepOut, Sin
end:      xout      Sres
  endop 

  opcode StraySetNum, S, Sijjjj
  ;requires the UDO FracLen
Stray, inum, ielindx, isepA, isepB, isepOut xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
isepOut   =         (isepOut == -1 ? isep1 : isepOut)
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
SepOut    sprintf   "%c", isepOut
;;INITIALIZE SOME PARAMETERS
ifracs    FracLen   inum
ilen      strlen    Stray
iel       =         0; actual element position
iwarsep   =         1
indx      =         0
;;APPEND inum IF ielindx=-1
 if ielindx == -1 then
Sformat   sprintf   "%%s%%s%%.%df", ifracs
Sres      sprintf   Sformat, Stray, SepOut, inum
          igoto     end	
 endif
;;PREPEND inum IF ielindx=0
 if ielindx == 0 then
Sformat   sprintf   "%%.%df%%s%%s", ifracs
Sres      sprintf   Sformat, inum, SepOut, Stray
          igoto     end	
  endif
loop:
Snext     strsub    Stray, indx, indx+1; next sign
isep1p    strcmp    Snext, Sep1; returns 0 if Snext is sep1
isep2p    strcmp    Snext, Sep2; 0 if Snext is sep2
;;NEXT SIGN IS NOT SEP1 NOR SEP2
if isep1p != 0 && isep2p != 0 then
 if iwarsep == 1 then; first character after a seperator 
  if iel == ielindx then; if searched element index
S1        strsub    Stray, 0, indx; string before Sin
S2        strsub    Stray, indx, -1; string after Sin
Sformat   sprintf   "%%s%%.%df%%s%%s", ifracs
Sres      sprintf   Sformat, S1, inum, SepOut, S2
          igoto     end
  else              ;if not searched element index
iel       =         iel+1; increase it
iwarsep   =         0; log that it's not a seperator 
  endif 
 endif 
;;NEXT SIGN IS SEP1 OR SEP2
else 
iwarsep   =         1
endif
          loop_lt   indx, 1, ilen, loop 
;;APPEND inum IF ielindx IS >= NUMBER OF ELEMENTS
Sformat   sprintf   "%%s%%s%%.%df", ifracs
Sres      sprintf   Sformat, Stray, SepOut, inum
end:		xout      Sres
  endop 

  opcode StraySub, S, Sojjjj
;returns a subset of elements in Stray. elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). if just one seperator is used, isep2 equals isep1.
Stray, istart, iend, isepA, isepB, isepOut xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
isepOut   =         (isepOut == -1 ? 32 : isepOut)
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
Sres      =         ""
ilen      strlen    Stray
iend      =         (iend == -1 ? ilen : iend) ;for simplifying tests later
istartsel =         -1; startindex for any element
iel       =         -1; actual number of element while searching
iwarleer  =         1; is this the start of a new element
indx      =         0 ;character index
inewel    =         0 ;new element to find
;;LOOP
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Schar     strsub    Stray, indx, indx+1; this character
isep1p    strcmp    Schar, Sep1; returns 0 if Schar is sep1
isep2p    strcmp    Schar, Sep2; 0 if Schar is sep2
is_sep    =         (isep1p == 0 || isep2p == 0 ? 1 : 0) ;1 if Schar is a seperator
 ;END OF STRING AND NO SEPARATORS BEFORE?
 if indx == ilen && iwarleer == 0 then
Sel       strsub    Stray, istartsel, -1
inewel    =         1
 ;FIRST CHARACTER OF AN ELEMENT?
 elseif is_sep == 0 && iwarleer == 1 then
istartsel =         indx ;if so, set startindex
iwarleer  =         0 ;reset info about previous separator 
iel       =         iel+1 ;increment element count
 ;FIRST SEPERATOR AFTER AN ELEMENT?
 elseif iwarleer == 0 && is_sep == 1 then
Sel       strsub    Stray, istartsel, indx ;get elment
inewel    =         1 ;tell about
iwarleer  =         1 ;reset info about previous separator
 endif
 ;APPEND THE ELEMENT TO THE RESULT IF IN RANGE
 if inewel == 1 && iel >= istart && iel < iend then ;for each new element in range
Selsep    sprintf   "%c%s", isepOut, Sel ;prepend seperator
Sres      strcat    Sres, Selsep ;append to result
 endif
inewel    =         0
          loop_le   indx, 1, ilen, loop 
end:
Sout      strsub    Sres, 1; remove starting seperator
          xout      Sout
  endop 

  opcode StrMems, i, SS
Str, Sel   xin
iSumEls    =          0
iLen       strlen     Str
iIndx      =          0
Sub        strcpy     Str
  until iIndx == iLen do
iPos       strindex   Sub, Sel
   if iPos > -1 then
iSumEls    =          iSumEls+1
Sub        strsub     Sub, iPos+1
iIndx      =          iPos+1
   else
iIndx      =          iLen
   endif
  od
           xout       iSumEls
  endop

  opcode StrToAscS, S, S
Sin        xin
ilen       strlen     Sin
ipos       =          0
Sres       =          ""
loop:
ichr       strchar    Sin, ipos
Snew       sprintf    "%d ", ichr
Sres       strcat     Sres, Snew
           loop_lt    ipos, 1, ilen, loop
           xout       Sres
  endop

  opcode StrAgrm, S, Sj
Sin, iLen  xin
 if iLen == -1 then
iLen       strlen     Sin
 endif
Sout       =          ""
;for all elements in Sin
iCnt       =          0
iRange     =          iLen
loop:
;get one randomly
iRnd       rnd31      iRange-.0001, 0
iRnd       =          int(abs(iRnd))
Sel        strsub     Sin, iRnd, iRnd+1
Sout       strcat     Sout, Sel
;take it out from Sin
Ssub1      strsub     Sin, 0, iRnd
Ssub2      strsub     Sin, iRnd+1
Sin        strcat     Ssub1, Ssub2
;adapt range (new length)
iRange     =          iRange-1
           loop_lt    iCnt, 1, iLen, loop
           xout       Sout
  endop

  opcode StrAgrmk, S, S
  ;same at k-time
Sin  xin
kLen       strlenk    Sin
Sout       strcpyk    ""
Sin        strcpyk    Sin
;for all elements in Sin
kCnt       =          0
kRange     =          kLen
loop:
;get one randomly
kRnd       rnd31      kRange-.0001, 0
kRnd       =          int(abs(kRnd))
Sel        strsubk    Sin, kRnd, kRnd+1
Sout       strcatk    Sout, Sel
;take it out from Sin
Ssub1      strsubk    Sin, 0, kRnd
Ssub2      strsubk    Sin, kRnd+1, kLen
Sin        strcatk    Ssub1, Ssub2
;adapt range (new length)
kRange     =          kRange-1
           loop_lt    kCnt, 1, kLen, loop
           xout       Sout
  endop

  opcode FilDir, S, S
;returns the directory of a file path
Spath      xin
ipos      strrindex Spath, "/"
Sdir      strsub    Spath, 0, ipos
          xout      Sdir
  endop

  opcode FilDirUp, S, S
  ;returns the directory above the current directory
SCurDir    xin
;make sure the input does not end with '/'
ilen       strlen     SCurDir
ipos       strrindex  SCurDir, "/"
 if ipos == ilen-1 then
Sok        strsub     SCurDir, 0, ipos
 else	
Sok        strcpy     SCurDir
 endif
ipos       strrindex  Sok, "/"
SUpDir     strsub     Sok, 0, ipos
           xout       SUpDir
  endop

  opcode FilNam, S, S
;returns the name of a file path
Spath      xin
ipos      strrindex Spath, "/"
Snam      strsub    Spath, ipos+1
          xout      Snam
  endop

  opcode FilSuf, S, So
  ;returns the suffix of a filename or path, optional in lower case 
Spath,ilow xin
ipos      strrindex Spath, "."
Suf       strsub    Spath, ipos+1
 if ilow != 0 then
Suf       strlower  Suf 
 endif
          xout      Suf
  endop

  opcode TbToSF, 0, iSkjoj
ift, Soutname, ktrig, iformat, istart, iend xin; start (default = 0) and end (default = last sample) in seconds
istrtsmps =         istart*sr; start to write in samples 
iendsmps  =         (iend == -1 ? ftlen(ift) : iend*sr); end to write in samples
 if iformat == -1 then
iformat   =         18; default: wav 24 bit (for other options see fout manual page)
 endif
 if ktrig == 1 then; make sure that trigger sends "1" just for one k-cycle
kcnt      init      istrtsmps; set the counter to 0 at start
loop:
kcnt      =         kcnt+ksmps; next value (e.g. 10 if ksmps=10)
andx      interp    kcnt-1; build audio index (e.g. from 0 to 9)
asig      tab       andx, ift; read the table values as audio signal
          fout      Soutname, iformat, asig; write asig to a file
 if kcnt <= iendsmps-ksmps kgoto loop; go back as long there is something to do
 endif 
  endop

  opcode TbPrmRnd, 0, i
ift xin
itablen    =          ftlen(ift)
icopy      ftgentmp   0, 0, -itablen, -2, 0
           tableicopy  icopy, ift
ileng      =          itablen
indxerg    =          0
loop:
irand      random     0, ileng - .0001
index      =          int(irand)
ival       tab_i      index, icopy
           tabw_i     ival, indxerg, ift
lshift:
if (index == ileng-1) igoto next
indxneu    =          index
indxalt    =          indxneu+1
ivalalt    tab_i      indxalt, icopy
           tabw_i     ivalalt, indxneu, icopy
index      =          index + 1
           igoto      lshift
next:
ileng      =          ileng - 1
indxerg    =          indxerg + 1
if (ileng > 0) igoto loop
  endop

  opcode TbPrmRndk, 0, ik
;changes the contents of ift each time ktrig is positive
ift, ktrig xin
itablen    =          ftlen(ift)
icopy      ftgentmp   0, 0, -itablen, -2, 0
if ktrig > 0 then
           tablecopy  icopy, ift
kleng      =          itablen
kndxerg    =          0
loop:
krand      random     0, kleng - .0001
kndex      =          int(krand)
kval       tab        kndex, icopy
           tabw       kval, kndxerg, ift
lshift:
if (kndex == kleng-1) kgoto next
kndxneu    =          kndex
kndxalt    =          kndxneu+1
kvalalt    tab        kndxalt, icopy
           tabw       kvalalt, kndxneu, icopy
kndex      =          kndex + 1
           kgoto      lshift
next:
kleng      =          kleng - 1
kndxerg    =          kndxerg + 1
if (kleng > 0) kgoto loop
endif
  endop

  opcode TbMem, i, iioj
ival, ift, indxstrt, indxend xin
indxend   =         (indxend == -1 ? ftlen(ift) : indxend)
ipos      =         -1
loop:
iftel     tab_i     indxstrt, ift
  if iftel == ival then
ipos      =         indxstrt
          igoto     end  
  endif
          loop_lt   indxstrt, 1, indxend, loop
end:      xout      ipos
  endop

  opcode TbRmDp, i, iioj
iftsrc, iftdst, ioffset, inumels xin
;copy first element
ifirst    tab_i     ioffset, iftsrc
          tabw_i    ifirst, 0, iftdst
;calculate border in iftsrc
iftlen    tableng   iftsrc
ireadend  =         (inumels == -1 || ioffset+inumels > iftlen ? iftlen : inumels+ioffset)
;compare each element with all already written in iftdst
;and add to iftdst if not already there
ireadindx =         ioffset+1
iwritindx =         1
loop:
iel       tab_i     ireadindx, iftsrc
itest     TbMem     iel, iftdst, 0, iwritindx
 if itest == -1 then
          tabw_i    iel, iwritindx, iftdst
iwritindx =         iwritindx + 1
 endif
          loop_lt   ireadindx, 1, ireadend, loop
          xout      iwritindx
  endop

  opcode TbToLin, k, i
ift        xin
iftlen     tableng    ift
indx1      =          0
indx2      =          1
indx3      =          2
segment:
if indx3 >= iftlen igoto end
iStart     table      indx1, ift
iDur       table      indx2, ift
iTarget    table      indx3, ift
           timout     0, iDur, do
           reinit     segment
do:
kOut       linseg     iStart, iDur, iTarget
indx1      =          indx1+2
indx2      =          indx2+2
indx3      =          indx3+2
end:
           xout       kOut
  endop


