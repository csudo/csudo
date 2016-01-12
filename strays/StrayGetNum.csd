/****************************************************************************
inum StrayGetNum Stray, ielindx [, isep1 [, isep2]]
knum StrayGetNum Stray, kelindx [, isep1 [, isep2]]
Gets one number from a string-array

Returns the element with the position ielindex (starting from 0) in Stray. This element must be a number (the other elements can be strings or charcters). By default, the seperators between the elements are spaces and tabs. Others seperators can be defined by their ASCII code number.
If ielindx is out of range, "nan" is returned.
If the element is not a number, "nan" is returned at k-rate, but an error occurs at i-rate.

Input:
Stray - a string as array
ielindx (kelindx) - the index of the element (starting with 0)
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab)
If the defaults are not used and just isep1 is given, it's the only seperator. If you want two seperators (as in the dafault), you must give isep1 and isep2
Output:
inum (knum) - the number which is at the ielindx position of Stray
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n -m0
</CsOptions>
<CsInstruments>
ksmps = 32

  opcode StrayGetNum, i, Sijj
;returns ielindex in Stray. this element must be a number
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
Snum      strsub    Stray, istartsel, iendsel
if strcmp(Snum,"") == 0 then
 Snum     =         "nan"
endif
inum      strtod    Snum
          xout      inum
  endop 
  
  opcode StrayGetNum, k, Skjj
;returns kelindex in Stray. this element must be a number
Str, kelindx, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
Stray     strcpyk   Str ;make sure to update in performance
klen      strlenk   Stray
kstartsel =         -1; startindex for searched element
kendsel   =         -1; endindex for searched element
kel       =         0; actual number of element while searching
kwarleer  =         1
kndx      =         0
 if klen == 0 kgoto end ;don't go into the loop if Stray is empty
loop:
Snext     strsubk   Stray, kndx, kndx+1; next sign
ksep1p    strcmpk   Snext, Sep1; returns 0 if Snext is sep1
ksep2p    strcmpk   Snext, Sep2; 0 if Snext is sep2
;;NEXT SIGN IS NOT SEP1 NOR SEP2
if ksep1p != 0 && ksep2p != 0 then
 if kwarleer == 1 then; first character after a seperator 
  if kel == kelindx then; if searched element index
kstartsel =         kndx; set it
kwarleer  =         0
  else 			;if not searched element index
kel       =         kel+1; increase it
kwarleer  =         0; log that it's not a seperator 
  endif 
 endif 
;;NEXT SIGN IS SEP1 OR SEP2
else 
 if kstartsel > -1 then; if this is first selector after searched element
kendsel   =         kndx; set iendsel
          kgoto     end ;break
 else	
kwarleer  =         1
 endif 
endif
          loop_lt   kndx, 1, klen, loop 
end: 		
Snum      strsubk   Stray, kstartsel, kendsel
Snum      init      "nan"
knum      strtodk   Snum
          xout      knum
  endop 
  
instr 1
          prints    " i-rate  k-rate\n"
endin

instr 2
Stray     strget    p4
ipcnt     pcount
if ipcnt == 5 then
inum      StrayGetNum Stray, p5
knum      StrayGetNum Stray, p5
elseif ipcnt == 6 then
inum      StrayGetNum Stray, p5, p6
knum      StrayGetNum Stray, p5, p6
else	
inum      StrayGetNum Stray, p5, p6, p7
knum      StrayGetNum Stray, p5, p6, p7
endif
          printf_i  "%6.2f  ", 1, inum
          printf  "%6.2f\n", 1, knum
          turnoff
endin 

</CsInstruments>
<CsScore>
i 1 0 0
i 2 0 0.01 "The 	ASCII code of a comma (,) is 44" 8
i . + . "44,can,not,be,called,a,number." 0 44
i . + . "44,33.22,11" 1 44
i . + . "44,33.22,11" 2 44
i . + . "44,33.22,11" 1 44 46
i . + . "44,33.22,11" 2 44 46
i . + . "1 2 3" 0 ! ;('!' = clear previous p-fields)
i . + . "1 2 3" 1
i . + . "1 2 3" 2
i . + . "	1 2 	3	" 2
i . + . "1 2 3" 3; nan
i . + . "1,2,3" 0 44
i . + . "1,2,3" 1 .
i . + . "1,2,3" 2 .
i . + . "1,2,3" 3 . ;nan
i . + . "1,2,a" 2 . ;error at i-rate
i . + . "1.234;56.789" 1 59
e
</CsScore>
</CsoundSynthesizer>

returns:
 i-rate  k-rate
 44.00   44.00
 44.00   44.00
 33.22   33.22
 11.00   11.00
 33.00   33.00
 22.00   22.00
  1.00    1.00
  2.00    2.00
  3.00    3.00
  3.00    3.00
   nan     nan
  1.00    1.00
  2.00    2.00
  3.00    3.00
   nan     nan
INIT ERROR in instr 2 (opcode StrayGetNum): strtod: invalid format
inum	strtod	Snum	
   nan  	  B  0.150 - note deleted.  i2 had 1 init errors
 56.79   56.79

