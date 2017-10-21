/****************************************************************************
Srem StrayRemDup Stray [, isep1 [, isep2]]
Removes duplicates in an array-string

Removes duplicates in Stray and returns the result. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
Requires the UDOs StrayLen and StrayGetEl
written by joachim heintz

Stray - a string as array
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
Srem - the resulting output string
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
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
icount    =         0; number of elements
iwarsep   =         1
indx      =         0
 if ilen == 0 igoto end ;don't go into the loop if String is empty
loop:
Snext     strsub    Stray, indx, indx+1; next sign
isep1p    strcmp    Snext, Sep1; returns 0 if Snext is sep1
isep2p    strcmp    Snext, Sep2; 0 if Snext is sep2
 if isep1p == 0 || isep2p == 0 then; if sep1 or sep2
iwarsep   =         1; tell the log so
 else 				; if not 
  if iwarsep == 1 then	; and has been sep1 or sep2 before
icount    =         icount + 1; increase counter
iwarsep   =         0; and tell you are ot sep1 nor sep2 
  endif 
 endif	
          loop_lt   indx, 1, ilen, loop 
end:      xout      icount
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
  
  opcode StrayRemDup, S, Sjj
;removes duplicates in Stray and returns the result. elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). if just one seperator is used, isep2 equals isep1.
;requires the UDOs StrayLen and StrayGetEl
Stray, isepA, isepB xin
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
ilen1     StrayLen  Stray, isep1, isep2
Sres      =         ""
if ilen1 == 0 igoto end1 
indx1     =         0
loop1:
Sel       StrayGetEl Stray, indx1, isep1, isep2; get element
ires      =         0
ilen      StrayLen  Sres, isep1, isep2; length of Sres
if ilen == 0 igoto end 
indx      =         0
loop:	;iterate over length of Sres
Snext     StrayGetEl Sres, indx, isep1, isep2
icomp     strcmp    Snext, Sel
 if icomp == 0 then
ires      =         1
          igoto     end 
 endif
          loop_lt   indx, 1, ilen, loop 
end:		
 if ires == 0 then ;if element is not already in Sres, append
Sdran     sprintf   "%s%s", Sep1, Sel
Sres      strcat    Sres, Sdran
 endif

          loop_lt	indx1, 1, ilen1, loop1 
end1:		
Sout      strsub    Sres, 1; remove starting sep1
          xout      Sout
  endop 

instr 1
Stray     strget    p4
ipcnt     pcount
if ipcnt == 4 then
Srem      StrayRemDup Stray
elseif ipcnt == 5 then
Srem      StrayRemDup Stray, p5
elseif ipcnt == 6 then
Srem      StrayRemDup Stray, p5, p6
endif		
		printf_i	"'%s'\n", 1, Srem
endin 

</CsInstruments>
<CsScore>
i 1 0 0.01 "1 a 2 a b 3 1"
i . + . "hu la hu la la 8 8 9"
i . + . "hu la hu	la	la 8 8 9"
i . + . "hu,la,hu,la	la 8 8 9" 44 ;removes 'hu' but not 'la' (comma is the only seperator)
i . + . "hu,la,hu,la	la 8 8 9" 44 32 ;same result because tab is not defined as seperator
i . + . "hu,la,hu,la	la 8 8 9" 44 9 ;removes second 'la' (but not 'la 8 8 9')
e
</CsScore>
</CsoundSynthesizer>

returns:
'1 a 2 b 3'
'hu la 8 9'
'hu la 8 9'
'hu,la,la	la 8 8 9'
'hu,la,la	la,8,9'
'hu,la,la 8 8 9'

