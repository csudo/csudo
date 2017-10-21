/****************************************************************************
aout FilPlay1 Sfil, kspeed [, iskip [, iloop]]
Plays a mono signal from a mono or stereo soundfile

Gives mono output regardless a soundfile is mono or stereo (if stereo, just the first channel is used).
written by joachim heintz

Sfil - Sound file name (or path) in double quotes
iskip - skiptime in seconds (default=0)
iloop - 1 = loop, 0 = no loop (default=0)
kspeed - speed to read the file (1 = normal, 2 = octave higher, 0.5 = octave lower) ****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-d -odac
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

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

instr 1
asig       FilPlay1   "../_sourcefiles/fox.wav", 1
           out        asig
endin

instr 2
asig       FilPlay1   "../_sourcefiles/2_channel_file.wav", 1
           out        asig
endin
</CsInstruments>
<CsScore>
i 1 0 5
i 2 5 5
</CsScore>
</CsoundSynthesizer>

