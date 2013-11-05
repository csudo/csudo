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


<CsoundSynthesizer>
<CsOptions>
-odac -d
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

gSnd       =         "../_sourcefiles/fox.wav"
giftsnd    ftgen     0, 0, 0, 1, gSnd, 0, 0, 1
           seed      0

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

  
  instr 1 ;simple test instrument
kloopstart =          p4
kloopend   =          p5
kspeed     =          p6
kdir       =          p7
isndlen    filelen    gSnd
atimpt     LpPhsr     kloopstart, kloopend, kspeed, kdir, isndlen
asnd       mincer     atimpt, 1, 1, giftsnd, 1
           out        asnd
  endin

  instr 2 ;random choices
kloopstart randomi     0, 1, .5
kloopend   randomi     1, 2.5, .5
kspeed     randomi     0.5, 1.5, .5
kback      randomh     -1, 1, .3
kdir       =           (kback < 0 ? -1 : 1)

isndlen    filelen      gSnd
atimpt     LpPhsr       kloopstart, kloopend, kspeed, kdir, isndlen
asnd       mincer       atimpt, 1, 1, giftsnd, 1
           out          asnd
  endin


</CsInstruments>
<CsScore>
;          lstrt lend speed backw
i 1 0 4.5  .5    1.5  1     1
i 1 5 4.5  .5    1.5  1    -1
i 1 10 4.5 .5    1.5  .5    1
i 2 15 30
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
