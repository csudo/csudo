<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>

/****************************************************************************
iNum StrExpr2 Str
Calculates a binary numerical expression in a string and returns the result as a number. One of the elements can be itself a binary expression, in which case it must be set in parentheses. Requires the UDO StrExpr1

Calculates a binary numerical expression in a string and returns the result as a number. One of the elements can be itself a binary expression, in which case it must be set in parentheses. No spaces are allowed. Supported math operations are +, -, *, /, ^, and %. A simple number string or a simple expression (like in StrExpr1) is also accepted and converted to a number.

Str - Input string with a binary math expression. One of the elements can be itself a binary expression, in which case it must be set in parentheses. No spaces are allowed. Supported math operations are +, -, *, /, ^, and %. A simple number string or a simple expression (like in StrExpr1) is also accepted and converted to a number.
iNum - result of the binary operation as number
****************************************************************************/


  opcode StrExpr1, i, S
Str       xin
isum      strindex  Str, "+"; sum
idif      strindex  Str, "-"; difference
ipro      strindex  Str, "*"; product
irat      strindex  Str, "/"; ratio
ipow      strindex  Str, "^"; power
imod      strindex  Str, "%"; modulo
 if ipow > 0 then
ifirst    strindex  Str, "^"
S1        strsub    Str, 0, ifirst
S2        strsub    Str, ifirst+1
i1        strtod    S1
i2        strtod    S2
ires      =         i1 ^ i2
 elseif imod > 0 then
ifirst    strindex  Str, "%"
S1        strsub    Str, 0, ifirst
S2        strsub    Str, ifirst+1
i1        strtod    S1
i2        strtod    S2
ires      =         i1 % i2
 elseif ipro > 0 then
ifirst    strindex  Str, "*"
S1        strsub    Str, 0, ifirst
S2        strsub    Str, ifirst+1
i1        strtod    S1
i2        strtod    S2
ires      =         i1 * i2
 elseif irat > 0 then
ifirst    strindex  Str, "/"
S1        strsub    Str, 0, ifirst
S2        strsub    Str, ifirst+1
i1        strtod    S1
i2        strtod    S2
ires      =         i1 / i2
 elseif isum > 0 then 
ifirst    strindex  Str, "+"
S1        strsub    Str, 0, ifirst
S2        strsub    Str, ifirst+1
i1        strtod    S1
i2        strtod    S2
ires      =         i1 + i2
 elseif idif > -1 then
ifirst    strrindex Str, "-";(last occurrence: -3-4 is possible, but not 3--4)
S1        strsub    Str, 0, ifirst
S2        strsub    Str, ifirst+1
iS1len    strlen    S1
 if iS1len == 0 then ;just a negative number
inum      strtod    S2
ires      =         -inum
 else	 
ifirst    strtod    S1
isec      strtod    S2
ires      =         ifirst - isec
  endif
 else
ires      strtod    Str
 endif
          xout      ires
  endop 

  opcode StrExpr2, i, S
Sin       xin
ilen      strlen    Sin
;if a parenthesis can be found
iparenth  strindex  Sin, "("
if iparenth > -1 then
  ;if in first half and no '-' preceeds
  if iparenth == 0 then
    ;then first element ends in ")"
iprend    strindex   Sin, ")"
S1        strsub     Sin, 1, iprend
    ;convert this element into a number
i1        StrExpr1   S1
    ;append the rest and convert again
S2        strsub     Sin, iprend+2 
Sep       strsub     Sin, iprend+1, iprend+2
Scoll     sprintf    "%f%s%s", i1, Sep, S2
ires      StrExpr1   Scoll
  ;if in first half and '-' preceeds
  elseif iparenth == 1 then
    ;then first element ends in ")"
iprend    strindex   Sin, ")"
S1        strsub     Sin, 2, iprend
    ;convert this element into a number
i1        StrExpr1   S1
i1        =          -i1
    ;append the rest and convert again
S2        strsub     Sin, iprend+2 
Sep       strsub     Sin, iprend+1, iprend+2
Scoll     sprintf    "%f%s%s", i1, Sep, S2
ires      StrExpr1   Scoll
  ;if the parenthesis is in the second half
  else
    ;isolate first element and the conjunction
S1        strsub     Sin, 0, iparenth-1
Sep       strsub     Sin, iparenth-1, iparenth
    ;convert the second element
S2        strsub     Sin, iparenth+1, ilen-1
i2        StrExpr1   S2
      ;if subtraction and i2 negative, convert to addition
isepminus strcmp     Sep, "-"
      if i2 < 0 && isepminus == 0 then
i2        =          -i2
Sep       =          "+"
      endif
    ;convert the whole
Scoll     sprintf    "%s%s%f", S1, Sep, i2
ires      StrExpr1   Scoll
  endif
;if no parenthesis, simply convert
else	
ires      StrExpr1   Sin
endif
          xout       ires
  endop

instr 1
String    strget    p4
iNum      StrExpr2  String
          printf_i  "'%s' -> %f\n", 1, String, iNum
endin 

</CsInstruments>
<CsScore>
i 1 0 .01 "1" ;simple number string
i 1 + .01 "1+1" ;simple binary expression
i 1 + .01 "(1+1)+1" ;binary expression with one nested expression
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
i 1 + .01 "123*-(0.456)" ;no need for parentheses here, but also ok
i 1 + .01 "-123*-0.456" 
i 1 + .01 "-(123*-0.456)" 
i 1 + .01 "(-123*-0.456)" 
i 1 + .01 "(1/2)/3" 
i 1 + .01 "1/(2/3)" 
i 1 + .01 "-(1/2)/3" 
i 1 + .01 "(1/-2)/3" 
i 1 + .01 "(-1/-2)/3" 
i 1 + .01 "-(1/2)/-3" 
i 1 + .01 "(1/2)/-3" 
i 1 + .01 "-(-1/-2)/-3" 
i 1 + .01 "2^(1/12)" ;equal tempered semitone 
</CsScore>
</CsoundSynthesizer>
returns:
'1' -> 1.000000
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
'123*-(0.456)' -> -56.088000
'-123*-0.456' -> 56.088000
'-(123*-0.456)' -> 56.088000
'(-123*-0.456)' -> 56.088000
'(1/2)/3' -> 0.166667
'1/(2/3)' -> 1.499999
'-(1/2)/3' -> -0.166667
'(1/-2)/3' -> -0.166667
'(-1/-2)/3' -> 0.166667
'-(1/2)/-3' -> 0.166667
'(1/2)/-3' -> -0.166667
'-(-1/-2)/-3' -> 0.166667
'2^(1/12)' -> 1.059463
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
