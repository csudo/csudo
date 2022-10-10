/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN strings/modify:
*****************************************************************************
StrAgrm    : Sout StrAgrm Sin [,iLen]
StrAgrmk   : Sout StrAgrmk Sin [,iLen]
StrLineBreak: Sres StrLineBreak String, iNum
StrRmvST   : Sout StrRmvST Sin, iStrt, iEnd
StripL     : Sout StripL Sin
*****************************************************************************
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
Sout StrAgrmk Sin [,iLen]
Changes the order of the characters in Sin randomly, like in an anagram.

Changes the order of the characters in Sin randomly, like in an anagram, and returns the result as new string.

Sin - input string  
Sout - output string
****************************************************************************/
/****************************************************************************
Sres StrLineBreak String, iNum

Inserts line breaks after iNum characters in the input string.
written by joachim heintz

Sin - Input string which may contain starting spaces or tabs.
Sout - Output string with removed initial spaces/tabs.
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
Sout StripL Sin
Strips all initial spaces or tabs from a string.

Strips all spaces or tabs at the beginning of the input string Sin and returns the result as Sout.
written by joachim heintz

Sin - Input string which may contain starting spaces or tabs.
Sout - Output string with removed initial spaces/tabs.
****************************************************************************/

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


