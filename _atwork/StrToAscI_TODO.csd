<CsoundSynthesizer>
<CsOptions>
-ndm0
</CsOptions>
<CsInstruments>

/****************************************************************************
iArr[] StrToAscI Sin
Returns the ASCII numbers of the input string as i-array.

Returns the ASCII numbers of the input string as i-array. Requires Csound 6.


Sin - Input string with any sequence of characters or numbers.
iArr[] - Array containing the ASCII numbers of all characters.
****************************************************************************/

  opcode StrToAscI, i[], S
Sin        xin
ilen       strlen     Sin
iArr[]     init       ilen
ipos       =          0
loop:
ichr       strchar    Sin, ipos
iArr[ipos] =          ichr
           loop_lt    ipos, 1, ilen, loop
           xout       iArr[]
  endop
  

  instr Test
iCsound[] StrToAscI "csound"
iAscii[] StrToAscI {{!"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~}}
;printf_i "\n'csound'\n->  '%s'\n", 1, S_csound
;printf_i {{\n'!"#$%%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~'\n->  '%s'\n\n}}, 1, S_ascii
  endin

</CsInstruments>
<CsScore>
i "Test" 0 0
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
