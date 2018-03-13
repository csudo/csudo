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
StrExpr    : iNum StrExpr Str [, iStrt [, iEnd]]
StrExpr1   : iNum StrExpr1 Str, iStrt, iEnd
StrExpr2   : iNum StrExpr2 iNum1, iNum2, iOp
StrIsEmpty : iTrue StrIsEmpty Str, iStrt, iEnd
StrIsOp    : iOp StrIsOp Str, iPos
StrLNoth   : iTrue StrLNoth Str, iMin, iPos
StrL_NvO   : iTrue StrL_NvO Str, iMin, iPos
StrL_Prth  : iPrPos StrL_Prth Str, iMin, iPos
StrLineBreak: Sres StrLineBreak String, iNum
StrMems    : iSumEls StrMems Str, Sel
StrNumP    : itest StrNumP String
StrNxtOpL  : iOpPos, iOp StrNxtOpL Str, iMinPos, iPos
StrRmvST   : Sout StrRmvST Sin, iStrt, iEnd
StrSum     : iSum StrSum Sin
StrToArr   : S_Arr[], iLen StrToArr S_in, S_sep
StrToAscS  : Sout StrToAscS Sin
StrTrmPos  : iStrtOut, iEndOut StrTrmPos Str, iStrtIn, iEndIn
StripL     : Sout StripL Sin
*****************************************************************************
****************************************************************************/

/****************************************************************************
Sdir FilDir Spath
Returns the directory in a given path

Returns the directory part of a given file path string (=everything before the last slash), at i-rate (csound 5.15 or higher).
written by joachim heintz

Spath - full path name as string
Sdir - directory
****************************************************************************/
/****************************************************************************
SUpDir FilDirUp SCurDir
Returns the directory above the current directory

Returns the directory above the current directory.
written by joachim heintz

SCurDir - current directory (with or without an ending slash)
SUpDir - directory above the current directory (returned without an ending slash)
****************************************************************************/
/****************************************************************************
Snam FilNam Spath
Returns the file name in a given path

Returns the file name (= everything after the last slash) in a given path.
Requires Csound 5.15 or higher.
written by joachim heintz

Spath - full path name as string
Snam - name part
****************************************************************************/
/****************************************************************************
Suf FilSuf Spath [,ilow]
Returns the suffix of a filename or path, optional in lower case 

Returns the suffix (extension) of a filename or a full path, optional in lower case.
written by joachim heintz

Spath - full pathname (or filename) as string
ilow - return ensuring lower case (1) or return as in Spath (0 = default)
****************************************************************************/
/****************************************************************************
Sout StrAgrm Sin [,iLen]
Changes the order of the characters in Sin randomly, like in an anagram.

Changes the order of the characters in Sin randomly, like in an anagram, and returns the result as new string.
written by joachim heintz

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
iNum StrExpr Str [, iStrt [, iEnd]]
Converts a string expression to a number. Requires the UDOs StrIsOp, StrLNoth, StrL_NvO, StrL_Prth, StrNxtOpL, StrExpr2, StrRmvST and StrExpr1.

Converts a string expression to a number. Requires the UDOs StrIsOp, StrLNoth, StrL_NvO, StrL_Prth, StrNxtOpL, StrExpr2, StrRmvST and StrExpr1. Spaces (or tabs) are allowed. Supported math operations are +, -, *, /, % and ^. The precedence of bindings is as usual (^ is stronger than *%/ than +-).
written by joachim heintz

Str - input string with a math expression.
iStrt - first index to read in Str (default = 0)
iEnd - last index to read in Str (default = -1 which means end of the string)
iNum - result of the math expression as number
****************************************************************************/
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
/****************************************************************************
iNum StrExpr2 iNum1, iNum2, iOp

Evaluates two numbers which are combined by the operator iOp.
written by joachim heintz

iNum1, iNum2 - numbers
iOp - 1 -> +, 2 -> -, 3 -> *, 4 -> /, 5 -> %, 6 -> ^
iNum - Result as number
****************************************************************************/
/****************************************************************************
iTrue StrIsEmpty Str, iStrt, iEnd
Returns 1 if the positions >= istrt and <= iend are nothing but spaces or tabs.
written by joachim heintz

Str - input string
iStrt - first index (position) to be considered in Str (default = 0)
iEnd - last index to be considered in Str (defualt = -1 = end of string)
iTrue - 1 if true (Str >= istrt and <= iend has only spaces or tabs), 0 else
****************************************************************************/
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
/****************************************************************************
iTrue StrLNoth Str, iMin, iPos

Looks whether left of iPos >= iMin is nothing but spaces or tabs. Returns 1 
if true, 0 if false.
written by joachim heintz

Str - input string
iPos - position (index) in Str. the UDO will look "left to" this position
iMin - minimum position (index) which is regarded for left search
iTrue - 1 = true, 0 = false
****************************************************************************/
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
/****************************************************************************
iPrPos StrL_Prth Str, iMin, iPos

Looks for the next corresponding opening parenthesis < iPos and >= iMin.
written by joachim heintz

Str - input string
iPos - position (index) in Str. the UDO will look "left to" this position.
       the default is -1 which means the end of the input string.
iMin - minimum position (index) which is regarded for left search (default 0)
iPrPos - position (index) of next opening parenthesis (-1 if none)
****************************************************************************/
/****************************************************************************
Sres StrLineBreak String, iNum

Inserts line breaks after iNum characters in the input string.
written by joachim heintz

Sin - Input string which may contain starting spaces or tabs.
Sout - Output string with removed initial spaces/tabs.
****************************************************************************/
/****************************************************************************
iSumEls StrMems Str, Sel
Returns the number of occurencies of a string in another string.

Returns the number of occurencies of a string in another string.
written by joachim heintz

Str - Input string
Sel - Another string which is asked to be a member of Str
iSumEls - Number of occurencies of Sel in Str
****************************************************************************/
/****************************************************************************
itest StrNumP String
Tests whether a string is a numerical string

Tests whether a string is a numerical string ("1" or "1.23435" but not "1a"). Returns 1 for "yes" and 0 for "no". If "yes", the string can be converted to a number by the opcode strtod.
written by joachim heintz

String - any string
itest - 1 if String is a numerical string, 0 if not
****************************************************************************/
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
/****************************************************************************
Sout StrRmvST Sin, iStrt, iEnd
Removes all spaces or tabs from iStrt to iEnd (both included)

Removes all spaces or tabs in input string Sin from iStrt to iEnd and returns the result as Sout.
written by joachim heintz

Sin - Input string which may contain starting spaces or tabs.
iStrt - First index (position) to consider in Sin (default = 0)
iEnd - Last indes to consider in Sin (default = -1 = end of string)
Sout - Output string with removed initial spaces/tabs.
****************************************************************************/
/****************************************************************************
iSum StrSum Sin
Returns the sum of all ASCII values in Sin
written by Hlödver Sigurdsson and joachim heintz

Sin - input string
iSum - sum of all ASCII numbers for the elements in Sin
****************************************************************************/
/****************************************************************************
S_Arr[], iLen StrToArr S_in, S_sep
Transforms the sections of the input string S_in to elements of a string array. The sections in S_in are seperated by the seperator S_in. 
written by joachim heintz

S_in - Input string.
S_sep - Seperator string.
S_Arr - Output string array.
iLen - Its length.
****************************************************************************/
/****************************************************************************
Sout StrToAscS Sin
Returns the ASCII numbers of the input string as string.

Returns the ASCII numbers of the input string as string. The integers in the output string are seperated by one space.
written by joachim heintz

Sin - Input string with any sequence of characters or numbers.
Sout - Output string containing the ASCII numbers of all characters, seperated by spaces.
****************************************************************************/
/****************************************************************************
iStrtOut, iEndOut StrTrmPos Str, iStrtIn, iEndIn
Returns the next position >= iStrtIn and <= iEndIn without possible starting 
and/or ending spaces or tabs.
written by joachim heintz

Str - input string
iStrtIn - first index to read in Str (default = 0)
iEndIn - last index to read in Str (default = -1 which means end of the string)
iStrtOut - first index to read when starting spaces or tabs are omitted
iEndOut - last index to read when ending spaces or tabs are omitted
****************************************************************************/
/****************************************************************************
Sout StripL Sin
Strips all initial spaces or tabs from a string.

Strips all spaces or tabs at the beginning of the input string Sin and returns the result as Sout.
written by joachim heintz

Sin - Input string which may contain starting spaces or tabs.
Sout - Output string with removed initial spaces/tabs.
****************************************************************************/

  opcode StrIsEmpty, i, Soj
Str, istrt, iend xin
iend = iend == -1 ? strlen(Str) - 1 : iend
iTrue = 1
until iTrue == 0 || istrt > iend do
 if strchar(Str, istrt) != 32 && strchar(Str, istrt) != 9 then
  iTrue = 0
 endif
istrt += 1
enduntil
xout iTrue
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

  opcode StrSum, i, S
Sin xin 
iPos, iSum init 0
while iPos < strlen(Sin) do
 iSum+= strchar(Sin, iPos)
 iPos += 1
od
   xout iSum
  endop

  opcode StrTrmPos, ii, Soj
Str, istrt, iend xin
iend = iend == -1 ? strlen(Str) - 1 : iend
;left trim
until strchar(Str, istrt) != 32 && strchar(Str, istrt) != 9 || istrt == iend do
istrt += 1
enduntil
;right trim
until strchar(Str, iend) != 32 && strchar(Str, iend) != 9 || iend == istrt do
iend -= 1
enduntil
xout istrt, iend
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

  opcode StrRmvST, S, Soj
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

opcode StrToArr, S[]i, SS

 S_in, S_sep xin 

 ;count the number of substrings
 iLenSep strlen S_sep
 iPos = 0
 iPosShift = 0
 iCnt = 0

 while iPos != -1 do
 
  iCnt += 1
  S_sub strsub S_in, iPosShift
  iPos strindex S_sub, S_sep
  iPosShift += iPos+iLenSep
  
 od
 
 ;create a string array and put the substrings in it
 S_Arr[] init iCnt
 iPos = 0
 iPosShift = 0
 iArrIndx = -1
 while iPos != -1 do
 
  iArrIndx += 1
  S_sub strsub S_in, iPosShift
  iPos strindex S_sub, S_sep
  iEnd = (iPos == -1 ? -1 : iPosShift+iPos)
  S_ToArr strsub S_in, iPosShift, iEnd
  iPosShift += iPos+iLenSep
  S_Arr[iArrIndx] = S_ToArr  
 
 od
 
 xout S_Arr, iCnt

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

  opcode StrLineBreak, S, Si
String, iNum xin
Sres    =        ""
loop:
ilen    strlen   String
 if ilen > iNum then
S1      strsub   String, 0, iNum
Sres    strcat   Sres, S1
Sres    strcat   Sres, "\n"
String  strsub   String, iNum
        igoto    loop
        else
Sres    strcat   Sres, String
 endif
        xout     Sres
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


