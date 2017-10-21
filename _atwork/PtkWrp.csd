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

<CsoundSynthesizer>
<CsOptions>
-o dac
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
0dbfs = 1
nchnls = 1

 ;read in fox.wav from the csound manual (http://www.csounds.com/manual/html/examples/fox.wav)
giSound    ftgen      0, 0, 0, -1, "../_samples/fox.wav", 0, 0, 1



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



  instr Freeze

kpnter     =          p4 ;position in seconds
apnter     upsamp     kpnter

aWrp       PtkWrp     apnter, giSound
aOut       linen      aWrp, 0, p3, .01
           out        aOut

  endin

  instr Stretch

kpnter     linseg     0, p3, 2.757
apnter     upsamp     kpnter

aWrp       PtkWrp     apnter, giSound
aOut       linen      aWrp, 0, p3, .01
           out        aOut

  endin

  instr Compress

kpnter     linseg     0, p3, 2.757
apnter     upsamp     kpnter

aWrp       PtkWrp     apnter, giSound
aOut       linen      aWrp, 0, p3, .01
           out        aOut

  endin
  
</CsInstruments>
<CsScore>
i "Freeze" 0 3 .5
i "Freeze" 4 3 2.5
i "Stretch" 8 20
i "Compress" 29 1
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>328</width>
 <height>220</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>pointer</objectName>
  <x>134</x>
  <y>90</y>
  <width>80</width>
  <height>25</height>
  <uuid>{4ab4d562-f557-4280-b37d-841660c7bcb5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>16</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.10000000</resolution>
  <minimum>0</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>0.5</value>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
