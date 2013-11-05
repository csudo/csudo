/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN strings/conversion:
*****************************************************************************
StrExpr1   : iNum StrExpr1 Str
StrExpr2   : iNum StrExpr2 Str
StrNumP    : itest StrNumP String
StrToAscS  : Sout StrToAscS Sin
*****************************************************************************
****************************************************************************/

/****************************************************************************
iNum StrExpr1 Str
Calculates a simple binary expression in a string and returns the result as a number

Calculates a simple binary expression in a string and returns the result as a number. No spaces and no parentheses are allowed. Supported math operations are +, -, *, /, ^, and %. A simple number string is also accepted and converted to a number.

Str - Input string with a simple binary math expression. Supported math operations are +, -, *, /, ^, and %. No spaces and no parentheses are allowed. A simple number string is also accepted and converted to a number.
iNum - result of the binary operation as number
****************************************************************************/
/****************************************************************************
iNum StrExpr2 Str
Calculates a binary numerical expression in a string and returns the result as a number. One of the elements can be itself a binary expression, in which case it must be set in parentheses. Requires the UDO StrExpr1

Calculates a binary numerical expression in a string and returns the result as a number. One of the elements can be itself a binary expression, in which case it must be set in parentheses. No spaces are allowed. Supported math operations are +, -, *, /, ^, and %. A simple number string or a simple expression (like in StrExpr1) is also accepted and converted to a number.

Str - Input string with a binary math expression. One of the elements can be itself a binary expression, in which case it must be set in parentheses. No spaces are allowed. Supported math operations are +, -, *, /, ^, and %. A simple number string or a simple expression (like in StrExpr1) is also accepted and converted to a number.
iNum - result of the binary operation as number
****************************************************************************/
/****************************************************************************
itest StrNumP String
Tests whether a string is a numerical string

Tests whether a string is a numerical string ("1" or "1.23435" but not "1a"). Returns 1 for "yes" and 0 for "no". If "yes", the string can be converted to a number by the opcode strtod.

String - any string
itest - 1 if String is a numerical string, 0 if not
****************************************************************************/
/****************************************************************************
Sout StrToAscS Sin
Returns the ASCII numbers of the input string as string.

Returns the ASCII numbers of the input string as string. The integers in the output string are seperated by one space.
You may have to set the flag -+max_str_len=10000 to avoid buffer overflow. 

Sin - Input string with any sequence of characters or numbers.
Sout - Output string containing the ASCII numbers of all characters, seperated by spaces.
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

  opcode StrNumP, i, S
Str        xin
ip         =          1; start at yes and falsify
ilen       strlen     Str
 if ilen == 0 then
ip         =          0
           igoto      end
 endif
ifirst     strchar    Str, 0
 if ifirst == 45 then; a "-" is just allowed as first character
Str        strsub     Str, 1, -1
ilen       =          ilen-1
 endif
indx       =          0
inpnts     =          0; how many points have there been
loop:
iascii     strchar    Str, indx; 48-57
 if iascii < 48 || iascii > 57 then; if not 0-9
  if iascii == 46 && inpnts == 0 then; if not the first point
inpnts     =          1
           else
ip         =          0
  endif
 endif
           loop_lt    indx, 1, ilen, loop
end:       xout       ip
  endop

  opcode StrToAscS, S, S
Sin        xin
ilen       strlen     Sin
ipos       =          0
Sres       =          ""
loop:
ichr       strchar    Sin, ipos
Snew       sprintf    "%d ", ichr
Sres       strcat     Sres, Snew
           loop_lt    ipos, 1, ilen, loop
           xout       Sres
  endop


