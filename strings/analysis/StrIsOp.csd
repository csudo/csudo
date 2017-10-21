/****************************************************************************
iOp StrIsOp Str, iPos
Looks whether the iPos character in Str is a mathematical operator. Returns 
1 for for +, 2 for -, 3 for *, 4 for /, 5 for %, 6 for ^ and 0 for anything 
else.
written by joachim heintz

Str - input string
iPos - position (index) to read in Str (default = 0)
iOp - 1-6 for operators '+ - * / % ^', 0 for anything else
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
  
  instr 1
Str = "1 + 1 = 2 but 2 ^ 0 = 1 * 1 - 0 and 4 / 7 != 4 % 7 ..."
prints "Characters and Operators:\n"
indx = 0
until indx == strlen(Str) do
printf_i "  '%s' -> %d\n", indx+1, strsub(Str, indx, indx+1), StrIsOp(Str, indx)
indx += 1
enduntil
  endin 
</CsInstruments>
<CsScore>
i 1 0 0
</CsScore>
</CsoundSynthesizer>

