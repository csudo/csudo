/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN strings/analysis:
*****************************************************************************
StrIsEmpty : iTrue StrIsEmpty Str, iStrt, iEnd
StrIsOp    : iOp StrIsOp Str, iPos
StrLNoth   : iTrue StrLNoth Str, iMin, iPos
StrL_NvO   : iTrue StrL_NvO Str, iMin, iPos
StrL_Prth  : iPrPos StrL_Prth Str, iMin, iPos
StrMems    : iSumEls StrMems Str, Sel
StrNxtOpL  : iOpPos, iOp StrNxtOpL Str, iMinPos, iPos
StrTrmPos  : iStrtOut, iEndOut StrTrmPos Str, iStrtIn, iEndIn
*****************************************************************************
****************************************************************************/

/****************************************************************************
iTrue StrIsEmpty Str, iStrt, iEnd
Returns 1 if the positions >= istrt and <= iend are nothing but spaces or tabs.

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

Str - input string
iPos - position (index) to read in Str (default = 0)
iOp - 1-6 for operators '+ - * / % ^', 0 for anything else
****************************************************************************/
/****************************************************************************
iTrue StrLNoth Str, iMin, iPos

Looks whether left of iPos >= iMin is nothing but spaces or tabs. Returns 1 
if true, 0 if false.

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

Str - input string
iPos - position (index) in Str. the UDO will look "left to" this position
iMin - minimum position (index) which is regarded for left search
iTrue - 1 = true, 0 = false
****************************************************************************/
/****************************************************************************
iPrPos StrL_Prth Str, iMin, iPos

Looks for the next corresponding opening parenthesis < iPos and >= iMin.

Str - input string
iPos - position (index) in Str. the UDO will look "left to" this position.
       the default is -1 which means the end of the input string.
iMin - minimum position (index) which is regarded for left search (default 0)
iPrPos - position (index) of next opening parenthesis (-1 if none)
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
iOpPos, iOp StrNxtOpL Str, iMinPos, iPos

Returns position and type of next operator < iPos and >= iMin. Anything inside 
Parentheses will be disregarded.

Requires the UDO StrIsOp.

Str - input string
iPos - position (index) in Str. the UDO will look "left to" this position
iMin - minimum position (index) which is regarded for left search
iOpPos - position of operator
iOp - type of operator: 1-6 for operators '+ - * / % ^', 0 for anything else
****************************************************************************/
/****************************************************************************
iStrtOut, iEndOut StrTrmPos Str, iStrtIn, iEndIn
Returns the next position >= iStrtIn and <= iEndIn without possible starting 
and/or ending spaces or tabs.

Str - input string
iStrtIn - first index to read in Str (default = 0)
iEndIn - last index to read in Str (default = -1 which means end of the string)
iStrtOut - first index to read when starting spaces or tabs are omitted
iEndOut - last index to read when ending spaces or tabs are omitted
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


