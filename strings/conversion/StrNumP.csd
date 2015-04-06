/****************************************************************************
itest StrNumP String
Tests whether a string is a numerical string

Tests whether a string is a numerical string ("1" or "1.23435" but not "1a"). Returns 1 for "yes" and 0 for "no". If "yes", the string can be converted to a number by the opcode strtod.

String - any string
itest - 1 if String is a numerical string, 0 if not
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32

  opcode StrNumP, i, S
Str        xin
ip         =          1; start at yes and falsify
ilen       strlen     Str
 if ilen == 0 then
ip         =          0
           igoto      end
 endif
ifirst     strchar    Str, 0
 if ifirst == 45 then; a "-" is just allowed as first character
Str        strsub     Str, 1, -1
ilen       =          ilen-1
 endif
indx       =          0
inpnts     =          0; how many points have there been
loop:
iascii     strchar    Str, indx; 48-57
 if iascii < 48 || iascii > 57 then; if not 0-9
  if iascii == 46 && inpnts == 0 then; if not the first point
inpnts     =          1
           else
ip         =          0
  endif
 endif
           loop_lt    indx, 1, ilen, loop
end:       xout       ip
  endop

instr 1
String     strget     p4
ires       StrNumP    String
           printf_i   "'%s' -> %d\n", 1, String, ires
endin

</CsInstruments>
<CsScore>
i 1 0 0.01 "1234567890."
i . + . "1234567890. "
i . + . "12345.67890"
i . + . ".1234567890"
i . + . "1234567890.."
i . + . "123.4567890."
i . + . "1a"
i . + . "<0"
i . + . ""
i . + . "-"
i . + . "-1"
i . + . "-1.2345"
i . + . "-.1"
e
</CsScore>
</CsoundSynthesizer>

returns:
'1234567890.' -> 1
'1234567890. ' -> 0
'12345.67890' -> 1
'.1234567890' -> 1
'1234567890..' -> 0
'123.4567890.' -> 0
'1a' -> 0
'<0' -> 0
'' -> 0
'-' -> 0
'-1' -> 1
'-1.2345' -> 1
'-.1' -> 1
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
