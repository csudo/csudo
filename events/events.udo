/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN events:
*****************************************************************************
live_loop  : REQUIREMENT: Csound 6.07 
*****************************************************************************
****************************************************************************/

/**********

REQUIREMENT: Csound 6.07 
(at least newer than from 11th March 2016)

DOCUMENTATION:

SPatternName: A unique name for pattern, after pattern is assigned to instrument, 
it can't be reassigned to another instrument.
Schedule: Empty string means the pattern is turned-off. Event calculation starts
at 0 and ends at but not including the value of iMeter. If equal or larger than the value
of iMeter, then a new bar is calculated. Since this is based on indexed array, the value
must be written linearly (example "0 1 2 3"). In case iMeter = 0, then the pattern length
is equal to the next integer of last (and the greatest) value.
SParameters: Is a string that operates on the p-fields for the events, there is
to say, all the p-fields except p2. For this UDO to work, the instrument must be defined
as name but not a number. For each parameter (not including p1 and p2) the numbers can be stored
inside square brackets, which for each event will iterate trough (i.e Loop).
iMeter: Optional and defaults to 4. Meter value of 0 indicates a pattern without
meter, or a pattern that loops from the last and greatest value of the Schedule string.
iBPM: Optinal and defaults to 120. Controls the tempo of the pattern, measured
in beats per minute.

live_loop SPatternName, Schedule, SParameters,[iMeter, iBPM]

**********/

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

opcode live_loop, 0, SSSoj
;Made by Hlöðver Sigurðsson 2016
SPatName, SPattern, SParameters, iTimeSignature, iBPM xin
  SPatName2 strcat SPatName, "_s"
  iTurnOff strcmp "", SPattern
  if iTurnOff == 0 goto donothing
  if iBPM <= 0 then
    iBPM = 120
  endif
  if iTimeSignature <= -1 then
    iTimeSignature = 4
  endif
  iActive active SPatName
  iActive_state active SPatName2
  iTrackID stringsum SPatName
  iPatSum  stringsum SPattern
  iParSum  stringsum SParameters
  iParCount paramcount SParameters
if giTrackStates[iTrackID][0] != iPatSum  || \
   giTrackStates[iTrackID][1] != iParSum  || \
   giTrackStates[iTrackID][2] != iTimeSignature || \
   giTrackStates[iTrackID][3] != iBPM then
  SConsoleLog sprintf "Pattern: %s was evaluated!\n", SPatName
  prints SConsoleLog
  SAlways, State StrToPar SPatName, SParameters, SPattern, iTimeSignature, iBPM
  iFailTest1 compilestr State
  if iFailTest1 != 0 then
    SConsoleLogFailEval sprintf "ERROR: FAILED TO EVALUATE PATTERN %s\n", SPatName 
    prints SConsoleLogFailEval
  endif
  if (iActive < 1) || (giTrackStates[iTrackID][4] != iParCount) then
    iFailTest2 compilestr SAlways
    if iFailTest2 != 0 then
      SConsoleLogStartFail sprintf "ERROR: FAILED TO START THE PATTERN %s\n", SPatName
      prints SConsoleLogStartFail
    endif
  endif
endif
  giTrackStates[iTrackID][0] = iPatSum
  giTrackStates[iTrackID][1] = iParSum
  giTrackStates[iTrackID][2] = iTimeSignature
  giTrackStates[iTrackID][3] = iBPM
  giTrackStates[iTrackID][4] = iParCount
  schedkwhen 1, 1, 1, SPatName2, 0, 1
donothing:
endop


