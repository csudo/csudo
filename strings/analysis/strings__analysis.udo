/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN strings/analysis:
*****************************************************************************
StrMems    : iSumEls StrMems Str, Sel
*****************************************************************************
****************************************************************************/

/****************************************************************************
iSumEls StrMems Str, Sel
Returns the number of occurencies of a string in another string.

Returns the number of occurencies of a string in another string.

Str - Input string
Sel - Another string which is asked to be a member of Str
iSumEls - Number of occurencies of Sel in Str
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


