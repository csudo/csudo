/****************************************************************************
TbToSF ift, Soutname, ktrig [,iformat [,istart [,iend]]]
Writes the content of a table to a soundfile.
NOTE. After Csound 6.11 you can use the ftaudio opcode!

Writes the content of a table to a soundfile, with optional start and end point
written by joachim heintz

ift - function table to write
Soutname - output file name in double quotes
iformat - output file format according to the fout manual page. if not specified or -1, the file is written with a wav header and 24 bit
istart - start in seconds in the function table to write (default=0)
iend - last point to write in the function table in seconds (default=-1: until the end)
ktrig - if 1, the file is being written in one control-cycle. Make sure the trigger is 1 just for one k-cycle; otherwise the writing operation will be repeated again and again in each control cycle
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

giAudio   ftgen     0, 0, -5*sr, 2, 0; size for 5 seconds of recording audio data
          
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

instr 1; generating a band filtered noise for 5 seconds, and recording it
aNois     rand      .2
kCfreq    randomi   200, 2000, 3; random center frequency
aFilt     butbp     aNois, kCfreq, kCfreq/10; filtered noise
aBal      balance   aFilt, aNois, 1; balance amplitude
          outs      aBal, aBal
;;record the audiosignal with a phasor as index
aindx     phasor    1/5
          tablew    aBal, aindx, giAudio, 1
endin

instr 2; write the whole giAudio table to a soundfile
ktrig     init      1
          TbToSF    giAudio, "TbToSF.wav", ktrig
ktrig     =         0
endin

instr 3; write the first two seconds
ktrig     init      1
          TbToSF    giAudio, "TbToSF1.wav", ktrig, 18, 0, 2
ktrig     =         0
endin

instr 4; write the last three seconds
ktrig     init      1
          TbToSF    giAudio, "TbToSF2.wav", ktrig, 18, 2
ktrig     =         0
endin


</CsInstruments>
<CsScore>
i 1 0 5
i 2 5 .1
i 3 5.1 .1
i 4 5.2 .1
</CsScore>
</CsoundSynthesizer>

