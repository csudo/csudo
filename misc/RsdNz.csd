/****************************************************************************
aNoise RsdNz iBandDbs[][,indx]
aL,aR RsdNz iBandDbs[][,indx]
Generates residuals noise in the 24 bands of the Bark scale.

This UDO follows the ATSreadnz opcode in Csound, and in particular the
examples from Oscar Pablo di Liscia in the Csound FLOSS Manual.
A random movement with maximum +- 6 dB is applied to the values in the 
iBandDbs array, to achieve a more lively and moving sound.
The gauss opcode sounds better than white or pink noise, I think, but
is quite cpu expensive. In case cpu optimization is needed, you may use
aNoise = reson(rand:a(ampdb(kDb),2,1),iCf,iCf/50,1) instead.
written by joachim heintz

iBandDbs[] - array with 24 dB values for the Bark center frequencies
index - defaults to 0 for the recursion
aNoise - sum of the noise bands
aL,aR - stereo version with random panning distribution of the single bands
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-m128 
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1
seed 0

opcode RsdNz,a,i[]o
  iBandDbs[],indx xin
  // center frequencies of 24 critical bands (bark scale)
  iCfs[] = fillarray(50,150,250,350,450,570,700,840,1000,1170,1370,1600,1850,
                     2150,2500,2900,3400,4000,4800,5800,7000,8500,10500,13500)
  // resynthesize noise bands with +-3dB movement
  iCf = iCfs[indx]
  iDb = iBandDbs[indx]
  kDb = randomi:k(iDb-6,iDb+6,2,3)
  ;aNoise = reson(rand:a(ampdb(kDb),2,1),iCf,iCf/50,1)
  aNoise = reson(gauss:a(ampdb(kDb)),iCf,iCf/20,1)
  if (indx+1 < lenarray(iCfs)) then
    aNoise += RsdNz(iBandDbs,indx+1)
  endif 
  xout(aNoise)
endop

opcode RsdNz,aa,i[]o
  iBandDbs[],indx xin
  // center frequencies of 24 critical bands (bark scale)
  iCfs[] = fillarray(50,150,250,350,450,570,700,840,1000,1170,1370,1600,1850,
                     2150,2500,2900,3400,4000,4800,5800,7000,8500,10500,13500)
  // resynthesize noise bands with +-3dB movement
  iCf = iCfs[indx]
  iDb = iBandDbs[indx]
  kDb = randomi:k(iDb-6,iDb+6,2,3)
  aNoise = reson(gauss:a(ampdb(kDb)),iCf,iCf/20,1)
  aL,aR pan2 aNoise,random:i(0,1)
  if (indx+1 < lenarray(iCfs)) then
    aL1,aR1 RsdNz iBandDbs,indx+1
    aL += aL1
    aR += aR1
  endif 
  xout(aL,aR)
endop

giCfs[] = fillarray(50,150,250,350,450,570,700,840,1000,1170,1370,1600,1850,
                     2150,2500,2900,3400,4000,4800,5800,7000,8500,10500,13500)
gSfile = "../_sourcefiles/BratscheMono.ats"


// compare between a real sample ...
instr BowNoiseATS

  iBand = p4
  p3 = ATSinfo(gSfile,7)
  kTime = linseg:k(0,p3,p3)
  kEnergy	= ATSreadnz(kTime,gSfile,iBand)
  iCenterFreq = giCfs[iBand-1]
  
  aNoise = gauss:a(1)
  aOut = reson(aNoise*sqrt(kEnergy),iCenterFreq,iCenterFreq/20,1)
  outall(aOut)
    
  if (iBand < 24) then
    schedule(1,0,1,iBand+1)
  endif

endin

// ... and the synthesized model
instr BowNoiseSynth

  iDbs[] = fillarray(-8,-20,-13,-15,-8,-12,-14,-20,-20,-22,-19,-15,-16,-18,-15,
                     -20,-20,-21,-22,-21,-21,-23,-27,-30)
  aNoise = RsdNz(iDbs)
  outall(aNoise)

endin

// stereo variant
instr BowNoiseSynthStereo

  iDbs[] = fillarray(-8,-20,-13,-15,-8,-12,-14,-20,-20,-22,-19,-15,-16,-18,-15,
                     -20,-20,-21,-22,-21,-21,-23,-27,-30)
  aL,aR RsdNz iDbs
  out(aL,aR)

endin


</CsInstruments>
<CsScore>
i 1 0 7 1
i 2 7 6
i 3 14 6
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
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
