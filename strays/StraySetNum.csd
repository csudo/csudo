/****************************************************************************
Sres StraySetNum Stray, inum [, ielindx [, isep1 [, isep2 [,isepOut]]]]
Inserts a number in an array-string at a certain position

Puts the number inum at the position ielindx (default=-1: at the end) of Stray, and returns the result as Sres. Elements in Stray are seperated by the two ascii-coded seperators isepA (default=32: space) and isepB (default=9: tab). if just isepA is given, it is also read as isepB. the element is inserted using the seperator isepOut (default=isep1)
Requires Csound 5.16 or higher, and the UDO FracLen.
written by joachim heintz

Stray - a string as array
inum - the number to be inserted
ielindx - the element position in Stray at which the number is inserted (starting with 0); the default -1 means append at the end of Stray
istrout - a number for the strset opcode, denoting the resulting string (Stray with the insertion of the new element). the default is 1; as strset creates global numbers you should be careful in using this number
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab)
isepOut - the seperator for the insertion (default=isep1)
****************************************************************************/



<CsoundSynthesizer>
<CsOptions>
-n -m0
</CsOptions>
<CsInstruments>

  opcode FracLen, i, io
;returns the number of digits in the fractional part of inum (0=integer)
inum, ifracs xin
ifac      =         10^ifracs
if int(inum*ifac) == inum*ifac then
          igoto     end
else
ifracs    FracLen   inum, ifracs+1
endif
end:      xout      ifracs
  endop

  opcode StraySetNum, S, Sijjjj
  ;requires the UDO FracLen
Stray, inum, ielindx, isepA, isepB, isepOut xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
isepOut   =         (isepOut == -1 ? isep1 : isepOut)
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
SepOut    sprintf   "%c", isepOut
;;INITIALIZE SOME PARAMETERS
ifracs    FracLen   inum
ilen      strlen    Stray
iel       =         0; actual element position
iwarsep   =         1
indx      =         0
;;APPEND inum IF ielindx=-1
 if ielindx == -1 then
Sformat   sprintf   "%%s%%s%%.%df", ifracs
Sres      sprintf   Sformat, Stray, SepOut, inum
          igoto     end	
 endif
;;PREPEND inum IF ielindx=0
 if ielindx == 0 then
Sformat   sprintf   "%%.%df%%s%%s", ifracs
Sres      sprintf   Sformat, inum, SepOut, Stray
          igoto     end	
  endif
loop:
Snext     strsub    Stray, indx, indx+1; next sign
isep1p    strcmp    Snext, Sep1; returns 0 if Snext is sep1
isep2p    strcmp    Snext, Sep2; 0 if Snext is sep2
;;NEXT SIGN IS NOT SEP1 NOR SEP2
if isep1p != 0 && isep2p != 0 then
 if iwarsep == 1 then; first character after a seperator 
  if iel == ielindx then; if searched element index
S1        strsub    Stray, 0, indx; string before Sin
S2        strsub    Stray, indx, -1; string after Sin
Sformat   sprintf   "%%s%%.%df%%s%%s", ifracs
Sres      sprintf   Sformat, S1, inum, SepOut, S2
          igoto     end
  else              ;if not searched element index
iel       =         iel+1; increase it
iwarsep   =         0; log that it's not a seperator 
  endif 
 endif 
;;NEXT SIGN IS SEP1 OR SEP2
else 
iwarsep   =         1
endif
          loop_lt   indx, 1, ilen, loop 
;;APPEND inum IF ielindx IS >= NUMBER OF ELEMENTS
Sformat   sprintf   "%%s%%s%%.%df", ifracs
Sres      sprintf   Sformat, Stray, SepOut, inum
end:		xout      Sres
  endop 
  

instr 1
Stray 		strget 	p4
ipcnt		pcount
;print ipcnt
if ipcnt == 5 then
Sres      StraySetNum Stray, p5
elseif ipcnt == 6 then
Sres      StraySetNum Stray, p5, p6
elseif ipcnt == 7 then
Sres      StraySetNum Stray, p5, p6, p7
elseif ipcnt == 8 then
Sres      StraySetNum Stray, p5, p6, p7, p8
else
Sres      StraySetNum Stray, p5, p6, p7, p8, p9
endif		
		printf_i	"'%s'\n", 1, Sres
endin 

</CsInstruments>
<CsScore>
i 1 0 .01 "1 2 a b" 3
i . + . "1 2 a b" 3.12345
i . + . "the number 1 is not a" 0
i . + . "the number 1 is not a" 0 1
i . + . "the number 1 is not a" 0 2
i . + . "the number 1 is not a" 0 3
i . + . "the number 1 is not a" 0 4
i . + . "the number 1 is not a" 0 5
i . + . "the number 1 is not a" 0 6
i . + . "the number 1 is not a" 0.1 60
i . + . "The		ASCII code of a comma (,) is 44" 0.1
i . + . "The		ASCII code of a comma (,) is 44" 0.2 32
i . + . "1,2,-3,5" -4 3 44
i . + . "1,2,-3,5" -4 3 44 44 32
i . + . "1, 2, -3, 5" -4 3 32 44 124
e
</CsScore>
</CsoundSynthesizer>

returns:
'1 2 a b 3'
'1 2 a b 3.12345'
'the number 1 is not a 0'
'the 0 number 1 is not a'
'the number 0 1 is not a'
'the number 1 0 is not a'
'the number 1 is 0 not a'
'the number 1 is not 0 a'
'the number 1 is not a 0'
'the number 1 is not a 0.1'
'The		0.1 ASCII code of a comma (,) is 44'
'The		ASCII code of a comma (,) is 44 0.2'
'1,2,-3,-4,5'
'1,2,-3,-4 5'
'1, 2, -3, -4|5'

