/****************************************************************************
iOpPos, iOp StrNxtOpL Str, iMinPos, iPos

Returns position and type of next operator < iPos and >= iMin. Anything inside 
Parentheses will be disregarded.

Requires the UDO StrIsOp.
written by joachim heintz

Str - input string
iPos - position (index) in Str. the UDO will look "left to" this position
iMin - minimum position (index) which is regarded for left search
iOpPos - position of operator
iOp - type of operator: 1-6 for operators '+ - * / % ^', 0 for anything else
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32

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
  
  instr 1
Str = "1 + 1 = 2 but 2 ^ 0 = 1 * 1 - 0 and 4 / 7 != 4 % 7 ..."
printf_i "Str = '%s'\n", 1, Str
prints   "Indx = 012345   10   15   20   25   30   35   40   45   50\n"
printf_i "Operator types: 1 -> +, 2 -> -, 3 -> *, 4 -> /, 5 -> %s, 6 -> ^, 0 -> not found \n", 1, "%"
iOpPos, iOp StrNxtOpL Str
printf_i "Next operator left of end of string: position = %d, type = %d\n", 1, iOpPos, iOp
iOpPos, iOp StrNxtOpL Str, 0, 15
printf_i "Next operator left of index=15: position = %d, type = %d\n", 1, iOpPos, iOp
iOpPos, iOp StrNxtOpL Str, 5, 15
printf_i "Next operator left of index=15, minimum=5: position = %d, type = %d\n", 1, iOpPos, iOp

  endin 
  
</CsInstruments>
<CsScore>
i 1 0 0
</CsScore>
</CsoundSynthesizer>
returns:
Str = '1 + (2 - 3)'
Indx = 0123456789
Left of indx=4 operator? True = 1
Left of indx=3 operator? True = 1
Left of indx=4 with min=3 operator? True = 0

