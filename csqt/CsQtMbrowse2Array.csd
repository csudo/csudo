/****************************************************************************
Sout[] CsQtMbrowse2Array Str
Converts a _MBrowse string of CsoundQt to an array of strings.

Converts a string in which file names are separated by '|' to 
an array of strings.
written by joachim heintz

Str - Input string as output of the _MBrowse channel in CsoundQt
Sout[] - Array with the file names
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>

0dbfs = 1

  opcode StrMems, i, SS
Str, Sel   xin //returns number of Sel in Str
iSumEls    =          0
iLen       strlen     Str
iIndx      =          0
Sub        strcpy     Str
  until iIndx == iLen do
iPos       strindex   Sub, Sel
   if iPos > -1 then
iSumEls    =          iSumEls+1
Sub        strsub     Sub, iPos+1
iIndx      =          iPos+1
   else
iIndx      =          iLen
   endif
  od
           xout       iSumEls
  endop

opcode CsQtMbrowse2Array,S[],S
  String xin
  // how many occurrences of | in String
  iNum = StrMems(String,"|")
  // create array for substrings
  Sout[] init iNum+1
  // go through
  istart = 0
  ipos = 0
  indx = 0
  while (ipos >= 0) do
    Substring = strsub(String,istart)
    ipos = strindex(Substring,"|")
    Sname = strsub(Substring,0,ipos)
    Sout[indx] = Sname
    istart += ipos+1
    indx += 1
  od
  xout Sout
endop

instr 1
  String = "file_1.wav|file_2a.wav|file_3.aiff|file_blahh.wav"
  Sres[] = CsQtMbrowse2Array(String)
  printarray(Sres)
  turnoff
endin

</CsInstruments>
<CsScore>
i 1 0 .1
</CsScore>
</CsoundSynthesizer>










<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>540</x>
 <y>248</y>
 <width>474</width>
 <height>140</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
 <bsbObject type="BSBButton" version="2">
  <objectName>_Play</objectName>
  <x>33</x>
  <y>18</y>
  <width>202</width>
  <height>39</height>
  <uuid>{f29385c0-ccc3-42a0-a0a0-ec9f708e63a4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue>1</stringvalue>
  <text>Play / Real Time</text>
  <image>/</image>
  <eventLine/>
  <latch>false</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>16</fontsize>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>_Render</objectName>
  <x>248</x>
  <y>18</y>
  <width>194</width>
  <height>42</height>
  <uuid>{24796cb7-0ffe-49bf-8f77-277e8ea029d2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue>1</stringvalue>
  <text>Render / Offline</text>
  <image>/</image>
  <eventLine/>
  <latch>false</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>16</fontsize>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
