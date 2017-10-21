/****************************************************************************
iNum StrExpr1 Str, iStrt, iEnd
Converts a string expression to a number. Note that the string MUST be WITHOUT any spaces or tabs.
Requires the UDOs StrL_Prth, StrNxtOpL, StrLNoth, StrExpr2, StrIsOp, StrL_NvO

Calculates a math expression in a string (optional a part of it >= iStrt <= iEnd) and returns the result as a number. Supported math operations are +, -, *, /, ^, and %. Parentheses are allowed. A simple number string is also accepted and converted to a number. No spaces are allowed; use the UDO StrRmvST if necessary to remove spaces or tabs.
written by joachim heintz

Str - Input string with a common math expression
iStrt - First index (position) to be considered (default = 0)
iEnd - Last index to be considered (default = -1 = end of string)
iNum - Result of the math expression as number
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32

  opcode StrL_Prth, i, Soj
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

  opcode StrIsOp, i, So
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
  
  opcode StrNxtOpL, ii, Soj
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

  opcode StrLNoth, i, Sii
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

  opcode StrExpr2, i, iii
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

  opcode StrL_NvO, i, Sii
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

  opcode StrExpr1, i, Soj

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

instr 1
String    strget    p4
iNum      StrExpr1  String
          printf_i  "'%s' -> %f\n", 1, String, iNum
endin 


</CsInstruments>
<CsScore>
;+
i 1 0 .01 "1+1"
i 1 + .01 "1+-1" 
i 1 + .01 "1+(-1)" 
i 1 + .01 "-1+1"
i 1 + .01 "1.2345+0.6789"
;-
i 1 + .01 "1-1"
i 1 + .01 "-1-1"
i 1 + .01 "1.2345-0.6789"
;*
i 1 + .01 "123*-4.56"
i 1 + .01 "123*(-4.56)"
i 1 + .01 "-123*4.56"
i 1 + .01 "(-123)*4.56"
i 1 + .01 "-123*-4.56"
i 1 + .01 "(-123)*(-4.56)"
;/
i 1 + .01 "1/3"
i 1 + .01 "6.7/-8.09"
i 1 + .01 "6.7/(-8.09)"
i 1 + .01 "-6.7/8.09"
i 1 + .01 "(-6.7)/8.09"
;%
i 1 + .01 "15%12"
i 1 + .01 "15%-12"
i 1 + .01 "15%(-12)"
i 1 + .01 "-15%-12"
i 1 + .01 "(-15)%(-12)"
i 1 + .01 "-15%12"
i 1 + .01 "(-15)%12"
i 1 + .01 "15%1.2"
i 1 + .01 "15%-1.2"
i 1 + .01 "15%(-1.2)"
;^
i 1 + .01 "2^10"
i 1 + .01 "2^-10"
i 1 + .01 "2^(-10)"
i 1 + .01 "2^0.5"
i 1 + .01 "2^-0.5"
i 1 + .01 "2^(-0.5)"
i 1 + .01 "-2^0.5" ;nan
i 1 + .01 "(-2)^0.5" ;nan
i 1 + .01 "-(2^0.5)" 
;single value
i 1 + .01 "-9.87654321"
;combined expression
i 1 + .01 "(-2-3)-1.23456*((3+4)-17)"
</CsScore>
</CsoundSynthesizer>
returns:
'1+1' -> 2.000000
'1+-1' -> 0.000000
'1+(-1)' -> 0.000000
'-1+1' -> 0.000000
'1.2345+0.6789' -> 1.913400
'1-1' -> 0.000000
'-1-1' -> -2.000000
'1.2345-0.6789' -> 0.555600
'123*-4.56' -> -560.880000
'123*(-4.56)' -> -560.880000
'-123*4.56' -> -560.880000
'(-123)*4.56' -> -560.880000
'-123*-4.56' -> 560.880000
'(-123)*(-4.56)' -> 560.880000
'1/3' -> 0.333333
'6.7/-8.09' -> -0.828183
'6.7/(-8.09)' -> -0.828183
'-6.7/8.09' -> -0.828183
'(-6.7)/8.09' -> -0.828183
'15%12' -> 3.000000
'15%-12' -> 3.000000
'15%(-12)' -> 3.000000
'-15%-12' -> -3.000000
'(-15)%(-12)' -> -3.000000
'-15%12' -> -3.000000
'(-15)%12' -> -3.000000
'15%1.2' -> 0.600000
'15%-1.2' -> 0.600000
'15%(-1.2)' -> 0.600000
'2^10' -> 1024.000000
'2^-10' -> 0.000977
'2^(-10)' -> 0.000977
'2^0.5' -> 1.414214
'2^-0.5' -> 0.707107
'2^(-0.5)' -> 0.707107
'-2^0.5' -> nan
'(-2)^0.5' -> nan
'-(2^0.5)' -> -1.414214
'-9.87654321' -> -9.876543
'(-2-3)-1.23456*((3+4)-17)' -> 7.345600

