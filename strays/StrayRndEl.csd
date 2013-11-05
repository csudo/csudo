/****************************************************************************
Sel StrayRndEl Stray [, isep1 [, isep2]]
Gets a random element from a string-array.

Returns a random element from a string-array.
Requires Csound 5.15 or higher and the UDOs StrayLen and StrayGetEl.

Input:
Stray - a string as array
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab)
If the defaults are not used and just isep1 is given, it's the only seperator. If you want two seperators (as in the dafault), you must give isep1 and isep2
Output:
Sel - the random element as a string
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n -m0
</CsOptions>
<CsInstruments>

  opcode StrayLen, i, Sjj
;returns the number of elements in Stray. elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). if just one seperator is used, isep2 equals isep1
Stray, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1      =          (isepA == -1 ? 32 : isepA)
isep2      =          (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1       sprintf    "%c", isep1
Sep2       sprintf    "%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen       strlen     Stray
icount     =          0; number of elements
iwarsep    =          1
indx       =          0
 if ilen == 0 igoto end ;don't go into the loop if String is empty
loop:
Snext      strsub     Stray, indx, indx+1; next sign
isep1p     strcmp     Snext, Sep1; returns 0 if Snext is sep1
isep2p     strcmp     Snext, Sep2; 0 if Snext is sep2
 if isep1p == 0 || isep2p == 0 then; if sep1 or sep2
iwarsep    =          1; tell the log so
           else       ; if not
  if iwarsep == 1 then	; and has been sep1 or sep2 before
icount     =          icount + 1; increase counter
iwarsep    =          0; and tell you are ot sep1 nor sep2
  endif
 endif
           loop_lt    indx, 1, ilen, loop
end:       xout       icount
  endop

  opcode StrayGetEl, S, Sijj
;returns the element at position ielindx in Stray, or an empty string if the element has not been found
Stray, ielindx, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1      =          (isepA == -1 ? 32 : isepA)
isep2      =          (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1       sprintf    "%c", isep1
Sep2       sprintf    "%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen       strlen     Stray
istartsel  =          -1; startindex for searched element
iendsel    =          -1; endindex for searched element
iel        =          0; actual number of element while searching
iwarleer   =          1
indx       =          0
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Snext      strsub     Stray, indx, indx+1; next sign
isep1p     strcmp     Snext, Sep1; returns 0 if Snext is sep1
isep2p     strcmp     Snext, Sep2; 0 if Snext is sep2
;;NEXT SIGN IS NOT SEP1 NOR SEP2
if isep1p != 0 && isep2p != 0 then
 if iwarleer == 1 then; first character after a seperator
  if iel == ielindx then; if searched element index
istartsel  =          indx; set it
iwarleer   =          0
           else       ;if not searched element index
iel        =          iel+1; increase it
iwarleer   =          0; log that it's not a seperator
  endif
 endif
;;NEXT SIGN IS SEP1 OR SEP2
           else
 if istartsel > -1 then; if this is first selector after searched element
iendsel    =          indx; set iendsel
           igoto      end ;break
           else
iwarleer   =          1
 endif
endif
           loop_lt    indx, 1, ilen, loop
end:
Sout       strsub     Stray, istartsel, iendsel
           xout       Sout
  endop

  opcode StrayRndEl, S, Sjj
Stray, isepA, isepB xin
iLen       StrayLen   Stray, isepA, isepB
iElIndx    rnd31      iLen, 0
Sel        StrayGetEl Stray, abs(int(iElIndx)), isepA, isepB
           xout       Sel
  endop

instr 1
Sdst       strget     p4
ipcnt      pcount
if ipcnt == 4 then
Sel        StrayRndEl Sdst
           else
Sel        StrayRndEl Sdst, p5
endif
           printf_i   "'%s'\n", 1, Sel
endin


</CsInstruments>
<CsScore>
i 1 0 .01 "Audio_01.wav Audio_02.wav Audio_03.wav Audio_04.wav" ;space is seperator
i 1 + . "Audio_01.wav Audio_02.wav Audio_03.wav Audio_04.wav"
i 1 + . "Audio_01.wav Audio_02.wav Audio_03.wav Audio_04.wav"
i 1 + . "Audio_01.wav Audio_02.wav Audio_03.wav Audio_04.wav"
i 1 + . "Audio_01.wav Audio_02.wav Audio_03.wav Audio_04.wav"
i 1 + . "Audio 01.wav|Audio 02.wav|Audio 03.wav|Audio 04.wav" 124 ;'|' is seperator
i 1 + . "Audio 01.wav|Audio 02.wav|Audio 03.wav|Audio 04.wav" 124 ;'|' is seperator
i 1 + . "Audio 01.wav|Audio 02.wav|Audio 03.wav|Audio 04.wav" 124 ;'|' is seperator
i 1 + . "Audio 01.wav|Audio 02.wav|Audio 03.wav|Audio 04.wav" 124 ;'|' is seperator
i 1 + . "Audio 01.wav|Audio 02.wav|Audio 03.wav|Audio 04.wav" 124 ;'|' is seperator
</CsScore>
</CsoundSynthesizer>

returns (for instance):
'Audio_02.wav'
'Audio_03.wav'
'Audio_01.wav'
'Audio_02.wav'
'Audio_02.wav'
'Audio 04.wav'
'Audio 01.wav'
'Audio 04.wav'
'Audio 01.wav'
'Audio 02.wav'
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
