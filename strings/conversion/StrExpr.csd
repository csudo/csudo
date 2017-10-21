/****************************************************************************
iNum StrExpr Str [, iStrt [, iEnd]]
Converts a string expression to a number. Requires the UDOs StrIsOp, StrLNoth, StrL_NvO, StrL_Prth, StrNxtOpL, StrExpr2, StrRmvST and StrExpr1.

Converts a string expression to a number. Requires the UDOs StrIsOp, StrLNoth, StrL_NvO, StrL_Prth, StrNxtOpL, StrExpr2, StrRmvST and StrExpr1. Spaces (or tabs) are allowed. Supported math operations are +, -, *, /, % and ^. The precedence of bindings is as usual (^ is stronger than *%/ than +-).
written by joachim heintz

Str - input string with a math expression.
iStrt - first index to read in Str (default = 0)
iEnd - last index to read in Str (default = -1 which means end of the string)
iNum - result of the math expression as number
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32

  
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
  


instr 1
String    strget    p4
iNum      StrExpr   String
          printf_i  "'%s' -> %f\n", 1, String, iNum
endin 

</CsInstruments>
<CsScore>
i 1 0 .01 " -1  " 
i 1 + .01 "1+1" 
i 1 + .01 "(1+1)+1" 
i 1 + .01 "1+(1+1)" 
i 1 + .01 "(1-1)-1"
i 1 + .01 "1-(1-1)"
i 1 + .01 "-(1-1)-1"
i 1 + .01 "-1-(1-1)"
i 1 + .01 "(2-1)-1"
i 1 + .01 "2-(1-1)"
i 1 + .01 "-(2-1)-1"
i 1 + .01 "(1-2)-1"
i 1 + .01 "1-(2-1)"
i 1 + .01 "-(1-2)-1"
i 1 + .01 "(-2-1)-1"
i 1 + .01 "-2-(1-1)"
i 1 + .01 "-(-2-1)-1"
i 1 + .01 "(-1-1)-2"
i 1 + .01 "-1-(1-2)"
i 1 + .01 "-(-1-1)-2"
i 1 + .01 "123*0.456"
i 1 + .01 "123*-0.456" ;ok
i 1 + .01 "123*(-0.456)" ;no need for parentheses here, but also ok
i 1 + .01 "-123*-0.456" 
i 1 + .01 "-(123*-0.456)" 
i 1 + .01 "(-123)*(-0.456)" 
i 1 + .01 "(-123*-0.456)" ;stupid but works
i 1 + .01 "(1/2)/3" 
i 1 + .01 "1/(2/3)" 
i 1 + .01 "-(1/2)/3" 
i 1 + .01 "(1/-2)/3" 
i 1 + .01 "(-1/-2)/3" 
i 1 + .01 "-(1/2)/-3" 
i 1 + .01 "(1/2)/-3" 
i 1 + .01 "-(-1/-2)/-3" 
i 1 + .01 "2^(1/12)" ;equal tempered semitone 
i 1 + .01 "2*(3+4)-17"
i 1 + .01 "2*((3+4)-17)"
i 1 + .01 "	2 * ((3+4) - 17)	" ;spaces and tabs will be removed internally
i 1 + .01 "(-2-3) + (-1.23456)"
i 1 + .01 "1 - 1.23456 * 10" 
i 1 + .01 "1-1.23456*-10"
i 1 + .01 "1 - 1.23456 * -10"
i 1 + .01 "1 - 1.23456 * ((3+4)-17)"
i 1 + .01 "(-2 - 3) - 1.23456 * ((3 + 4) - 17)"
i 1 + .01 "2^(1/12) * 440"
</CsScore>
</CsoundSynthesizer>
returns:
' -1  ' -> -1.000000
'1+1' -> 2.000000
'(1+1)+1' -> 3.000000
'1+(1+1)' -> 3.000000
'(1-1)-1' -> -1.000000
'1-(1-1)' -> 1.000000
'-(1-1)-1' -> -1.000000
'-1-(1-1)' -> -1.000000
'(2-1)-1' -> 0.000000
'2-(1-1)' -> 2.000000
'-(2-1)-1' -> -2.000000
'(1-2)-1' -> -2.000000
'1-(2-1)' -> 0.000000
'-(1-2)-1' -> 0.000000
'(-2-1)-1' -> -4.000000
'-2-(1-1)' -> -2.000000
'-(-2-1)-1' -> 2.000000
'(-1-1)-2' -> -4.000000
'-1-(1-2)' -> 0.000000
'-(-1-1)-2' -> 0.000000
'123*0.456' -> 56.088000
'123*-0.456' -> -56.088000
'123*(-0.456)' -> -56.088000
'-123*-0.456' -> 56.088000
'-(123*-0.456)' -> 56.088000
'(-123)*(-0.456)' -> 56.088000
'(-123*-0.456)' -> 56.088000
'(1/2)/3' -> 0.166667
'1/(2/3)' -> 1.500000
'-(1/2)/3' -> -0.166667
'(1/-2)/3' -> -0.166667
'(-1/-2)/3' -> 0.166667
'-(1/2)/-3' -> 0.166667
'(1/2)/-3' -> -0.166667
'-(-1/-2)/-3' -> 0.166667
'2^(1/12)' -> 1.059463
'2*(3+4)-17' -> -3.000000
'2*((3+4)-17)' -> -20.000000
'	2 * ((3+4) - 17)	' -> -20.000000
'(-2-3) + (-1.23456)' -> -6.234560
'1 - 1.23456 * 10' -> -11.345600
'1-1.23456*-10' -> 13.345600
'1 - 1.23456 * -10' -> 13.345600
'1 - 1.23456 * ((3+4)-17)' -> 13.345600
'(-2 - 3) - 1.23456 * ((3 + 4) - 17)' -> 7.345600

