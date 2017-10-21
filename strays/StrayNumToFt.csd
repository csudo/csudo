/****************************************************************************
ift, iftlen StrayNumToFt Stray [, iftno [, isep1 [, isep2]]]
Converts a string-array which just consists of numbers or simple math expressions to a function table

Puts all numbers in Stray (which must not contain non-numerical elements) in a function table and returns its variable ift (which is produced by iftno, default=0) and the length of the elements written iftlen. (An empty string as input writes a function table of size=1 to avoid an error but returns 0 as length of elements written.) Simple binary math expressions using +, -, *, /, ^ and % are allowed, with just one parenthesis in total (see the examples below). 
Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
Requires csound 5.15 or higher, and the UDOs StrayLen and StrExpr (which itself requires the UDOs StrIsOp, StrLNoth, StrL_NvO, StrL_Prth, StrNxtOpL, StrExpr2, StrRmvST and StrExpr1).
written by joachim heintz

Stray - a string as array
iftno - like in an ftgen statement: if 0 (which is also the default) an automatic number is generated by Csound; if any positive number, this is then the number of the function table
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
ift - the number of the function table which has been created
iftlen - the length of the elements written to the function table (usually this equals the length of the function table; just an empty string as input will create a function table of size=1 but with iftlen=0)
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n -m0
</CsOptions>
<CsInstruments>
ksmps = 32

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

  opcode StrIsOp, i, So
  ;returns 1 for for +, 2 for -, 3 for *, 4 for /, 5 for %, 6 for ^
  ;0 for anything else
String, indx xin
Str strsub String, indx, indx+1
if strcmp(Str, "+") == 0 then
iRes = 1
elseif strcmp(Str, "-") == 0 then
iRes = 2
elseif strcmp(Str, "*") == 0 then
iRes = 3
elseif strcmp(Str, "/") == 0 then
iRes = 4
elseif strcmp(Str, "%") == 0 then
iRes = 5
elseif strcmp(Str, "^") == 0 then
iRes = 6
else
iRes = 0
endif
xout iRes  
  endop
  
  opcode StrLNoth, i, Sii
  ;looks whether left of iPos >= imin is nothing but spaces or tabs (1=true)
Str, imin, iPos xin
iTrue = 1
until iPos < imin+1 do
iPos -= 1
if strchar(Str, iPos) != 32 && strchar(Str, iPos) != 9 then
iTrue = 0
igoto end
endif
enduntil
end: xout iTrue  
  endop
  
  opcode StrL_NvO, i, Sii
  ;looks whether the next real sign to the left >= imin is an operator (1=true)
Str, imin, iPos xin
iTrue = 0
until iPos < imin+1 do
iPos -= 1
 ;if next sign is not empty, test and break
if strchar(Str, iPos) != 32 && strchar(Str, iPos) != 9 then
 if StrIsOp(Str, iPos) > 0 then
  iTrue = 1 ;implicit: else iTrue=0
 endif
 igoto end
endif
enduntil
end: xout iTrue
  endop
  
  opcode StrL_Prth, i, Soj
  ;next corresponding opening parenthesis < iPos and >= iMin
Str, imin, iPos xin
iPos = iPos == -1 ? strlen(Str) - 1 : iPos
iPrtPos = -1
iLevel = 0
until iPos < imin+1 do
  iPos -= 1
  iChar strchar Str, iPos
   ;if next sign is another closing parenthesis, increase level
  if iChar == 41 then
    iLevel += 1
   ;if opening parenthesis 
  elseif iChar == 40 then
     ;and level=0: return position
    if iLevel == 0 then
      iPrtPos = iPos
      igoto end
     ;otherwise decrease level
    else 
      iLevel -= 1
    endif
  endif
enduntil
end: xout iPrtPos
  endop
  
  opcode StrNxtOpL, ii, Soj
  ;returns position and type of next operator left to ipos in Str
  ;stops testing left from iminpos
  ;anything inside parentheses will be disregarded
Str, iminpos, ipos xin
ipos = ipos == -1 ? strlen(Str) - 1 : ipos
iop = 0
until ipos <= iminpos || iop > 0 do
ipos -= 1
 if strchar(Str, ipos) == 41 then
  iPrthPos strrindex strsub(Str, 0, ipos), "("
  ipos = iPrthPos
 else
iop StrIsOp Str, ipos
 endif
enduntil
xout ipos, iop
  endop

  opcode StrExpr2, i, iii
  ;evaluates two numbers which are combined by the operator iOp
  ;iOP values: 1:+, 2:-, 3:*, 4:/, 5:%, 6:^
iNum1, iNum2, iOp xin
if iOp == 1 then
iNum = iNum1 + iNum2
elseif iOp == 2 then
iNum = iNum1 - iNum2
elseif iOp == 3 then
iNum = iNum1 * iNum2
elseif iOp == 4 then
iNum = iNum1 / iNum2
elseif iOp == 5 then
iNum = iNum1 % iNum2
elseif iOp == 6 then
iNum = iNum1 ^ iNum2
endif
xout iNum
  endop
  
  opcode StrRmvST, S, Soj
  ;removes all spaces or tabs from strt to end (both included)
Str, istrt, iend xin
iend = iend == -1 ? strlen(Str) - 1 : iend
Scpy = ""
until istrt == iend+1 do
 if strchar(Str, istrt) != 32 && strchar(Str, istrt) != 9 then
  Scpy strcat Scpy, strsub(Str, istrt, istrt+1)
 endif
 istrt += 1
enduntil
   xout Scpy
  endop
  
  opcode StrExpr1, i, Soj
  ;converts a string expression to a number
  ;note that the string must be without spaces

 ;input (string, first and last index to read)
Str, istrt, iend xin
iend = (iend == -1) ? strlen(Str) - 1 : iend

 ;read backwards
indx = iend
until indx == istrt do

  ;1. if this char is closing parenthesis:
 if strchar(Str, indx) == 41 then
   ;look for the corresponding opening parenthesis
  iPrthPos StrL_Prth Str, istrt, indx
   ;look for the operator before
  iOpPos, iOp StrNxtOpL Str, istrt, iPrthPos
  
   ;if there is one:
  if iOp > 0 then
    ;if this is a simple minus sign:
   if iOp == 2 && StrLNoth(Str, istrt, iOpPos) == 1 then
     ;evaluate 
    iNum = -StrExpr1(Str, iPrthPos+1, indx-1)
    ;if this is plus or minus, split here
   elseif iOp <= 2 then
    iNum StrExpr2 StrExpr1(Str, istrt, iOpPos-1), StrExpr1(Str, iPrthPos+1, indx-1), iOp
    
    ;else splitting might be here or not, if there is another operator before
   else 
     ;look for the operator before
    iPrecOpPos, iPrecOp StrNxtOpL Str, istrt, iOpPos    
     ;if there is none or nothing left to it (= single minus sign), split here
    if iPrecOp == 0 || StrLNoth(Str, istrt, iPrecOpPos) == 1 then
     iNum StrExpr2 StrExpr1(Str, istrt, iOpPos-1), StrExpr1(Str, iPrthPos+1, indx-1), iOp     
     ;if preceding operator >= than operator here, split here
    elseif iPrecOp >= iOp then
     iNum StrExpr2 StrExpr1(Str, istrt, iOpPos-1), StrExpr1(Str, iPrthPos+1, indx-1), iOp     
     ;else split there
    else
     iNum StrExpr2 StrExpr1(Str, istrt, iPrecOpPos-1), StrExpr1(Str, iPrecOpPos+1, indx), iPrecOp
    endif
   endif
   
   ;if no operator before, evaluate this section 
  else
   iNum StrExpr1 Str, iPrthPos+1, indx-1
  endif
   ;leave
  igoto end
  
  ;2. if this char is +:
 elseif StrIsOp(Str, indx) == 1 then
   ;split here, evaluate sections and break
  iNum StrExpr2 StrExpr1(Str, istrt, indx-1), StrExpr1(Str, indx+1, iend), 1
  igoto end

  ;3. if this char is -:
 elseif StrIsOp(Str, indx) == 2 then
   ;if this is a minus sign, ignore
  if StrL_NvO(Str, istrt, indx) == 0 then
    ;otherwise split here, evaluate sections and break
   iNum StrExpr2 StrExpr1(Str, istrt, indx-1), StrExpr1(Str, indx+1, iend), 2
   igoto end
  endif

  ;4. if this char is *, / or %:
 elseif StrIsOp(Str, indx) == 3 || StrIsOp(Str, indx) == 4 || StrIsOp(Str, indx) == 5 then

   ;look for next operator at left
  iOpPos, iOp StrNxtOpL Str, istrt, indx
   ;if +: split there
   if iOp == 1  then
    iNum StrExpr2 StrExpr1(Str, istrt, iOpPos-1), StrExpr1(Str, iOpPos+1, iend), iOp
   ;if - and not minus sign: split there as well
   elseif iOp == 2 && StrLNoth(Str, istrt, iOpPos) == 0 then
    iNum StrExpr2 StrExpr1(Str, istrt, iOpPos-1), StrExpr1(Str, iOpPos+1, iend), iOp
    ;else split here
   else
    iNum StrExpr2 StrExpr1(Str, istrt, indx-1), StrExpr1(Str, indx+1, iend), StrIsOp(Str, indx)
   endif
   ;break loop
  igoto end
  
  ;5. if this char is ^:
 elseif StrIsOp(Str, indx) == 6 then  
   ;look for next operator at left
  iOpPos, iOp StrNxtOpL Str, istrt, indx   
   ;if ^ or minus sign or none: split here
  if iOp == 0 || iOp == 6 || (iOp == 2 && iOpPos == 0) then
    iNum StrExpr2 StrExpr1(Str, istrt, indx-1), StrExpr1(Str, indx+1, iend), 6
   ;else there
  else
    iNum StrExpr2 StrExpr1(Str, istrt, iOpPos-1), StrExpr1(Str, iOpPos+1, iend), 6   
  endif
   ;break loop
  igoto end
 endif

  ;decrease index
indx -= 1
 
enduntil

iNum strtod strsub(Str, istrt, iend+1)

end: xout iNum  
  endop

  
  opcode StrExpr, i, Soj
  ;converts a string expression to a number
 
 ;input
Str, istrt, iend xin
iend = (iend == -1) ? strlen(Str) - 1 : iend

 ;remove spaces
StrRmvd StrRmvST Str, istrt, iend

 ;make sure this is a real string
if strlen(StrRmvd) == 0 then
prints "ERROR in UDO StrExpr: Input String is empty!\n"
igoto skip
endif

 ;then let the sub functions do their work
iNum StrExpr1 StrRmvd
   xout iNum
skip:
  endop


  opcode StrayNumToFt, ii, Sojj
  ;requires the UDOs StrayLen and StrExpr (which itself requires others)
Stray, iftno, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;CREATE A FUNCTION TABLE
iftlen    StrayLen  Stray, isep1, isep2
 if iftlen == 0 then
          prints    "WARNING! StrayNumToFt got empty string as input. Function table with length=1 created, but iftlen=0 returned.\n"
iftl      =         1
 else
iftl      =         iftlen
 endif
ift       ftgen     iftno, 0, -iftl, -2, 0 
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iel       =         -1; number of element in Stray and ift
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
 ;WRITE THE ELEMENT TO THE TABLE
 if inewel == 1 then
inum      StrExpr   Sel ;convert expression to number
          tabw_i    inum, iel, ift ;write to ift
 endif
inewel    =         0
          loop_le   indx, 1, ilen, loop 
end:
          xout      ift, iftlen
  endop 
  
  opcode TbDmpSmpS, 0, iiSo
;prints the content of a table in a simple way, with an additional string as 'introduction'
ifn, iprec, String, ippr xin; function table, float precision while printing, String, parameters per row (maximum = 32)
ippr      =         (ippr == 0 ? 10 : ippr)
iend      =         ftlen(ifn)
indx      =         0
Sformat   sprintf   "%%.%df, ", iprec
Sdump     sprintf   "%s[", String
loop:
ival      tab_i     indx, ifn
Snew      sprintf   Sformat, ival
Sdump     strcat    Sdump, Snew
imod      =         (indx+1) % ippr
 if imod == 0 && indx != iend-1 then
          puts      Sdump, 1
Sdump     =         ""
 endif
          loop_lt   indx, 1, iend, loop
ilen      strlen    Sdump
Slast     strsub    Sdump, 0, ilen-2
		printf_i	"%s]\n", 1, Slast
  endop

instr 1
Stray     strget    p4
          printf_i  "\nStray = '%s'\n", 1, Stray
ipcnt     pcount
if ipcnt == 4 then
ift, ilen StrayNumToFt Stray
elseif ipcnt == 5 then
ift, ilen StrayNumToFt Stray, p5
elseif ipcnt == 6 then
ift, ilen StrayNumToFt Stray, p5, p6
elseif ipcnt == 7 then
ift, ilen StrayNumToFt Stray, p5, p6, p7
endif		
          prints    "ift# = %d, iftlen = %d%n", ift, ilen
          TbDmpSmpS ift, 5, "table content = "
endin 


</CsInstruments>
<CsScore>
i 1 0 .01 "1 -2 3 4 5 6 7"
i . + . "1.2  	2+3.45  6.7/-8.09 "
i . + . "  	15%12  -5-3   "
i . + . "	 2^0.6	 2^(1/12) 2^(-1/12)  	16 32"
i . + . "123*-4.56	 "
i . + . "123*(-4.56)	 "
i . + . "	 "
i . + . ""
i . + . "-(1+2.7)*(-3) 2^(-(-1/-12)) -(-3.10*-65)/(-3.4567) 27%5"
i . + . "1+2.7 2^(1/12) 3.10*65 27%5"
i . + . "1+2.7 2^(1/12) 3.10*65 27%6" 13 ;write table number 13
i . + . "1+2.7,2^(1/12),3.10*65,27%7" 0 44 ;just commas are seperators
i . + . "1+2.7, 2^(1/12), 3.10*65, 27%8" 0 44 ;no problem to write spaces though
i . + . "1+2.7,2^(1/12)|3.10*65,27%9" 0 44 124 ;commas and '|' are seperators
e
</CsScore>
</CsoundSynthesizer>

returns:
    
Stray = '1 -2 3 4 5 6 7'
ift# = 101, iftlen = 7
table content = [1.00000, -2.00000, 3.00000, 4.00000, 5.00000, 6.00000, 7.00000]

Stray = '1.2  	2+3.45  6.7/-8.09 '
ift# = 102, iftlen = 3
table content = [1.20000, 5.45000, -0.82818]

Stray = '  	15%12  -5-3   '
ift# = 103, iftlen = 2
table content = [3.00000, -8.00000]

Stray = '	 2^0.6	 2^(1/12) 2^(-1/12)  	16 32'
ift# = 104, iftlen = 5
table content = [1.51572, 1.05946, 0.94387, 16.00000, 32.00000]

Stray = '123*-4.56	 '
ift# = 105, iftlen = 1
table content = [-560.88000]

Stray = '123*(-4.56)	 '
ift# = 106, iftlen = 1
table content = [-560.88000]

Stray = '	 '
WARNING! StrayNumToFt got empty string as input. Function table with length=1 created, but iftlen=0 returned.
ift# = 107, iftlen = 0
table content = [0.00000]

Stray = ''
WARNING! StrayNumToFt got empty string as input. Function table with length=1 created, but iftlen=0 returned.
ift# = 108, iftlen = 0
table content = [0.00000]

Stray = '-(1+2.7)*(-3) 2^(-(-1/-12)) -(-3.10*-65)/(-3.4567) 27%5'
ift# = 109, iftlen = 4
table content = [11.10000, 0.94387, 58.29259, 2.00000]

Stray = '1+2.7 2^(1/12) 3.10*65 27%5'
ift# = 110, iftlen = 4
table content = [3.70000, 1.05946, 201.50000, 2.00000]

Stray = '1+2.7 2^(1/12) 3.10*65 27%6'
ift# = 13, iftlen = 4
table content = [3.70000, 1.05946, 201.50000, 3.00000]

Stray = '1+2.7,2^(1/12),3.10*65,27%7'
ift# = 111, iftlen = 4
table content = [3.70000, 1.05946, 201.50000, 6.00000]

Stray = '1+2.7, 2^(1/12), 3.10*65, 27%8'
ift# = 112, iftlen = 4
table content = [3.70000, 1.05946, 201.50000, 3.00000]

Stray = '1+2.7,2^(1/12)|3.10*65,27%9'
ift# = 113, iftlen = 4
table content = [3.70000, 1.05946, 201.50000, 0.00000]

