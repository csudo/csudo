/****************************************************************************
inum StrayGetNum Stray, ielindx [, isep1 [, isep2]]
Gets one number from a string-array

Returns the element with the position ielindex (starting from 0) in Stray. This element must be a number (the other elements can be strings or charcters). By default, the seperators between the elements are spaces and tabs. Others seperators can be defined by their ASCII code number.
If ielindx is out of range, or if the element is not a number, an error occurs

Input:
Stray - a string as array
ielindx - the index of the element (starting with 0)
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab)
If the defaults are not used and just isep1 is given, it's the only seperator. If you want two seperators (as in the dafault), you must give isep1 and isep2
Output:
inum - the number which is at the ielindx position of Stray
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n -m0
</CsOptions>
<CsInstruments>

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
inum      strtod    Snum
          xout      inum
  endop 

instr 1
Stray     strget    p4
ipcnt     pcount
if ipcnt == 5 then
inum      StrayGetNum Stray, p5
elseif ipcnt == 6 then
inum      StrayGetNum Stray, p5, p6
else	
inum      StrayGetNum Stray, p5, p6, p7
endif
          printf_i  "'%f'\n", 1, inum
endin 



</CsInstruments>
<CsScore>
i 1 0 0.01 "The 	ASCII code of a comma (,) is 44" 8
i . + . "44,can,not,be,called,a,number." 0 44
i . + . "44,33.22,11" 1 44
i . + . "44,33.22,11" 2 44
i . + . "44,33.22,11" 1 44 46
i . + . "44,33.22,11" 2 44 46
i . + . "1 2 3" 0 ! ;('!' = clear previous p-fields)
i . + . "1 2 3" 1
i . + . "1 2 3" 2
i . + . "	1 2 	3	" 2
i . + . "1 2 3" 3; error because out of range
i . + . "1,2,3" 0 44
i . + . "1,2,3" 1 .
i . + . "1,2,3" 2 .
i . + . "1,2,3" 3 . ;error because out of range
i . + . "1,2,a" 2 . ;error because 'a' is not a number
i . + . "1.234;56.789" 1 59
e
</CsScore>
</CsoundSynthesizer>

returns:
'44.000000'
'44.000000'
'33.220000'
'11.000000'
'33.000000'
'22.000000'
'1.000000'
'2.000000'
'3.000000'
'3.000000'
INIT ERROR in instr 1 (opcode StrayGetNum): strtod: empty string
inum	strtod	Snum	
'3.000000'
	  B  0.100 - note deleted.  i1 had 1 init errors
'1.000000'
'2.000000'
'3.000000'
INIT ERROR in instr 1 (opcode StrayGetNum): strtod: empty string
inum	strtod	Snum	
'3.000000'
	  B  0.140 - note deleted.  i1 had 1 init errors
INIT ERROR in instr 1 (opcode StrayGetNum): strtod: invalid format
inum	strtod	Snum	
'3.000000'
	  B  0.150 - note deleted.  i1 had 1 init errors
'56.789000'