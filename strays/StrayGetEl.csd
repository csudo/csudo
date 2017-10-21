/****************************************************************************
Sel StrayGetEl Stray, ielindx [, isep1 [, isep2]]
Gets one element from a string-array

Returns (at i-rate) the element for ielindex in String, or an empty string, if the element has not been found. By default, the seperators between the elements are spaces and tabs. Others seperators can be defined by their ASCII code number.
Requires Csound 5.15 or higher
written by joachim heintz

Input:
Stray - a string as array
ielindx - the index of the element (starting with 0)
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab)
If the defaults are not used and just isep1 is given, it's the only seperator. If you want two seperators (as in the dafault), you must give isep1 and isep2
Output:
Sel - the element at position ielindx, as a string. if the element has not been found, an empty string is returned
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n -m0
</CsOptions>
<CsInstruments>

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
  
instr 1
Sdst      strget    p4
ipcnt     pcount
if ipcnt == 5 then
Sel       StrayGetEl Sdst, p5
elseif ipcnt == 6 then
Sel       StrayGetEl Sdst, p5, p6
else	
Sel       StrayGetEl Sdst, p5, p6, p7
endif
		printf_i	"'%s'\n", 1, Sel
endin 



</CsInstruments>
<CsScore>
i 1 0 0.01 "The 	ASCII code of a comma (,) is 44" 2
i . + . "Audio 01.wav|Audio 02.wav|Audio 03.wav|Audio 04.wav" 1 124 ;just '|'
i . + . "Audio 01.wav|Audio 02.wav|Audio 03.wav|Audio 04.wav" 1 124 32 ;'|' and space
i . + . "" 0 ! ;the '!' clears p6 and p7
i . + . "" 1
i . + . " " 0
i . + . "	" 0
i . + . "ab c d ef grrrrr" 0
i . + . "ab c d ef grrrrr" 1
i . + . "ab c d ef grrrrr" 2
i . + . "ab c d ef grrrrr" 3
i . + . "ab c d ef grrrrr" 4
i . + . "ab c d ef grrrrr" 5
i . + . "ab c d ef grrrrr" 6
i . + . "	fkjhg  fu    	dobd	12398		" 0
i . + . "	fkjhg  fu    	dobd	12398		" 1
i . + . "	fkjhg  fu    	dobd	12398		" 2
i . + . "	fkjhg  fu    	dobd	12398		" 3
i . + . "	fkjhg  fu    	dobd	12398		" 4
</CsScore>
</CsoundSynthesizer>

returns:
'code'
'Audio 02.wav'
'01.wav'
''
''
''
''
'ab'
'c'
'd'
'ef'
'grrrrr'
''
''
'fkjhg'
'fu'
'dobd'
'12398'
''

