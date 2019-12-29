/****************************************************************************
kOnset, kDb OnDtct aIn [,kDbDiff [,kMinTim [,kMinDb [,iRmsFreq [,iDelComp]]]]]
Detects onsets (attacks). Returns also the dB of the rms at this time.

Onset detection is done via the comparision of the current rms value with the
rms value kDelTim seconds before. If the current rms is lager than kDbDiff decibel
compared to the one kDelTim seconds before, an onset is detected. Further conditions
are that kMinTime has passed since the last detection, and the rms value for the 
onset is larger that kMinDb. The velocity of the rms measurement can be adjusted 
with the iRmsFreq parameter.
Note that the kDb output is "too early" for a good estimation of the onset's 
intensity. As the example below shows, it can be taken a short time later.
written by joachim heintz

aIn - audio input signal
kDbDiff - dB difference to signify an offset (default = 10)
kMinTim - minimum time in seconds between two onsets (default = 0.1)
kMinDb - minimum dB to detect an offset (default = -50)
kDelTim - time in seconds which is compared to the current rms (default = 0.025)
iRmsFreq - approximate frequency for rms measurements (default = 50)
kOnset - 1 if onset is detected, otherwise 0
kDb - dB value in the moment of onset detection. Note that this is not the 
      perceived intensity of the beat. Some 1/100 sec later seems to work
      for this - see the example below
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

opcode OnDtct, kk, aOOOOo

 aIn, kDbDiff, kMinTim, kMinDb, kDelTim, iRmsFreq xin
 
 //resolving defaults
 kDbDiff = (kDbDiff==0) ? 10 : kDbDiff
 kMinTim = (kMinTim==0) ? 0.1 : kMinTim
 kMinDb = (kMinDb==0) ? -50 : kMinDb
 kDelTim = (kDelTim==0) ? 0.025 : kDelTim
 iRmsFreq = (iRmsFreq==0) ? 50 : iRmsFreq
 
 kPrevDetect init 0.1
 iMaxDelTim init 0.5
 kOnset init 0

 kRms rms aIn,iRmsFreq
 kDb = dbamp(kRms)
 kDelRms vdelayk kDb, kDelTim, iMaxDelTim
 
 if (kDb>kDelRms+kDbDiff) && (kDb>kMinDb) && (kPrevDetect>kMinTim) then
  kOnset = 1
  kPrevDetect = 0
 else
  kOnset = 0
 endif

 kPrevDetect += 1/kr
 
 xout kOnset, kDb

endop


instr Detect

 //input sound and onset detection
 aSound diskin "../_sourcefiles/beats.wav"
 kOnset,kRms OnDtct aSound,6
 
 //trigger instrument on onset
 if kOnset == 1 then
  schedulek("Play",0,1/10)
 endif
 
 //show db value 1/100 sec later
 kOnsetDelay delayk kOnset, 1/100
 if kOnsetDelay == 1 then
  printk 0,kRms
 endif
 
 outch 1,aSound

endin

instr Play //render to file to see the result

 aPlay mpulse 1, p3+1
 outch 2, aPlay

endin

</CsInstruments>
<CsScore>
i "Detect" 0 3
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>901</x>
 <y>203</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>db</objectName>
  <x>73</x>
  <y>59</y>
  <width>80</width>
  <height>25</height>
  <uuid>{a69df852-5cfa-4e31-b116-3d4d9603f132}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>right</alignment>
  <font>Liberation Sans</font>
  <fontsize>20</fontsize>
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
  <resolution>1.00000000</resolution>
  <minimum>0</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>10</value>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>mintim</objectName>
  <x>176</x>
  <y>59</y>
  <width>80</width>
  <height>25</height>
  <uuid>{9a8c7797-4815-4b14-96a2-9573ed972b62}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>right</alignment>
  <font>Liberation Sans</font>
  <fontsize>20</fontsize>
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
  <resolution>0.01000000</resolution>
  <minimum>0</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>0.05</value>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>35</x>
  <y>87</y>
  <width>124</width>
  <height>78</height>
  <uuid>{66924582-e24e-4958-9f56-422eee3f8816}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>7-13 bei 0.1 sec
</label>
  <alignment>left</alignment>
  <font>Liberation Sans</font>
  <fontsize>16</fontsize>
  <precision>3</precision>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>165</x>
  <y>87</y>
  <width>154</width>
  <height>61</height>
  <uuid>{7fda4e13-54f8-4d2b-89ab-d806baa5d2e2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>0.03 - 0.18 bei 10db
</label>
  <alignment>left</alignment>
  <font>Liberation Sans</font>
  <fontsize>16</fontsize>
  <precision>3</precision>
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
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
