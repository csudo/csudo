/****************************************************************************
iNum StrExpr1 Str
Calculates a simple binary expression in a string and returns the result as a number

Calculates a simple binary expression in a string and returns the result as a number. No spaces and no parentheses are allowed. Supported math operations are +, -, *, /, ^, and %. A simple number string is also accepted and converted to a number.

Str - Input string with a simple binary math expression. Supported math operations are +, -, *, /, ^, and %. No spaces and no parentheses are allowed. A simple number string is also accepted and converted to a number.
iNum - result of the binary operation as number
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>


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

instr 1
String    strget    p4
iNum      StrExpr1  String
          printf_i  "'%s' -> %f\n", 1, String, iNum
endin 

</CsInstruments>
<CsScore>
;+
i 1 0 .01 "1+1"
i 1 + .01 "1+-1" ;instead of '1+(-1)' (no parentheses allowed)
i 1 + .01 "-1+1"
i 1 + .01 "1.2345+0.6789" ;instead of '1+(-1)'
;-
i 1 + .01 "1-1"
i 1 + .01 "-1-1"
i 1 + .01 "1.2345-0.6789"
;*
i 1 + .01 "123*-4.56"
i 1 + .01 "-123*4.56"
i 1 + .01 "-123*-4.56"
;/
i 1 + .01 "1/3"
i 1 + .01 "6.7/-8.09"
i 1 + .01 "-6.7/8.09"
;%
i 1 + .01 "15%12"
i 1 + .01 "15%-12"
i 1 + .01 "-15%-12"
i 1 + .01 "-15%12"
i 1 + .01 "15%1.2"
i 1 + .01 "15%-12"
;^
i 1 + .01 "2^10"
i 1 + .01 "2^-10"
i 1 + .01 "2^0.5"
i 1 + .01 "2^-0.5"
i 1 + .01 "-2^0.5" ;nan
;nothing
i 1 + .01 "-9.87654321" ;nan
</CsScore>
</CsoundSynthesizer>
returns:
'1+1' -> 2.000000
'1+-1' -> 0.000000
'-1+1' -> 0.000000
'1.2345+0.6789' -> 1.913400
'1-1' -> 0.000000
'-1-1' -> -2.000000
'1.2345-0.6789' -> 0.555600
'123*-4.56' -> -560.880000
'-123*4.56' -> -560.880000
'-123*-4.56' -> 560.880000
'1/3' -> 0.333333
'6.7/-8.09' -> -0.828183
'-6.7/8.09' -> -0.828183
'15%12' -> 3.000000
'15%-12' -> 3.000000
'-15%-12' -> -3.000000
'-15%12' -> -3.000000
'15%1.2' -> 0.600000
'15%-12' -> 3.000000
'2^10' -> 1024.000000
'2^-10' -> 0.000977
'2^0.5' -> 1.414214
'2^-0.5' -> 0.707107
'-2^0.5' -> -nan
'-9.87654321' -> -9.876543
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
