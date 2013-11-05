/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN strings:
*****************************************************************************
FilDir     : Sdir FilDir Spath
FilDirUp   : SUpDir FilDirUp SCurDir
FilNam     : Snam FilNam Spath
FilSuf     : Suf FilSuf Spath [,ilow]
StrAgrm    : Sout StrAgrm Sin [,iLen]
StrAgrmk   : Sout StrAgrm Sin [,iLen]
StrExpr1   : iNum StrExpr1 Str
StrExpr2   : iNum StrExpr2 Str
StrMems    : iSumEls StrMems Str, Sel
StrNumP    : itest StrNumP String
StrToAscS  : Sout StrToAscS Sin
StripL     : Sout StripL Sin
*****************************************************************************
****************************************************************************/

/****************************************************************************
Sdir FilDir Spath
Returns the directory in a given path

Returns the directory part of a given file path string (=everything before the last slash), at i-rate (csound 5.15 or higher).

Spath - full path name as string
Sdir - directory
****************************************************************************/
/****************************************************************************
SUpDir FilDirUp SCurDir
Returns the directory above the current directory

Returns the directory above the current directory.

SCurDir - current directory (with or without an ending slash)
SUpDir - directory above the current directory (returned without an ending slash)
****************************************************************************/
/****************************************************************************
Snam FilNam Spath
Returns the file name in a given path

Returns the file name (= everything after the last slash) in a given path.
Requires Csound 5.15 or higher.

Spath - full path name as string
Snam - name part
****************************************************************************/
/****************************************************************************
Suf FilSuf Spath [,ilow]
Returns the suffix of a filename or path, optional in lower case 

Returns the suffix (extension) of a filename or a full path, optional in lower case.

Spath - full pathname (or filename) as string
ilow - return ensuring lower case (1) or return as in Spath (0 = default)
****************************************************************************/
/****************************************************************************
Sout StrAgrm Sin [,iLen]
Changes the order of the characters in Sin randomly, like in an anagram.

Changes the order of the characters in Sin randomly, like in an anagram, and returns the result as new string.

Sin - input string 
iLen - length of Sin. If -1 (default), the length is calculated internally. 
Sout - output string
****************************************************************************/
/****************************************************************************
Sout StrAgrm Sin [,iLen]
Changes the order of the characters in Sin randomly, like in an anagram.

Changes the order of the characters in Sin randomly, like in an anagram, and returns the result as new string.

Sin - input string 
iLen - length of Sin. If -1 (default), the length is calculated internally. 
Sout - output string
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
iSumEls StrMems Str, Sel
Returns the number of occurencies of a string in another string.

Returns the number of occurencies of a string in another string.

Str - Input string
Sel - Another string which is asked to be a member of Str
iSumEls - Number of occurencies of Sel in Str
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
/****************************************************************************
Sout StripL Sin
Strips all initial spaces or tabs from a string.

Strips all spaces or tabs at the beginning of the input string Sin and returns the result as Sout.

Sin - Input string which may contain starting spaces or tabs.
Sout - Output string with removed initial spaces/tabs.
****************************************************************************/

  opcode StrMems, i, SS
Str, Sel   xin
iSumEls    =          0
iLen       strlen     Str
iIndx      =          0
Sub        strcpy     Str
  until iIndx == iLen do
iPos       strindex   Sub, Sel
   if iPos > -1 then
iSumEls    =          iSumEls+1
Sub        strsub     Sub, iPos+1
iIndx      =          iPos+1
   else
iIndx      =          iLen
   endif
  od
           xout       iSumEls
  endop

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

  opcode StrAgrm, S, Sj
Sin, iLen  xin
 if iLen == -1 then
iLen       strlen     Sin
 endif
Sout       =          ""
;for all elements in Sin
iCnt       =          0
iRange     =          iLen
loop:
;get one randomly
iRnd       rnd31      iRange-.0001, 0
iRnd       =          int(abs(iRnd))
Sel        strsub     Sin, iRnd, iRnd+1
Sout       strcat     Sout, Sel
;take it out from Sin
Ssub1      strsub     Sin, 0, iRnd
Ssub2      strsub     Sin, iRnd+1
Sin        strcat     Ssub1, Ssub2
;adapt range (new length)
iRange     =          iRange-1
           loop_lt    iCnt, 1, iLen, loop
           xout       Sout
  endop

  opcode StrAgrmk, S, S
  ;same at k-time
Sin  xin
kLen       strlenk    Sin
Sout       strcpyk    ""
Sin        strcpyk    Sin
;for all elements in Sin
kCnt       =          0
kRange     =          kLen
loop:
;get one randomly
kRnd       rnd31      kRange-.0001, 0
kRnd       =          int(abs(kRnd))
Sel        strsubk    Sin, kRnd, kRnd+1
Sout       strcatk    Sout, Sel
;take it out from Sin
Ssub1      strsubk    Sin, 0, kRnd
Ssub2      strsubk    Sin, kRnd+1, kLen
Sin        strcatk    Ssub1, Ssub2
;adapt range (new length)
kRange     =          kRange-1
           loop_lt    kCnt, 1, kLen, loop
           xout       Sout
  endop

  opcode StripL, S, S
  ;strips all tabs or spaces at the left from an input string
Source     xin
Sin        strcpy     Source
iLen       strlen     Sin
again:
Sel        strsub     Sin, 0, 1
iSpace     strcmp     Sel, " "
iTab       strcmp     Sel, "	"
 ;if space or tab, remove it and go back if not end of string
if iSpace == 0 || iTab == 0 then
Sin        strsub     Sin, 1
iLen       =          iLen-1
 if iLen != 0 igoto again
endif
           xout       Sin
  endop

  opcode FilDir, S, S
;returns the directory of a file path
Spath      xin
ipos      strrindex Spath, "/"
Sdir      strsub    Spath, 0, ipos
          xout      Sdir
  endop

  opcode FilDirUp, S, S
  ;returns the directory above the current directory
SCurDir    xin
;make sure the input does not end with '/'
ilen       strlen     SCurDir
ipos       strrindex  SCurDir, "/"
 if ipos == ilen-1 then
Sok        strsub     SCurDir, 0, ipos
 else	
Sok        strcpy     SCurDir
 endif
ipos       strrindex  Sok, "/"
SUpDir     strsub     Sok, 0, ipos
           xout       SUpDir
  endop

  opcode FilNam, S, S
;returns the name of a file path
Spath      xin
ipos      strrindex Spath, "/"
Snam      strsub    Spath, ipos+1
          xout      Snam
  endop

  opcode FilSuf, S, So
  ;returns the suffix of a filename or path, optional in lower case 
Spath,ilow xin
ipos      strrindex Spath, "."
Suf       strsub    Spath, ipos+1
 if ilow != 0 then
Suf       strlower  Suf 
 endif
          xout      Suf
  endop


