/****************************************************************************
iTrue StrLNoth Str, iMin, iPos

Looks whether left of iPos >= iMin is nothing but spaces or tabs. Returns 1 
if true, 0 if false.

Str - input string
iPos - position (index) in Str. the UDO will look "left to" this position
iMin - minimum position (index) which is regarded for left search
iTrue - 1 = true, 0 = false
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32

  opcode StrLNoth, i, Sii
Str, imin, iPos xin
iTrue = 1
until iPos < imin+1 do
iPos -= 1
if strchar(Str, iPos) != 32 && strchar(Str, iPos) != 9 then
iTrue = 0
igoto end
endif
enduntil
end: xout iTrue  
  endop
  
  instr 1
Str =   "   there is nothing left to say ..."
printf_i "Str = '%s'\n", 1, Str
printf_i "Left of indx=3 nothing? True = %d\n", 1, StrLNoth(Str, 0, 3)
printf_i "Left of indx=9 nothing? True = %d\n", 1, StrLNoth(Str, 0, 9)
printf_i "Left of indx=9 with min=8 nothing? True = %d\n", 1, StrLNoth(Str, 8, 9)
  endin 
  
</CsInstruments>
<CsScore>
i 1 0 0
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
