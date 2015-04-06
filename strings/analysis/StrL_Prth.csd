/****************************************************************************
iPrPos StrL_Prth Str, iMin, iPos

Looks for the next corresponding opening parenthesis < iPos and >= iMin.

Str - input string
iPos - position (index) in Str. the UDO will look "left to" this position.
       the default is -1 which means the end of the input string.
iMin - minimum position (index) which is regarded for left search (default 0)
iPrPos - position (index) of next opening parenthesis (-1 if none)
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32


  opcode StrL_Prth, i, Soj
Str, imin, iPos xin
iPos = iPos == -1 ? strlen(Str) - 1 : iPos
iPrtPos = -1
iLevel = 0
until iPos < imin+1 do
  iPos -= 1
  iChar strchar Str, iPos
   ;if next sign is another closing parenthesis, increase level
  if iChar == 41 then
    iLevel += 1
   ;if opening parenthesis 
  elseif iChar == 40 then
     ;and level=0: return position
    if iLevel == 0 then
      iPrtPos = iPos
      igoto end
     ;otherwise decrease level
    else 
      iLevel -= 1
    endif
  endif
enduntil
end: xout iPrtPos
  endop


  instr 1
Str =   "1 + (2 - 3)"
printf_i "Str = '%s'\n", 1, Str
prints   "Indx = 0123456789\n"
printf_i "Position of '(' in Str = %d\n", 1, StrL_Prth(Str)
printf_i "Position for min=3 and pos=4 = %d\n", 1, StrL_Prth(Str, 3, 4)
printf_i "Position for min=3 and pos=5 = %d\n", 1, StrL_Prth(Str, 3, 5)
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
