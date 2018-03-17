/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN soundfiles:
*****************************************************************************
SfPlay1    : aout SfPlay1 Sfil, kspeed [, iskip [, iloop]]
SfPlay2    : aL, aR SfPlay2 Sfil, kspeed [, iskip [, iloop]]
*****************************************************************************
****************************************************************************/

/****************************************************************************
aout SfPlay1 Sfil, kspeed [, iskip [, iloop]]
Plays a mono signal from a mono or stereo soundfile

Gives mono output regardless a soundfile is mono or stereo (if stereo, just the first channel is used).
written by joachim heintz

Sfil - Sound file name (or path) in double quotes
iskip - skiptime in seconds (default=0)
iloop - 1 = loop, 0 = no loop (default=0)
kspeed - speed to read the file (1 = normal, 2 = octave higher, 0.5 = octave lower) ****************************************************************************/
/****************************************************************************
aL, aR SfPlay2 Sfil, kspeed [, iskip [, iloop]]
Plays a stereo signal from a mono or stereo soundfile

Gives stereo output regardless a soundfile is mono or stereo (if mono, this signal is sent to both channels).
written by joachim heintz

Sfil - Sound file name (or path) in double quotes
iskip - skiptime in seconds (default=0)
iloop - 1 = loop, 0 = no loop (default=0)
kspeed - speed to read the file (1 = normal, 2 = octave higher, 0.5 = octave lower)
****************************************************************************/

  opcode SfPlay1, a, Skoo
Sfil, kspeed, iskip, iloop xin
ichn       filenchnls Sfil
if ichn == 1 then
aout       diskin2    Sfil, kspeed, iskip, iloop
           else
aout, ano  diskin2    Sfil, kspeed, iskip, iloop
endif
           xout       aout
  endop

  opcode SfPlay2, aa, Skoo
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


