/****************************************************************************
iSumEls StrMems Str, Sel
Returns the number of occurencies of a string in another string.

Returns the number of occurencies of a string in another string.

Str - Input string
Sel - Another string which is asked to be a member of Str
iSumEls - Number of occurencies of Sel in Str
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>


  opcode StrMems, i, SS
Str, Sel   xin
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


instr 1
Str        strget     p4
Sel        strget     p5
iEls       StrMems    Str, Sel
           printf_i   "Found %d occurencies of '%s' in '%s'\n", 1, iEls, Sel, Str
endin

</CsInstruments>
<CsScore>
i 1 0 .1 "a|b|c" "|"
i 1 + . "eldfjslhfbsjdsldhjbsljdhbvswjuevflksjhdbvcsahbf" "j"
i 1 + . "eldfjslhfbsjdsldhjbsljdhbvswjuevflksjhdbvcsahbf" "jh"
i 1 + . "ich habe hunger" " "
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
