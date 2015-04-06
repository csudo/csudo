/****************************************************************************
iTrue StrIsEmpty Str, iStrt, iEnd
Returns 1 if the positions >= istrt and <= iend are nothing but spaces or tabs.

Str - input string
iStrt - first index (position) to be considered in Str (default = 0)
iEnd - last index to be considered in Str (defualt = -1 = end of string)
iTrue - 1 if true (Str >= istrt and <= iend has only spaces or tabs), 0 else
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32

  opcode StrIsEmpty, i, Soj
Str, istrt, iend xin
iend = iend == -1 ? strlen(Str) - 1 : iend
iTrue = 1
until iTrue == 0 || istrt > iend do
 if strchar(Str, istrt) != 32 && strchar(Str, istrt) != 9 then
  iTrue = 0
 endif
istrt += 1
enduntil
xout iTrue
  endop
  
  instr 1
Str strget p4
iTrue StrIsEmpty Str
printf_i "Str = '%s' -> iTrue = %d\n", 1, Str, iTrue
  endin 
  
  instr 2
Str strget p4
iTrue StrIsEmpty Str, p5, p6
printf_i "Str = '%s', iStrt = %d, iEnd = %d -> iTrue = %d\n", 1, Str, p5, p6, iTrue
  endin 
</CsInstruments>
<CsScore>
i 1 0 .01 "  "
i . + .   ""
i . + .   "  my lovely 	 string "
i 2 .1 .01 "  my lovely 	 string " 0 -1
i . + . "  my lovely 	 string " 0 1
i . + . "  my lovely 	 string " 0 2
i . + . "  my lovely 	 string " 11 13
i . + . "  my lovely 	 string " 11 14
i . + . "  my lovely 	 string " 19 20
i . + . "  my lovely 	 string " 20 21
i . + . "  my lovely 	 string " 20 -1
</CsScore>
</CsoundSynthesizer>
Returns:
Str = '  ' -> iTrue = 1
Str = '' -> iTrue = 1
Str = '  my lovely 	 string ' -> iTrue = 0
Str = '  my lovely 	 string ', iStrt = 0, iEnd = -1 -> iTrue = 0
Str = '  my lovely 	 string ', iStrt = 0, iEnd = 1 -> iTrue = 1
Str = '  my lovely 	 string ', iStrt = 0, iEnd = 2 -> iTrue = 0
Str = '  my lovely 	 string ', iStrt = 11, iEnd = 13 -> iTrue = 1
Str = '  my lovely 	 string ', iStrt = 11, iEnd = 14 -> iTrue = 0
Str = '  my lovely 	 string ', iStrt = 19, iEnd = 20 -> iTrue = 0
Str = '  my lovely 	 string ', iStrt = 20, iEnd = 21 -> iTrue = 0
Str = '  my lovely 	 string ', iStrt = 20, iEnd = -1 -> iTrue = 1
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
