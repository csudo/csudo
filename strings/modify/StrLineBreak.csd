<CsoundSynthesizer>
<CsOptions>
-n -m0
</CsOptions>
<CsInstruments>
ksmps = 16

  opcode StrLineBreak, S, Si
;inserts line breaks after iNum characters in the input string
String, iNum xin
Sres    =        ""
loop:
ilen    strlen   String
 if ilen > iNum then
S1      strsub   String, 0, iNum
Sres    strcat   Sres, S1
Sres    strcat   Sres, "\n"
String  strsub   String, iNum
        igoto    loop
        else
Sres    strcat   Sres, String
 endif
        xout     Sres
  endop


  instr Test
String  =        "1234567890abcdefghij"
Sout    StrLineBreak String, p4
        puts     Sout, 1
        puts     "", 1
  endin

</CsInstruments>
<CsScore>
i "Test" 0 .1 5
i "Test" + .1 8
i "Test" + .1 20
</CsScore>
</CsoundSynthesizer>
returns:
12345
67890
abcde
fghij

12345678
90abcdef
ghij

1234567890abcdefghij
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>626</x>
 <y>249</y>
 <width>200</width>
 <height>140</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBSpinBox">
  <objectName>text</objectName>
  <x>71</x>
  <y>105</y>
  <width>80</width>
  <height>25</height>
  <uuid>{2f2d7907-216b-4f03-9b7e-1c473a03b907}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
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
  <resolution>0.00100000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>2.01</value>
 </bsbObject>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>text</objectName>
  <x>5</x>
  <y>5</y>
  <width>20</width>
  <height>100</height>
  <uuid>{7214d800-00ba-4b9a-b5c2-f1cdaf766ab7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
