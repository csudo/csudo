/****************************************************************************
ilen StrayLen Stray [, isep1 [, isep2]]
kLen StrayLen Stray [, isep1 [, isep2]]
Returns the length of an array-string

Returns the number of elements in Stray. Elements are defined by two seperators as ASCII coded characters: isep1 defaults to 32 (= space), isep2 defaults to 9 (= tab). If just one seperator is used, isep2 equals isep1.
written by joachim heintz

Stray - a string as array
isep1 - the first seperator (default=32: space)
isep2 - the second seperator (default=9: tab) 
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n -m0
</CsOptions>
<CsInstruments>

  opcode StrayLen, i, Sjj
Stray, isepA, isepB xin
 ;seperators
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
 ;initialize
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

  opcode StrayLen, k, Sjj
Stray, isepA, isepB xin
 ;define seperators
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
 ;initialize
klen      strlenk   Stray
kcount    =         0; number of elements
kwarsep   =         1
kndx      =         0
 if klen == 0 kgoto end ;don't go into the loop if String is empty
loop:
Snext     strsubk   Stray, kndx, kndx+1; next sign
ksep1p    strcmpk   Snext, Sep1; returns 0 if Snext is sep1
ksep2p    strcmpk   Snext, Sep2; 0 if Snext is sep2
 if ksep1p == 0 || ksep2p == 0 then; if sep1 or sep2
kwarsep   =         1; tell the log so
 else 				; if not 
  if kwarsep == 1 then	; and has been sep1 or sep2 before
kcount    =         kcount + 1; increase counter
kwarsep   =         0; and tell you are not sep1 nor sep2 
  endif 
 endif	
          loop_lt   kndx, 1, klen, loop 
end:      xout      kcount
  endop 



instr 1
ilen      StrayLen  {{these are "not" 5 elements -}}
          printf_i  "'%d'\n", 1, ilen
endin

instr 2
Stray     strget    p4
ipcnt     pcount
if ipcnt == 4 then
ilen      StrayLen  Stray
elseif ipcnt == 5 then
ilen      StrayLen  Stray, p5
elseif ipcnt == 6 then
ilen      StrayLen  Stray, p5, p6
endif		
          printf_i  "'%d'\n", 1, ilen
endin 

instr 3
kCnt init 1 ;count k-cycles
if kCnt == 1 then
 S1 strcpyk "Hello " ;i-rate
endif
kLen StrayLen S1
printf "k-cycle = %d\n  Stray = %s\n  StrayLen = %d\n", kCnt, kCnt, S1, kLen
S1 strcatk S1, "World " ;updated at k-rate
kCnt += 1
if kCnt > 3 then
 turnoff
endif
endin

</CsInstruments>
<CsScore>
i 1 0 0.01 
i 2 0.01 0.01 "seperation just, by commas" 44
i . + . "seperation by,commas,or  spaces" 44 32
i . + . " 	 that" !
i . + . "	thut "
i . + . "no thing but you"
i . + . ""
i . + . " "
i . + . "	"
i 3 .1 .1
</CsScore>
</CsoundSynthesizer>

returns:
'6'
'2'
'5'
'1'
'1'
'4'
'0'
'0'
'0'
k-cycle = 1
  Stray = Hello 
  StrayLen = 1
k-cycle = 2
  Stray = Hello World 
  StrayLen = 2
k-cycle = 3
  Stray = Hello World World 
  StrayLen = 3

