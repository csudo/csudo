/****************************************************************************
itest StrayNumMem Stray, inum [, isep1 [, isep2]]
Tests whether a number is a member of an array-string

Looks whether the number inum is a member of Stray. If yes, itest returns the position of inum in Stray, if no, -1. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
Requires the UDO StrNumP

Stray - a string as array
inum - the number which is being looked for
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n -m0
</CsOptions>
<CsInstruments>

  opcode StrNumP, i, S
;tests whether String is numerical string (simple, no scientific notation) which can be converted via strtod ito a float (1 = yes, 0 = no)
Str       xin	
ip        =         1; start at yes and falsify
ilen      strlen    Str
 if ilen == 0 then
ip        =         0
          igoto     end 
 endif 
ifirst    strchar   Str, 0
 if ifirst == 45 then; a "-" is just allowed as first character
Str       strsub    Str, 1, -1
ilen      =         ilen-1
 endif
indx      =         0
inpnts    =         0; how many points have there been
loop:
iascii    strchar   Str, indx; 48-57
 if iascii < 48 || iascii > 57 then; if not 0-9
  if iascii == 46 && inpnts == 0 then; if not the first point
inpnts    =         1
  else 
ip        =         0
  endif 
 endif	
          loop_lt   indx, 1, ilen, loop 
end:	     xout      ip
  endop 

  opcode StrayNumMem, i, Sijj
;looks whether inum is an element of Stray. returns the index of the element if found, and -1 if not.
Stray, inum, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iout      =         -1 ;default output
iel       =         -1; actual number of element while searching
iwarleer  =         1; is this the start of a new element
indx      =         0 ;character index
inewel    =         0 ;new element to find
;;LOOP
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Schar     strsub    Stray, indx, indx+1; this character
isep1p    strcmp    Schar, Sep1; returns 0 if Schar is sep1
isep2p    strcmp    Schar, Sep2; 0 if Schar is sep2
is_sep    =         (isep1p == 0 || isep2p == 0 ? 1 : 0) ;1 if Schar is a seperator
 ;END OF STRING AND NO SEPARATORS BEFORE?
 if indx == ilen && iwarleer == 0 then
Sel       strsub    Stray, istartsel, -1
inewel    =         1
 ;FIRST CHARACTER OF AN ELEMENT?
 elseif is_sep == 0 && iwarleer == 1 then
istartsel =         indx ;if so, set startindex
iwarleer  =         0 ;reset info about previous separator 
iel       =         iel+1 ;increment element count
 ;FIRST SEPERATOR AFTER AN ELEMENT?
 elseif iwarleer == 0 && is_sep == 1 then
Sel       strsub    Stray, istartsel, indx ;get element
inewel    =         1 ;tell about
iwarleer  =         1 ;reset info about previous separator
 endif
 ;CHECK THE ELEMENT
 if inewel == 1 then ;for each new element
inump     StrNumP   Sel ;check whether element is number
  if inump == 1 then
inumber   strtod    Sel ;if so, convert
   if inumber == inum then ;check if equals inum
iout      =         iel
          igoto     end ;if so, terminate
   endif
  endif
 endif
inewel    =         0
          loop_le   indx, 1, ilen, loop 
end:
          xout      iout
  endop 
  
instr 1
Stray     strget    p4
ipcnt     pcount
if ipcnt == 5 then
itest     StrayNumMem Stray, p5
Sep1      sprintf   "%c", 32
Sep2      sprintf   "%c", 9
elseif ipcnt == 6 then
itest     StrayNumMem Stray, p5, p6
Sep1      sprintf   "%c", p6
Sep2      sprintf   "%c", p6
elseif ipcnt == 7 then
itest     StrayNumMem Stray, p5, p6, p7
Sep1      sprintf   "%c", p6
Sep2      sprintf   "%c", p7
endif
		printf_i	"'%.3f' in '%s' with separators '%s' and '%s': result = %d\n", 1, p5, Stray, Sep1, Sep2, itest
endin 

</CsInstruments>
<CsScore>
i 1 0 0.01 "sdhgfa elh 4,876" 4 ;fails because comma is no separator
i . + . "sdhgfa elh 4,876" 4 44 ;fails because just comma is separator
i . + . "sdhgfa elh 4,876" 4 44 32 ;ok (at position 2)
i . + . "sdhgfa elh 4,876 5" 5 44 32 ;ok (at position 4)
i . + . "sdhgfa elh -4.321,876" -4.321 44 32 ;ok (at position 2)
e
</CsScore>
</CsoundSynthesizer>

returns:
'4.000' in 'sdhgfa elh 4,876' with separators ' ' and '	': result = -1
'4.000' in 'sdhgfa elh 4,876' with separators ',' and ',': result = -1
'4.000' in 'sdhgfa elh 4,876' with separators ',' and ' ': result = 2
'5.000' in 'sdhgfa elh 4,876 5' with separators ',' and ' ': result = 4
'-4.321' in 'sdhgfa elh -4.321,876' with separators ',' and ' ': result = 2