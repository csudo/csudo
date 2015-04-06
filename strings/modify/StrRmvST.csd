/****************************************************************************
Sout StrRmvST Sin, iStrt, iEnd
Removes all spaces or tabs from iStrt to iEnd (both included)

Removes all spaces or tabs in input string Sin from iStrt to iEnd and returns the result as Sout.

Sin - Input string which may contain starting spaces or tabs.
iStrt - First index (position) to consider in Sin (default = 0)
iEnd - Last indes to consider in Sin (default = -1 = end of string)
Sout - Output string with removed initial spaces/tabs.
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32

  opcode StrRmvST, S, Soj
Str, istrt, iend xin
iend = iend == -1 ? strlen(Str) - 1 : iend
Scpy = ""
until istrt == iend+1 do
 if strchar(Str, istrt) != 32 && strchar(Str, istrt) != 9 then
  Scpy strcat Scpy, strsub(Str, istrt, istrt+1)
 endif
 istrt += 1
enduntil
   xout Scpy
  endop


instr 1
Sin        strget     p4
           printf_i   "Sin = '%s'\n", 1, Sin
Sout       StrRmvST   Sin
           printf_i   "Sout = '%s'\n\n", 1, Sout
endin
</CsInstruments>
<CsScore>
i 1 0 .01 "  ab  c d "
i 1 + . "a b c"
i 1 + . "  a"
i 1 + . "  a   "
i 1 + . "  "
i 1 + . "	a"
i 1 + . " 	a   "
i 1 + . " 	 "
i 1 + . ""
</CsScore>
</CsoundSynthesizer>
returns:
Sin = '  ab  c d '
Sout = 'abcd'

Sin = 'a b c'
Sout = 'abc'

Sin = '  a'
Sout = 'a'

Sin = '  a   '
Sout = 'a'

Sin = '  '
Sout = ''

Sin = '	a'
Sout = 'a'

Sin = ' 	a   '
Sout = 'a'

Sin = ' 	 '
Sout = ''

Sin = ''
Sout = ''
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
