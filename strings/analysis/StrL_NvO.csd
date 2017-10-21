/****************************************************************************
iTrue StrL_NvO Str, iMin, iPos

Looks whether the next real sign (= except spaces or tabs) left of iPos >= iMin 
is an operator. Returns 1 if true, 0 if false.
Requires the UDO StrIsOp.
written by joachim heintz

Str - input string
iPos - position (index) in Str. the UDO will look "left to" this position
iMin - minimum position (index) which is regarded for left search
iTrue - 1 = true, 0 = false
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
  
  instr 1
Str =   "1 + (2 - 3)"
printf_i "Str = '%s'\n", 1, Str
prints   "Indx = 0123456789\n"
printf_i "Left of indx=4 operator? True = %d\n", 1, StrL_NvO(Str, 0, 4)
printf_i "Left of indx=3 operator? True = %d\n", 1, StrL_NvO(Str, 0, 3)
printf_i "Left of indx=4 with min=3 operator? True = %d\n", 1, StrL_NvO(Str, 3, 4)
  endin 
  
  instr 2
Str =   " -1"  
iRes StrL_NvO Str, 0, 1
print iRes
  endin
  
</CsInstruments>
<CsScore>
i 1 0 0
i 2 .1 .1
</CsScore>
</CsoundSynthesizer>
returns:
Str = '1 + (2 - 3)'
Indx = 0123456789
Left of indx=4 operator? True = 1
Left of indx=3 operator? True = 1
Left of indx=4 with min=3 operator? True = 0

