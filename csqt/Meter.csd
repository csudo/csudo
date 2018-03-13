/****************************************************************************
Meter S_chan_sig, S_chan_over, aSig, kTrig
Shows an audio signal in a CsoundQt controller widget

Shows an audio signal in a CsoundQt controller widget. For efficiency, chnset is used instead outvalue.
Because of this, the software channel names must be declared outside this UDO via chn_k to work properly.
written by joachim heintz

S_chan_sig - channel name for the controller widget showing the signal
S_chan_over - channel name for the controller widget showing the out of range signal
aSig - audio signal to show
kTrig - trigger signal for refreshing the display
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

opcode Meter, 0, SSak
 S_chan_sig, S_chan_over, aSig, kTrig	xin
 iDbRange = 60 ;shows 60 dB
 iHoldTim = 1 ;seconds to "hold the red light"
 kOn init 0
 kTim init 0
 kStart init 0
 kEnd init 0
 kMax max_k aSig, kTrig, 1
 if kTrig == 1 then
  chnset (iDbRange + dbfsamp(kMax)) / iDbRange, S_chan_sig
  if kOn == 0 && kMax > 1 then
   kTim = 0
   kEnd = iHoldTim
   chnset k(1), S_chan_over
   kOn = 1
  endif
  if kOn == 1 && kTim > kEnd then
   chnset k(0), S_chan_over
   kOn =	0
  endif
 endif
 kTim += ksmps/sr
endop

;declare software channels
chn_k "outL", 2
chn_k "outL_over", 2
chn_k "outR", 2
chn_k "outR_over", 2

instr Caution_LOUD
 iDb = p4
 aOut poscil ampdb(iDb), 100
 out aOut, aOut
endin 

instr GUI
 aL, aR monitor
 kTrigDisp metro 10
 Meter "outL", "outL_over", aL, kTrigDisp
 Meter "outR", "outR_over", aR, kTrigDisp
endin

</CsInstruments>
<CsScore>
i "GUI" 0 15
i "Caution_LOUD" 1  1 -40
i "Caution_LOUD" 4  1 -20
i "Caution_LOUD" 7  1   0
i "Caution_LOUD" 10 1   1
i "Caution_LOUD" 13 1 -10
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>484</x>
 <y>234</y>
 <width>361</width>
 <height>140</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
 <bsbObject type="BSBController" version="2">
  <objectName>outL</objectName>
  <x>53</x>
  <y>25</y>
  <width>250</width>
  <height>19</height>
  <uuid>{f8582227-bbb6-431f-a433-33ed267d1d67}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>outL</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>-inf</xValue>
  <yValue>-inf</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>outL_over</objectName>
  <x>302</x>
  <y>25</y>
  <width>21</width>
  <height>19</height>
  <uuid>{3d46619f-a663-483c-b62e-04fd2a51d003}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>outL_over</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>196</r>
   <g>14</g>
   <b>12</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>28</x>
  <y>22</y>
  <width>25</width>
  <height>25</height>
  <uuid>{8f3b016b-d0da-4a87-949d-713e40d8d2e7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>L</label>
  <alignment>right</alignment>
  <font>sans</font>
  <fontsize>14</fontsize>
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
 <bsbObject type="BSBController" version="2">
  <objectName>outR</objectName>
  <x>53</x>
  <y>48</y>
  <width>250</width>
  <height>19</height>
  <uuid>{72b6f484-dfcb-47bd-aced-40b0037ac7f0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>outR</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>-inf</xValue>
  <yValue>-inf</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>outR_over</objectName>
  <x>302</x>
  <y>48</y>
  <width>21</width>
  <height>19</height>
  <uuid>{64a83951-7432-4429-8eea-8a46e90d1564}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>outR_over</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>196</r>
   <g>14</g>
   <b>12</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>28</x>
  <y>45</y>
  <width>25</width>
  <height>25</height>
  <uuid>{f849e38f-66d5-4de1-8ca3-113a765b150d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>R</label>
  <alignment>right</alignment>
  <font>sans</font>
  <fontsize>14</fontsize>
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
