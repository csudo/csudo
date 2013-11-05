/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN soundfiles:
*****************************************************************************
FilPlay1   : aout FilPlay1 Sfil, kspeed [, iskip [, iloop]]
FilPlay2   : aL, aR FilPlay2 Sfil, kspeed [, iskip [, iloop]]
*****************************************************************************
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


