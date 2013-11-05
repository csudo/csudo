<CsoundSynthesizer>
<CsOptions>
-dnm0
</CsOptions>
<CsInstruments>

/****************************************************************************
iNotNum F2M iFreq [,iRound]
Converts a frequency to MIDI.Cent note number, with optional rounding to the next key.

Converts a frequency to MIDI.Cent note number, for instance 60.024759 for an input of 262 Hz. If the round option is turned on, the frequency is mapped to the nearest key, so that an integer is returned.

iFreq - Frequency to be converted
iRound - 0 = off (default), 1 = on
iNotNum - Midi note number (60 = middle c)
****************************************************************************/


  opcode F2M, i, io
iFq, iRnd xin
iNotNum = 12 * (log(iFq/220)/log(2)) + 57
iNotNum = (iRnd == 1 ? round(iNotNum) : iNotNum)
xout iNotNum
  endop


instr 1
inote1 F2M p4, 1
inote2 F2M p4
prints "Frequency = %f, F2M rounded = %d, F2M as midi.cent = %f\n", p4, inote1, inote2
endin

</CsInstruments>
<CsScore>
i 1 0 0 440
i . . . 430
i . . . 420
i . . . 410
i . . . 400
i . . . 220
i . . . 262
i . . . 261
</CsScore>
</CsoundSynthesizer>
returns:
Frequency = 261.000000, F2M rounded = 60, F2M as midi.cent = 59.958555
Frequency = 440.000000, F2M rounded = 69, F2M as midi.cent = 69.000000
Frequency = 420.000000, F2M rounded = 68, F2M as midi.cent = 68.194630
Frequency = 430.000000, F2M rounded = 69, F2M as midi.cent = 68.601998
Frequency = 220.000000, F2M rounded = 57, F2M as midi.cent = 57.000000
Frequency = 400.000000, F2M rounded = 67, F2M as midi.cent = 67.349958
Frequency = 410.000000, F2M rounded = 68, F2M as midi.cent = 67.777445
Frequency = 262.000000, F2M rounded = 60, F2M as midi.cent = 60.024759<bsbPanel>
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
