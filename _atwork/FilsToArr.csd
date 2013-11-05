/****************************************************************************
SfilArr[] FilsToArr Sfils, Sep
Transforms a collection of filenames into an array with the single filenames.

Transforms a collection of filenames which are seperated by any character or 
string, in an array containing the single filenames. Requires the UDO StrMems.
Requires Csound6.

Sfils - A string as a collection of filenames
Sep - Another string which serves as a seperator for the elements in Sfils
SfilArr[] - An array of the filenames
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
iSumEls += 1
Sub        strsub     Sub, iPos+1
iIndx      =          iPos+1
           else
iIndx      =          iLen
   endif
od
           xout       iSumEls
  endop

  opcode FilsToArr, S[], SS
Sfils, Sep xin
;look how many file names are in Sfils
iNumSeps   StrMems    Sfils, Sep
iNumFils   =          iNumSeps + 1
;create array of this length
SfilArr[]  init       iNumFils
;fill in the single file names
iIndx      =          0
Sub        strcpy     Sfils
  until iIndx == iNumFils do
iPos       strindex   Sub, Sep
SfilArr[iIndx] strsub Sub, 0, iPos
           puts       SfilArr[iIndx], iIndx+1
Sub        strsub     Sub, iPos+1
iIndx += 1
od
;return array
           xout       SfilArr
  endop

instr 1
Sfils      =          "/home/jh/Joachim/Stuecke/31Auhausen/Auffuehrung/5_FiliaSion/A.wav|/home/jh/Joachim/Stuecke/31Auhausen/Auffuehrung/5_FiliaSion/C.wav|/home/jh/Joachim/Stuecke/31Auhausen/Auffuehrung/5_FiliaSion/E.wav|/home/jh/Joachim/Stuecke/31Auhausen/Auffuehrung/5_FiliaSion/G.wav|/home/jh/Joachim/Stuecke/31Auhausen/Auffuehrung/5_FiliaSion/I.wav|/home/jh/Joachim/Stuecke/31Auhausen/Auffuehrung/5_FiliaSion/L.wav|/home/jh/Joachim/Stuecke/31Auhausen/Auffuehrung/5_FiliaSion/Vorspiel.wav"
Sep        =          "|"
SfilArr    FilsToArr  Sfils, Sep
           puts       SfilArr[0], 1
endin

</CsInstruments>
<CsScore>
i 1 0 1
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
