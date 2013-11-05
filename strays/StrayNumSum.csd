/****************************************************************************
isum StrayNumSum Stray [, isep1 [, isep2]]]
Adds the elements in a numerical array-string

Adds all numbers in Stray (which must not contain non-numerical elements). Simple math expressions like +, -, *, /, ^ and % are allowed (no parentheses at the moment). Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
Requires the UDOs StrayLen and StrayGetEl.

Stray - a string as array
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
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
isep1		=		(isepA == -1 ? 32 : isepA)
isep2		=		(isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1		sprintf	"%c", isep1
Sep2		sprintf	"%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen		strlen		Stray
icount		=		0; number of elements
iwarsep	=		1
indx		=		0
 if ilen == 0 igoto end ;don't go into the loop if String is empty
loop:
Snext		strsub		Stray, indx, indx+1; next sign
isep1p		strcmp		Snext, Sep1; returns 0 if Snext is sep1
isep2p		strcmp		Snext, Sep2; 0 if Snext is sep2
 if isep1p == 0 || isep2p == 0 then; if sep1 or sep2
iwarsep	=		1; tell the log so
 else 				; if not 
  if iwarsep == 1 then	; and has been sep1 or sep2 before
icount		=		icount + 1; increase counter
iwarsep	=		0; and tell you are ot sep1 nor sep2 
  endif 
 endif	
		loop_lt	indx, 1, ilen, loop 
end: 		xout		icount
  endop 

  opcode StrayGetEl, S, Sijj
;returns the element at position ielindx in Stray, or an empty string if the element has not been found
Stray, ielindx, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iendsel   =         -1; endindex for searched element
iel       =         0; actual number of element while searching
iwarleer  =         1
indx      =         0
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Snext     strsub    Stray, indx, indx+1; next sign
isep1p    strcmp    Snext, Sep1; returns 0 if Snext is sep1
isep2p    strcmp    Snext, Sep2; 0 if Snext is sep2
;;NEXT SIGN IS NOT SEP1 NOR SEP2
if isep1p != 0 && isep2p != 0 then
 if iwarleer == 1 then; first character after a seperator 
  if iel == ielindx then; if searched element index
istartsel =         indx; set it
iwarleer  =         0
  else 			;if not searched element index
iel       =         iel+1; increase it
iwarleer  =         0; log that it's not a seperator 
  endif 
 endif 
;;NEXT SIGN IS SEP1 OR SEP2
else 
 if istartsel > -1 then; if this is first selector after searched element
iendsel   =         indx; set iendsel
          igoto     end ;break
 else	
iwarleer  =         1
 endif 
endif
          loop_lt   indx, 1, ilen, loop 
end:
Sout      strsub    Stray, istartsel, iendsel
          xout      Sout
  endop 

  opcode StrayNumSum, i, Sjj
  ;requires the UDOs StrayLen and StrayGetEl
Stray, isepA, isepB xin
isep1      =          (isepA == -1 ? 32 : isepA)
isep2      =          (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1       sprintf    "%c", isep1
Sep2       sprintf    "%c", isep2
isumtot    =          0
ilen       StrayLen   Stray, isep1, isep2
if ilen == 0 igoto end
indx       =          0
loop:
Snum       StrayGetEl Stray, indx, isep1, isep2
;test if Snum is an math expression
isum       strindex   Snum, "+"; sum
idif       strindex   Snum, "-"; difference
ipro       strindex   Snum, "*"; product
irat       strindex   Snum, "/"; ratio
ipow       strindex   Snum, "^"; power
imod       strindex   Snum, "%"; modulo
 if ipow > -1 then
ifirst     strindex   Snum, "^"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
iratio     strindex   S2, "/"
ifirst     strtod     S1
  if iratio == -1 then
isec       strtod     S2
           else
Snumer     strsub     S2, 0, iratio
Sdenom     strsub     S2, iratio+1
inumer     strtod     Snumer
idenom     strtod     Sdenom
isec       =          inumer / idenom
  endif
inum       =          ifirst ^ isec
 elseif imod > -1 then
ifirst     strindex   Snum, "%"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst % isec
 elseif ipro > -1 then
ifirst     strindex   Snum, "*"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst * isec
 elseif irat > -1 then
ifirst     strindex   Snum, "/"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst / isec
 elseif isum > -1 then
ifirst     strindex   Snum, "+"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst + isec
 elseif idif > -1 then
ifirst     strrindex  Snum, "-";(last occurrence: -3-4 is possible, but not 3--4)
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst - isec
           else
inum       strtod     Snum
 endif
isumtot    =          isumtot + inum
           loop_lt    indx, 1, ilen, loop
end:       xout       isumtot
  endop


instr 1
Stray      strget     p4
ipcnt      pcount
if ipcnt == 4 then
isum       StrayNumSum Stray
elseif ipcnt == 5 then
isum       StrayNumSum Stray, p5
elseif ipcnt == 6 then
isum       StrayNumSum Stray, p5, p6
endif
           prints     "isum = %f%n", isum
endin

</CsInstruments>
<CsScore>
i 1 0 0 "1 2 3 4 5 6 7"
i . 0 0 "1.2  	2+3.45  6.7/-8.09 "
i . 0 0 "  	15%12  -5-3   "
i . 0 0 "	 2^0.6	 2^1/12 2^-1/12  	16 32"
i . 0 0 "123*-4.56	 "
i . 0 0 "	 "
i . 0 0 ""
i . 0 0 "1+2.7 2^1/12 3.10*65 27%6"
i . 0 0 "1+2.7,2^1/12,3.10*65,27%6" 44
i . 0 0 "1+2.7,2^1/12|3.10*65,27%6" 44 124
e
</CsScore>
</CsoundSynthesizer>

returns:
isum = 209.259463
isum = 28.000000
isum = -5.000000
isum = 5.821817
isum = 0.000000
isum = 209.259463
isum = -560.880000
isum = 51.519054
isum = 209.259463
isum = 0.000000
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
