/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN strays:
*****************************************************************************
StrayElMem : ipos StrayElMem Stray, Stest [, isep1 [, isep2]]
StrayGetEl : Sel StrayGetEl Stray, ielindx [, isep1 [, isep2]]
StrayGetNum: inum StrayGetNum Stray, ielindx [, isep1 [, isep2]]
StrayLen   : ilen StrayLen Stray [, isep1 [, isep2]]
StrayNumLen: ilen StrayNumLen Stray [, isep1 [, isep2]]
StrayNumMem: itest StrayNumMem Stray, inum [, isep1 [, isep2]]
StrayNumSum: isum StrayNumSum Stray [, isep1 [, isep2]]]
StrayNumToFt: ift, iftlen StrayNumToFt Stray [, iftno [, isep1 [, isep2]]]
StrayRemDup: Srem StrayRemDup Stray [, isep1 [, isep2]]
StrayRev   : Srev StrayRev Stray [,isepA [, isepB [, isepOut]]]
StrayRndEl : Sel StrayRndEl Stray [, isep1 [, isep2]]
StraySetEl : Sres StraySetEl Stray, Sin [, ielindx [, isep1 [, isep2 [,isepOut]]]]
StraySetNum: Sres StraySetNum Stray, inum [, ielindx [, isep1 [, isep2 [,isepOut]]]]
StraySub   : Sub StraySub Stray [, istart [, iend [, isepA [, isepB [, isepOut]]]]]
*****************************************************************************
****************************************************************************/

/****************************************************************************
ipos StrayElMem Stray, Stest [, isep1 [, isep2]]
Tests whether a string is contained as an element in an array-string

Looks whether a string equals one of the elements in Stray. If yes, itest returns the position of the element, if no, -1. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). if just one seperator is used, isep2 equals isep1.
Requires Csound 5.15 or higher.

Stray - a string as array
Stest - a string to be looked for in Stray
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
ipos - if Stest has been found as element in Stray, the position (starting at 0) is returned. if Stest has not been found as a member of Stray, -1 is returned
****************************************************************************/
/****************************************************************************
Sel StrayGetEl Stray, ielindx [, isep1 [, isep2]]
Gets one element from a string-array

Returns (at i-rate) the element for ielindex in String, or an empty string, if the element has not been found. By default, the seperators between the elements are spaces and tabs. Others seperators can be defined by their ASCII code number.
Requires Csound 5.15 or higher

Input:
Stray - a string as array
ielindx - the index of the element (starting with 0)
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab)
If the defaults are not used and just isep1 is given, it's the only seperator. If you want two seperators (as in the dafault), you must give isep1 and isep2
Output:
Sel - the element at position ielindx, as a string. if the element has not been found, an empty string is returned
****************************************************************************/
/****************************************************************************
inum StrayGetNum Stray, ielindx [, isep1 [, isep2]]
Gets one number from a string-array

Returns the element with the position ielindex (starting from 0) in Stray. This element must be a number (the other elements can be strings or charcters). By default, the seperators between the elements are spaces and tabs. Others seperators can be defined by their ASCII code number.
If ielindx is out of range, or if the element is not a number, an error occurs

Input:
Stray - a string as array
ielindx - the index of the element (starting with 0)
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab)
If the defaults are not used and just isep1 is given, it's the only seperator. If you want two seperators (as in the dafault), you must give isep1 and isep2
Output:
inum - the number which is at the ielindx position of Stray
****************************************************************************/
/****************************************************************************
ilen StrayLen Stray [, isep1 [, isep2]]
Returns the length of an array-string

Returns the number of elements in Stray. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.

Stray - a string as array
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
****************************************************************************/
/****************************************************************************
ilen StrayNumLen Stray [, isep1 [, isep2]]
Returns the length of numerical elements in an array-string

Returns the number of numerical elements in Stray. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). if just one seperator is used, isep2 equals isep1.
Requires the UDOs StrayGetEl, StrayLen and StrNumP

Stray - a string as array
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
****************************************************************************/
/****************************************************************************
itest StrayNumMem Stray, inum [, isep1 [, isep2]]
Tests whether a number is a member of an array-string

Looks whether the number inum is a member of Stray. If yes, itest returns the position of inum in Stray, if no, -1. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
Requires the UDO StrNumP

Stray - a string as array
inum - the number which is being looked for
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
****************************************************************************/
/****************************************************************************
isum StrayNumSum Stray [, isep1 [, isep2]]]
Adds the elements in a numerical array-string

Adds all numbers in Stray (which must not contain non-numerical elements). Simple math expressions like +, -, *, /, ^ and % are allowed (no parentheses at the moment). Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
Requires the UDOs StrayLen and StrayGetEl.

Stray - a string as array
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
****************************************************************************/
/****************************************************************************
ift, iftlen StrayNumToFt Stray [, iftno [, isep1 [, isep2]]]
Converts a string-array which just consists of numbers or simple math expressions to a function table

Puts all numbers in Stray (which must not contain non-numerical elements) in a function table and returns its variable ift (which is produced by iftno, default=0) and the length of the elements written iftlen. (An empty string as input writes a function table of size=1 to avoid an error but returns 0 as length of elements written.) Simple binary math expressions using +, -, *, /, ^ and % are allowed, with just one parenthesis in total (see the examples below). 
Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
Requires csound 5.15 or higher, and the UDOs StrayLen and StrExpr (which itself requires the UDOs StrIsOp, StrLNoth, StrL_NvO, StrL_Prth, StrNxtOpL, StrExpr2, StrRmvST and StrExpr1).

Stray - a string as array
iftno - like in an ftgen statement: if 0 (which is also the default) an automatic number is generated by Csound; if any positive number, this is then the number of the function table
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
ift - the number of the function table which has been created
iftlen - the length of the elements written to the function table (usually this equals the length of the function table; just an empty string as input will create a function table of size=1 but with iftlen=0)
****************************************************************************/
/****************************************************************************
Srem StrayRemDup Stray [, isep1 [, isep2]]
Removes duplicates in an array-string

Removes duplicates in Stray and returns the result. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
Requires the UDOs StrayLen and StrayGetEl

Stray - a string as array
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
Srem - the resulting output string
****************************************************************************/
/****************************************************************************
Srev StrayRev Stray [,isepA [, isepB [, isepOut]]]
Reverses the elements of an array-string

Reverses the elements in Stray and returns the result. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1. The elements in the resulting string Sres are seperated by isepOut (default=isep1)
Requires Csound 5.16 or higher (new parser)

Stray - a string as array
isepA - the first seperator for the elements in Stray (default=32: space)
isepB - the second seperator for the elements in Stray (default=9: tab) 
isepOut - the seperator for the output string (default=isep1)
Srev - Stray with elements in reverse order
****************************************************************************/
/****************************************************************************
Sel StrayRndEl Stray [, isep1 [, isep2]]
Gets a random element from a string-array.

Returns a random element from a string-array.
Requires Csound 5.15 or higher and the UDOs StrayLen and StrayGetEl.

Input:
Stray - a string as array
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab)
If the defaults are not used and just isep1 is given, it's the only seperator. If you want two seperators (as in the dafault), you must give isep1 and isep2
Output:
Sel - the random element as a string
****************************************************************************/
/****************************************************************************
Sres StraySetEl Stray, Sin [, ielindx [, isep1 [, isep2 [,isepOut]]]]
Inserts an element in an array-string at a certain position

Puts the string Sin at the position ielindx (default=-1: at the end) of Stray, and returns the result as a string. Elements in the string are seperated by the two ascii-coded seperators isepA (default=32: space) and isepB (default=9: tab). If just isepA is given, it is also read as isepB. The new element is inserted using the seperator isepOut (default=isep1)
Requires Csound 5.16 or higher (new parser)

Stray - a string as array 
Sin - a string to be inserted 
ielindx - the element position in Stray at which the new element is to be inserted (starting with 0); the default -1 means append at the end of Stray
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
isepOut - the seperator for the insertion (default=isep1)
****************************************************************************/
/****************************************************************************
Sres StraySetNum Stray, inum [, ielindx [, isep1 [, isep2 [,isepOut]]]]
Inserts a number in an array-string at a certain position

Puts the number inum at the position ielindx (default=-1: at the end) of Stray, and returns the result as Sres. Elements in Stray are seperated by the two ascii-coded seperators isepA (default=32: space) and isepB (default=9: tab). if just isepA is given, it is also read as isepB. the element is inserted using the seperator isepOut (default=isep1)
Requires Csound 5.16 or higher, and the UDO FracLen.

Stray - a string as array
inum - the number to be inserted
ielindx - the element position in Stray at which the number is inserted (starting with 0); the default -1 means append at the end of Stray
istrout - a number for the strset opcode, denoting the resulting string (Stray with the insertion of the new element). the default is 1; as strset creates global numbers you should be careful in using this number
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab)
isepOut - the seperator for the insertion (default=isep1)
****************************************************************************/
/****************************************************************************
Sub StraySub Stray [, istart [, iend [, isepA [, isepB [, isepOut]]]]]
Returns a subset of elements in an array-string

Returns a subset of elements in Stray, from istart (included) to iend (excluded). The defaults are istart=0 (first element) and iend=-1 (end of string). Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
The resulting substring will use isepOut as seperator (default=isep1)
Requires Csound 5.16 or higher (new parser)

Stray - a string as array
istart - first element to extract (default=0)
iend - first element after selection (default=-1: end of string)
isep1 - first seperator for the elements in Stray (default=32: space)
isep2 - second seperator for the elements in Stray (default=9: tab) 
isepOut - seperator for the elements in the output string (default=isep1)
Sub - resulting subset of Stray
****************************************************************************/

  opcode StrayElMem, i, SSjj
;looks whether Stest is an element of Stray. returns the index of the element if found, and -1 if not.
Stray, Stest, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iout      =         -1 ;default output
iel       =         -1; actual number of element while searching
iwarleer  =         1; is this the start of a new element
indx      =         0 ;character index
inewel    =         0 ;new element to find
;;LOOP
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Schar     strsub    Stray, indx, indx+1; this character
isep1p    strcmp    Schar, Sep1; returns 0 if Schar is sep1
isep2p    strcmp    Schar, Sep2; 0 if Schar is sep2
is_sep    =         (isep1p == 0 || isep2p == 0 ? 1 : 0) ;1 if Schar is a seperator
 ;END OF STRING AND NO SEPARATORS BEFORE?
 if indx == ilen && iwarleer == 0 then
Sel       strsub    Stray, istartsel, -1
inewel    =         1
 ;FIRST CHARACTER OF AN ELEMENT?
 elseif is_sep == 0 && iwarleer == 1 then
istartsel =         indx ;if so, set startindex
iwarleer  =         0 ;reset info about previous separator 
iel       =         iel+1 ;increment element count
 ;FIRST SEPERATOR AFTER AN ELEMENT?
 elseif iwarleer == 0 && is_sep == 1 then
Sel       strsub    Stray, istartsel, indx ;get elment
inewel    =         1 ;tell about
iwarleer  =         1 ;reset info about previous separator
 endif
 ;CHECK THE ELEMENT
 if inewel == 1 then ;for each new element
icmp      strcmp    Sel, Stest ;check whether equals Stest
  ;terminate and return the position of the element if successful
  if icmp == 0 then
iout      =         iel
          igoto     end
  endif
 endif
inewel    =         0
          loop_le   indx, 1, ilen, loop 
end:
          xout      iout
  endop 

  opcode StrayGetEl, S, Sijj
;returns the element at position ielindx in Stray, or an empty string if the element has not been found
Stray, ielindx, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iendsel   =         -1; endindex for searched element
iel       =         0; actual number of element while searching
iwarleer  =         1
indx      =         0
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Snext     strsub    Stray, indx, indx+1; next sign
isep1p    strcmp    Snext, Sep1; returns 0 if Snext is sep1
isep2p    strcmp    Snext, Sep2; 0 if Snext is sep2
;;NEXT SIGN IS NOT SEP1 NOR SEP2
if isep1p != 0 && isep2p != 0 then
 if iwarleer == 1 then; first character after a seperator 
  if iel == ielindx then; if searched element index
istartsel =         indx; set it
iwarleer  =         0
  else 			;if not searched element index
iel       =         iel+1; increase it
iwarleer  =         0; log that it's not a seperator 
  endif 
 endif 
;;NEXT SIGN IS SEP1 OR SEP2
else 
 if istartsel > -1 then; if this is first selector after searched element
iendsel   =         indx; set iendsel
          igoto     end ;break
 else	
iwarleer  =         1
 endif 
endif
          loop_lt   indx, 1, ilen, loop 
end:
Sout      strsub    Stray, istartsel, iendsel
          xout      Sout
  endop 

  opcode StrayGetNum, i, Sijj
;returns ielindex in Stray. this element must be a number
Stray, ielindx, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iendsel   =         -1; endindex for searched element
iel       =         0; actual number of element while searching
iwarleer  =         1
indx      =         0
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Snext     strsub    Stray, indx, indx+1; next sign
isep1p    strcmp    Snext, Sep1; returns 0 if Snext is sep1
isep2p    strcmp    Snext, Sep2; 0 if Snext is sep2
;;NEXT SIGN IS NOT SEP1 NOR SEP2
if isep1p != 0 && isep2p != 0 then
 if iwarleer == 1 then; first character after a seperator 
  if iel == ielindx then; if searched element index
istartsel =         indx; set it
iwarleer  =         0
  else 			;if not searched element index
iel       =         iel+1; increase it
iwarleer  =         0; log that it's not a seperator 
  endif 
 endif 
;;NEXT SIGN IS SEP1 OR SEP2
else 
 if istartsel > -1 then; if this is first selector after searched element
iendsel   =         indx; set iendsel
          igoto     end ;break
 else	
iwarleer  =         1
 endif 
endif
          loop_lt   indx, 1, ilen, loop 
end: 		
Snum      strsub    Stray, istartsel, iendsel
inum      strtod    Snum
          xout      inum
  endop 

  opcode StrayLen, i, Sjj
;returns the number of elements in Stray. elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). if just one seperator is used, isep2 equals isep1
Stray, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
icount    =         0; number of elements
iwarsep   =         1
indx      =         0
 if ilen == 0 igoto end ;don't go into the loop if String is empty
loop:
Snext     strsub    Stray, indx, indx+1; next sign
isep1p    strcmp    Snext, Sep1; returns 0 if Snext is sep1
isep2p    strcmp    Snext, Sep2; 0 if Snext is sep2
 if isep1p == 0 || isep2p == 0 then; if sep1 or sep2
iwarsep   =         1; tell the log so
 else 				; if not 
  if iwarsep == 1 then	; and has been sep1 or sep2 before
icount    =         icount + 1; increase counter
iwarsep   =         0; and tell you are ot sep1 nor sep2 
  endif 
 endif	
          loop_lt   indx, 1, ilen, loop 
end:      xout      icount
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

  opcode StrayNumLen, i, Sjj
  ;requires the UDOs StrayGetEl, StrayLen and StrNumP
Stray, isepA, isepB xin
isep1      =          (isepA == -1 ? 32 : isepA)
isep2      =          (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
ilen       StrayLen   Stray, isep1, isep2
 if ilen == 0 igoto end ;don't go into the loop if there is nothing to do
icount     =          0; number of elements
indx       =          0
loop:
Snext      StrayGetEl Stray, indx, isep1, isep2
inump      StrNumP    Snext
 if inump == 1 then
icount     =          icount + 1
 endif
           loop_lt    indx, 1, ilen, loop
end:       xout       icount
  endop

  opcode StrayNumMem, i, Sijj
;looks whether inum is an element of Stray. returns the index of the element if found, and -1 if not.
Stray, inum, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iout      =         -1 ;default output
iel       =         -1; actual number of element while searching
iwarleer  =         1; is this the start of a new element
indx      =         0 ;character index
inewel    =         0 ;new element to find
;;LOOP
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Schar     strsub    Stray, indx, indx+1; this character
isep1p    strcmp    Schar, Sep1; returns 0 if Schar is sep1
isep2p    strcmp    Schar, Sep2; 0 if Schar is sep2
is_sep    =         (isep1p == 0 || isep2p == 0 ? 1 : 0) ;1 if Schar is a seperator
 ;END OF STRING AND NO SEPARATORS BEFORE?
 if indx == ilen && iwarleer == 0 then
Sel       strsub    Stray, istartsel, -1
inewel    =         1
 ;FIRST CHARACTER OF AN ELEMENT?
 elseif is_sep == 0 && iwarleer == 1 then
istartsel =         indx ;if so, set startindex
iwarleer  =         0 ;reset info about previous separator 
iel       =         iel+1 ;increment element count
 ;FIRST SEPERATOR AFTER AN ELEMENT?
 elseif iwarleer == 0 && is_sep == 1 then
Sel       strsub    Stray, istartsel, indx ;get element
inewel    =         1 ;tell about
iwarleer  =         1 ;reset info about previous separator
 endif
 ;CHECK THE ELEMENT
 if inewel == 1 then ;for each new element
inump     StrNumP   Sel ;check whether element is number
  if inump == 1 then
inumber   strtod    Sel ;if so, convert
   if inumber == inum then ;check if equals inum
iout      =         iel
          igoto     end ;if so, terminate
   endif
  endif
 endif
inewel    =         0
          loop_le   indx, 1, ilen, loop 
end:
          xout      iout
  endop 

  opcode StrayNumSum, i, Sjj
  ;requires the UDOs StrayLen and StrayGetEl
Stray, isepA, isepB xin
isep1      =          (isepA == -1 ? 32 : isepA)
isep2      =          (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1       sprintf    "%c", isep1
Sep2       sprintf    "%c", isep2
isumtot    =          0
ilen       StrayLen   Stray, isep1, isep2
if ilen == 0 igoto end
indx       =          0
loop:
Snum       StrayGetEl Stray, indx, isep1, isep2
;test if Snum is an math expression
isum       strindex   Snum, "+"; sum
idif       strindex   Snum, "-"; difference
ipro       strindex   Snum, "*"; product
irat       strindex   Snum, "/"; ratio
ipow       strindex   Snum, "^"; power
imod       strindex   Snum, "%"; modulo
 if ipow > -1 then
ifirst     strindex   Snum, "^"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
iratio     strindex   S2, "/"
ifirst     strtod     S1
  if iratio == -1 then
isec       strtod     S2
           else
Snumer     strsub     S2, 0, iratio
Sdenom     strsub     S2, iratio+1
inumer     strtod     Snumer
idenom     strtod     Sdenom
isec       =          inumer / idenom
  endif
inum       =          ifirst ^ isec
 elseif imod > -1 then
ifirst     strindex   Snum, "%"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst % isec
 elseif ipro > -1 then
ifirst     strindex   Snum, "*"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst * isec
 elseif irat > -1 then
ifirst     strindex   Snum, "/"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst / isec
 elseif isum > -1 then
ifirst     strindex   Snum, "+"
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst + isec
 elseif idif > -1 then
ifirst     strrindex  Snum, "-";(last occurrence: -3-4 is possible, but not 3--4)
S1         strsub     Snum, 0, ifirst
S2         strsub     Snum, ifirst+1
ifirst     strtod     S1
isec       strtod     S2
inum       =          ifirst - isec
           else
inum       strtod     Snum
 endif
isumtot    =          isumtot + inum
           loop_lt    indx, 1, ilen, loop
end:       xout       isumtot
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

  opcode StrayNumToFt, ii, Sojj
  ;requires the UDOs StrayLen and StrExpr (which itself requires others)
Stray, iftno, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;CREATE A FUNCTION TABLE
iftlen    StrayLen  Stray, isep1, isep2
 if iftlen == 0 then
          prints    "WARNING! StrayNumToFt got empty string as input. Function table with length=1 created, but iftlen=0 returned.\n"
iftl      =         1
 else
iftl      =         iftlen
 endif
ift       ftgen     iftno, 0, -iftl, -2, 0 
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iel       =         -1; number of element in Stray and ift
iwarleer  =         1; is this the start of a new element
indx      =         0 ;character index
inewel    =         0 ;new element to find
;;LOOP
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Schar     strsub    Stray, indx, indx+1; this character
isep1p    strcmp    Schar, Sep1; returns 0 if Schar is sep1
isep2p    strcmp    Schar, Sep2; 0 if Schar is sep2
is_sep    =         (isep1p == 0 || isep2p == 0 ? 1 : 0) ;1 if Schar is a seperator
 ;END OF STRING AND NO SEPARATORS BEFORE?
 if indx == ilen && iwarleer == 0 then
Sel       strsub    Stray, istartsel, -1
inewel    =         1
 ;FIRST CHARACTER OF AN ELEMENT?
 elseif is_sep == 0 && iwarleer == 1 then
istartsel =         indx ;if so, set startindex
iwarleer  =         0 ;reset info about previous separator 
iel       =         iel+1 ;increment element count
 ;FIRST SEPERATOR AFTER AN ELEMENT?
 elseif iwarleer == 0 && is_sep == 1 then
Sel       strsub    Stray, istartsel, indx ;get element
inewel    =         1 ;tell about
iwarleer  =         1 ;reset info about previous separator
 endif
 ;WRITE THE ELEMENT TO THE TABLE
 if inewel == 1 then
inum      StrExpr   Sel ;convert expression to number
          tabw_i    inum, iel, ift ;write to ift
 endif
inewel    =         0
          loop_le   indx, 1, ilen, loop 
end:
          xout      ift, iftlen
  endop 

  opcode StrayRemDup, S, Sjj
;removes duplicates in Stray and returns the result. elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). if just one seperator is used, isep2 equals isep1.
;requires the UDOs StrayLen and StrayGetEl
Stray, isepA, isepB xin
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
ilen1     StrayLen  Stray, isep1, isep2
Sres      =         ""
if ilen1 == 0 igoto end1 
indx1     =         0
loop1:
Sel       StrayGetEl Stray, indx1, isep1, isep2; get element
ires      =         0
ilen      StrayLen  Sres, isep1, isep2; length of Sres
if ilen == 0 igoto end 
indx      =         0
loop:	;iterate over length of Sres
Snext     StrayGetEl Sres, indx, isep1, isep2
icomp     strcmp    Snext, Sel
 if icomp == 0 then
ires      =         1
          igoto     end 
 endif
          loop_lt   indx, 1, ilen, loop 
end:		
 if ires == 0 then ;if element is not already in Sres, append
Sdran     sprintf   "%s%s", Sep1, Sel
Sres      strcat    Sres, Sdran
 endif

          loop_lt	indx1, 1, ilen1, loop1 
end1:		
Sout      strsub    Sres, 1; remove starting sep1
          xout      Sout
  endop 

  opcode StrayRev, S, Sjjj
;reverses the elements in Stray and returns the result. elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). if just one seperator is used, isep2 equals isep1. the elements in the resulting string Sres are seperated by isepOut (default=isep1)
Stray, isepA, isepB, isepOut xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
isepOut   =         (isepOut == -1 ? isep1 : isepOut)
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
Sres      =         ""
ilen      strlen    Stray
istartsel =         -1; startindex for searched element
iwarleer  =         1; is this the start of a new element
indx      =         0 ;character index
inewel    =         0 ;new element to find
;;LOOP
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Schar     strsub    Stray, indx, indx+1; this character
isep1p    strcmp    Schar, Sep1; returns 0 if Schar is sep1
isep2p    strcmp    Schar, Sep2; 0 if Schar is sep2
is_sep    =         (isep1p == 0 || isep2p == 0 ? 1 : 0) ;1 if Schar is a seperator
 ;END OF STRING AND NO SEPARATORS BEFORE?
 if indx == ilen && iwarleer == 0 then
Sel       strsub    Stray, istartsel, -1
inewel    =         1
 ;FIRST CHARACTER OF AN ELEMENT?
 elseif is_sep == 0 && iwarleer == 1 then
istartsel =         indx ;if so, set startindex
iwarleer  =         0 ;reset info about previous separator 
 ;FIRST SEPERATOR AFTER AN ELEMENT?
 elseif iwarleer == 0 && is_sep == 1 then
Sel       strsub    Stray, istartsel, indx ;get elment
inewel    =         1 ;tell about
iwarleer  =         1 ;reset info about previous separator
 endif
 ;PREPEND THE ELEMENT TO THE RESULT
 if inewel == 1 then ;for each new element
Selsep    sprintf   "%c%s", isepOut, Sel ;prepend seperator
Sres      strcat    Selsep, Sres ;prepend to result
 endif
inewel    =         0
          loop_le   indx, 1, ilen, loop 
end:
Sout      strsub    Sres, 1; remove starting seperator
          xout      Sout
  endop 

  opcode StrayRndEl, S, Sjj
Stray, isepA, isepB xin
iLen       StrayLen   Stray, isepA, isepB
iElIndx    rnd31      iLen, 0
Sel        StrayGetEl Stray, abs(int(iElIndx)), isepA, isepB
           xout       Sel
  endop

  opcode StraySetEl, S, SSjjjj
;puts the string Sin at the position ielindx (default=-1: at the end) of Stray, and returns the result as a string. elements in the string are seperated by the two ascii-coded seperators isepA (default=32: space) and isepB (default=9: tab). if just isepA is given, it is also read as isepB. the element is inserted using the seperator isepOut (default=isep1)
Stray, Sin, ielindx, isepA, isepB, isepOut xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
isepOut   =         (isepOut == -1 ? isep1 : isepOut)
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
SepOut    sprintf   "%c", isepOut
;;INITIALIZE SOME PARAMETERS
ilen      strlen    Stray
iel       =         0; actual element position
iwarsep   =         1
indx      =         0
;;APPEND Sin IF ielindx=-1
 if ielindx == -1 then
Sres      sprintf   "%s%s%s", Stray, SepOut, Sin
          igoto     end	
 endif
;;PREPEND Sin IF ielindx=0
 if ielindx == 0 then
Sres      sprintf   "%s%s%s", Sin, SepOut, Stray
          igoto     end	
  endif
loop:
Snext     strsub    Stray, indx, indx+1; next sign
isep1p    strcmp    Snext, Sep1; returns 0 if Snext is sep1
isep2p    strcmp    Snext, Sep2; 0 if Snext is sep2
;;NEXT SIGN IS NOT SEP1 NOR SEP2
if isep1p != 0 && isep2p != 0 then
 if iwarsep == 1 then; first character after a seperator 
  if iel == ielindx then; if searched element index
S1        strsub    Stray, 0, indx; string before Sin
S2        strsub    Stray, indx, -1; string after Sin
Sres      sprintf   "%s%s%s%s", S1, Sin, SepOut, S2
          igoto     end
  else 			;if not searched element index
iel       =         iel+1; increase it
iwarsep   =         0; log that it's not a seperator 
  endif 
 endif 
;;NEXT SIGN IS SEP1 OR SEP2
else 
iwarsep   =         1
endif
          loop_lt   indx, 1, ilen, loop 
;;APPEND Sin IF ielindx is >= number of elements
Sres      sprintf   "%s%s%s", Stray, SepOut, Sin
end:      xout      Sres
  endop 

  opcode FracLen, i, io
;returns the number of digits in the fractional part of inum (0=integer)
inum, ifracs xin
ifac      =         10^ifracs
if int(inum*ifac) == inum*ifac then
          igoto     end
else
ifracs    FracLen   inum, ifracs+1
endif
end:      xout      ifracs
  endop

  opcode StraySetNum, S, Sijjjj
  ;requires the UDO FracLen
Stray, inum, ielindx, isepA, isepB, isepOut xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
isepOut   =         (isepOut == -1 ? isep1 : isepOut)
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
SepOut    sprintf   "%c", isepOut
;;INITIALIZE SOME PARAMETERS
ifracs    FracLen   inum
ilen      strlen    Stray
iel       =         0; actual element position
iwarsep   =         1
indx      =         0
;;APPEND inum IF ielindx=-1
 if ielindx == -1 then
Sformat   sprintf   "%%s%%s%%.%df", ifracs
Sres      sprintf   Sformat, Stray, SepOut, inum
          igoto     end	
 endif
;;PREPEND inum IF ielindx=0
 if ielindx == 0 then
Sformat   sprintf   "%%.%df%%s%%s", ifracs
Sres      sprintf   Sformat, inum, SepOut, Stray
          igoto     end	
  endif
loop:
Snext     strsub    Stray, indx, indx+1; next sign
isep1p    strcmp    Snext, Sep1; returns 0 if Snext is sep1
isep2p    strcmp    Snext, Sep2; 0 if Snext is sep2
;;NEXT SIGN IS NOT SEP1 NOR SEP2
if isep1p != 0 && isep2p != 0 then
 if iwarsep == 1 then; first character after a seperator 
  if iel == ielindx then; if searched element index
S1        strsub    Stray, 0, indx; string before Sin
S2        strsub    Stray, indx, -1; string after Sin
Sformat   sprintf   "%%s%%.%df%%s%%s", ifracs
Sres      sprintf   Sformat, S1, inum, SepOut, S2
          igoto     end
  else              ;if not searched element index
iel       =         iel+1; increase it
iwarsep   =         0; log that it's not a seperator 
  endif 
 endif 
;;NEXT SIGN IS SEP1 OR SEP2
else 
iwarsep   =         1
endif
          loop_lt   indx, 1, ilen, loop 
;;APPEND inum IF ielindx IS >= NUMBER OF ELEMENTS
Sformat   sprintf   "%%s%%s%%.%df", ifracs
Sres      sprintf   Sformat, Stray, SepOut, inum
end:		xout      Sres
  endop 

  opcode StraySub, S, Sojjjj
;returns a subset of elements in Stray. elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). if just one seperator is used, isep2 equals isep1.
Stray, istart, iend, isepA, isepB, isepOut xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
isepOut   =         (isepOut == -1 ? 32 : isepOut)
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
Sres      =         ""
ilen      strlen    Stray
iend      =         (iend == -1 ? ilen : iend) ;for simplifying tests later
istartsel =         -1; startindex for any element
iel       =         -1; actual number of element while searching
iwarleer  =         1; is this the start of a new element
indx      =         0 ;character index
inewel    =         0 ;new element to find
;;LOOP
 if ilen == 0 igoto end ;don't go into the loop if Stray is empty
loop:
Schar     strsub    Stray, indx, indx+1; this character
isep1p    strcmp    Schar, Sep1; returns 0 if Schar is sep1
isep2p    strcmp    Schar, Sep2; 0 if Schar is sep2
is_sep    =         (isep1p == 0 || isep2p == 0 ? 1 : 0) ;1 if Schar is a seperator
 ;END OF STRING AND NO SEPARATORS BEFORE?
 if indx == ilen && iwarleer == 0 then
Sel       strsub    Stray, istartsel, -1
inewel    =         1
 ;FIRST CHARACTER OF AN ELEMENT?
 elseif is_sep == 0 && iwarleer == 1 then
istartsel =         indx ;if so, set startindex
iwarleer  =         0 ;reset info about previous separator 
iel       =         iel+1 ;increment element count
 ;FIRST SEPERATOR AFTER AN ELEMENT?
 elseif iwarleer == 0 && is_sep == 1 then
Sel       strsub    Stray, istartsel, indx ;get elment
inewel    =         1 ;tell about
iwarleer  =         1 ;reset info about previous separator
 endif
 ;APPEND THE ELEMENT TO THE RESULT IF IN RANGE
 if inewel == 1 && iel >= istart && iel < iend then ;for each new element in range
Selsep    sprintf   "%c%s", isepOut, Sel ;prepend seperator
Sres      strcat    Sres, Selsep ;append to result
 endif
inewel    =         0
          loop_le   indx, 1, ilen, loop 
end:
Sout      strsub    Sres, 1; remove starting seperator
          xout      Sout
  endop 


