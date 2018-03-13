/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN events:
*****************************************************************************
EvtLvLp    : EvtLvLp SPatternName, Schedule, SParameters, iTrackStates[][] [iMeter, iBPM]
EvtPtrnz   : kTrig, kOffTrig, kIndx EvtPtrnz kTime, kBPM, SPat
EvtS2P     : SAlways, State EvtS2P SPatName, SPar, SPattern, iTimeSignature, iBPM
*****************************************************************************
****************************************************************************/

/**********
EvtLvLp SPatternName, Schedule, SParameters, iTrackStates[][] [iMeter, iBPM]
A sequencer that emits events for live evaluation.
Requires the UDOs EvtPtrnz, StrayLen, StrNumP, StrayElCnt, StrSum
written by Hlödver Sigurdsson

SPatternName - A unique name for pattern, after pattern is assigned to instrument, 
  it can't be reassigned to another instrument.
Schedule - Empty string means the pattern is turned-off. Event calculation starts
  at 0 and ends at but not including the value of iMeter. If equal or larger than the value
  of iMeter, then a new bar is calculated. Since this is based on indexed array, the value
  must be written linearly (example "0 1 2 3"). In case iMeter = 0, then the pattern length
  is equal to the next integer of last (and the greatest) value.
SParameters - Is a string that operates on the p-fields for the events, there is
  to say, all the p-fields except p2. For this UDO to work, the instrument must be defined
  as name but not a number. For each parameter (not including p1 and p2) the numbers can be stored
  inside square brackets, which for each event will iterate trough (i.e Loop).
iTrackStates[][] - 2dim array
iMeter - Optional and defaults to 4. Meter value of 0 indicates a pattern without
  meter, or a pattern that loops from the last and greatest value of the Schedule string.
iBPM - Optinal and defaults to 120. Controls the tempo of the pattern, measured
  in beats per minute.

**********/
/****************************************************************************
kTrig, kOffTrig, kIndx EvtPtrnz kTime, kBPM, SPat
A simple sequencer based on numeric string that returns triggers for events along with index.

Requires Csound 6.07 or higher
Requires the UDOs StrayLen and StrayGetNum
written by Hlöðver Sigurðsson

Input:
kTime - a number representing the length of musical bar
kBPM  - the tempo of 1 integer represented as beats per minute 
sPat  - a string containing numbers on which an event is emitted, seperated by whitespaces
Output:
kTrig - a trigger where 1 represents an event and 0 for no events
kOffTrig - an event triggered after end of each note, ideally for noteoff events
kIndx - a 0 based index of the event that is being triggered
****************************************************************************/
/**********
SAlways, State EvtS2P SPatName, SPar, SPattern, iTimeSignature, iBPM

written by Hlödver Sigurdsson

**********/

  opcode StrSum, i, S
Sin xin 
iPos, iSum init 0
while iPos < strlen(Sin) do
 iSum+= strchar(Sin, iPos)
 iPos += 1
od
   xout iSum
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

opcode StrayElCnt, i, Sjjjj
  Sin, iElOpn, iElCls, iSep1, iSep2 xin
  iElOpn = (iElOpn == -1 ? 91 : iElOpn) ; Defaults to [
  iElCls = (iElCls == -1 ? 93 : iElCls) ; Defaults to ]
  iSep1  = (iSep1  == -1 ? 32 : iSep1)  ; Defaults to Whitespace
  iSep2  = (iSep2  == -1 ? 44 : iSep2)  ; Defaults to Comma

  SElOpen   sprintf    "%c", iElOpn ; (default)'[' Symbol
  SElClose  sprintf    "%c", iElCls ; (default) ']' Symbol
  Sep1      sprintf    "%c", iSep1  ; (default) Whitespace
  Sep2      sprintf    "%c", iSep2  ; (default) ',' Comma (optional)

  ilen       strlen     Sin
  ipcount   = 0
  insidearr = 0
  ipos      = 0
  iOnSep    = 1
  loop:
    Schar  strsub Sin, ipos, ipos+1
    icompElOpen  strcmp Schar, SElOpen ;is in an array?
    icompElClose strcmp Schar, SElClose ;array ends?
    icompSep1    strcmp Schar, Sep1    ;is a space?
    icompSep2    strcmp Schar, Sep2    ;is a comma?

    if icompElOpen == 0 then 
      insidearr = 1
      iOnSep = 0
      ipcount += 1
    endif
    if icompElClose == 0 then
      insidearr = 0
      iOnSep = 0
    endif
    if ((icompSep1 == 0 ) || (icompSep2 == 0 )) && (insidearr == 0) then
      iOnSep = 1
    elseif iOnSep == 1 then
      ipcount += 1
      iOnSep = 0
    endif
    loop_lt ipos, 1, ilen, loop
    xout ipcount
endop

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
if strcmp(Snum,"") == 0 then
 Snum     =         "nan"
endif
inum      strtod    Snum
          xout      inum
  endop 
  opcode StrayGetNum, k, Skjj
;returns kelindex in Stray. this element must be a number
Str, kelindx, isepA, isepB xin
;;DEFINE THE SEPERATORS
isep1     =         (isepA == -1 ? 32 : isepA)
isep2     =         (isepA == -1 && isepB == -1 ? 9 : (isepB == -1 ? isep1 : isepB))
Sep1      sprintf   "%c", isep1
Sep2      sprintf   "%c", isep2
;;INITIALIZE SOME PARAMETERS
Stray     strcpyk   Str ;make sure to update in performance
klen      strlenk   Stray
kstartsel =         -1; startindex for searched element
kendsel   =         -1; endindex for searched element
kel       =         0; actual number of element while searching
kwarleer  =         1
kndx      =         0
 if klen == 0 kgoto end ;don't go into the loop if Stray is empty
loop:
Snext     strsubk   Stray, kndx, kndx+1; next sign
ksep1p    strcmpk   Snext, Sep1; returns 0 if Snext is sep1
ksep2p    strcmpk   Snext, Sep2; 0 if Snext is sep2
;;NEXT SIGN IS NOT SEP1 NOR SEP2
if ksep1p != 0 && ksep2p != 0 then
 if kwarleer == 1 then; first character after a seperator 
  if kel == kelindx then; if searched element index
kstartsel =         kndx; set it
kwarleer  =         0
  else 			;if not searched element index
kel       =         kel+1; increase it
kwarleer  =         0; log that it's not a seperator 
  endif 
 endif 
;;NEXT SIGN IS SEP1 OR SEP2
else 
 if kstartsel > -1 then; if this is first selector after searched element
kendsel   =         kndx; set iendsel
          kgoto     end ;break
 else	
kwarleer  =         1
 endif 
endif
          loop_lt   kndx, 1, klen, loop 
end: 		
Snum      strsubk   Stray, kstartsel, kendsel
Snum      init      "nan"
knum      strtodk   Snum
          xout      knum
  endop 

opcode EvtPtrnz, kkk,iiS
  ; Give it a string with numbers and it outputs trigger 1 or no-trigger 0
  ; Made by Hlödver Sigurdsson 2016
  iTimeSignature, iBPM, Spattern xin
  kOffTrigger init 0
  kPatLen StrayLen Spattern
  kPatMax StrayGetNum Spattern, kPatLen - 1
  krate_counter timek
  iOneSecond =  kr
  iBeatsPerSecond = iBPM / 60
  iTicksPerBeat = iOneSecond / iBeatsPerSecond
  if iTimeSignature != 0 then
    kBeatCounts = (ceil(kPatMax) >= iTimeSignature ? ceil((kPatMax+0.00001)/iTimeSignature)*iTimeSignature : iTimeSignature)
  endif
  kPatternLength = (iTimeSignature < 1 ? ceil(kPatMax+0.00001) * iTicksPerBeat : kBeatCounts * iTicksPerBeat)
  kIndex init 0
  kNextEvent StrayGetNum Spattern, kIndex % kPatLen
  kLastEvent StrayGetNum Spattern, (kPatLen - 1)

  if int(krate_counter % kPatternLength) == int(iTicksPerBeat * kLastEvent) then
    kOffTrigger = 1
  else
    kOffTrigger = 0
  endif
  if int(krate_counter % kPatternLength) == int(iTicksPerBeat * kNextEvent) then
    kTrigger = 1
    kIndex += 1
  else
    kTrigger = 0
  endif
  xout kTrigger, kOffTrigger, kIndex
endop

opcode EvtS2P, SS, SSSii
 ; String to Pattern, to be used with EvtPtrnz and EvtLvLp opcodes
 ; Made by Hlödver Sigurdsson 2016
SPatName, SPar, SPattern, iTimeSignature, iBPM xin
SPatNameState strcat SPatName, "_s"
SInits init ""
SInitsDef init ""
SInitsLen init ""
SInitsLenDef init ""
SPToStringNum init ""
SPToStringArr init ""
SInstr init ""
Schedule init ""
SAlways init ""
State init ""
Sep1		sprintf 	"%c", 32 ; Space
Sep2		sprintf    "%c", 9  ; Tab
SarrOpen   sprintf    "%c", 91 ; '[' Symbol
SarrClose  sprintf    "%c", 93 ; ']' Symbol
indx = 0
iarrndx = 0
iSpaceCount init 0
iMoreThanOneSpace = 0
iInstr = 1 ;Pattern begins with instrument name/number, 0 means strings are passed to parameter fields
iInsideArray = 0
iStrLen strlen SPar
SFirstLetter strsub SPar, 0, 1
iNumberedInstrument StrNumP SFirstLetter
loop:
  Snext 	strsub		SPar, indx, indx+1
  isep1p	strcmp		Snext, Sep1
  isep2p	strcmp		Snext, Sep2
  iArrOpen strcmp   Snext, SarrOpen
  iArrClose strcmp  Snext, SarrClose
if isep1p != 0 && isep2p != 0 then
  if iInsideArray == 0 &&  iInstr == 1 then
  SInstr strcat SInstr, Snext
  elseif iArrOpen == 0 && iInsideArray == 0 then ;Here the array opens
  iInsideArray = 1
  elseif iArrClose == 0 && iInsideArray == 1 then ;Here the array closes
  iInsideArray = 0
  iarrndx = 0
  SInits strcat SInits, "\n"
  ;SInitsLen strcat SInitsLen, "\"\n"
  elseif iInstr == 0 && iInsideArray == 1 then
    if iarrndx > 0 && iMoreThanOneSpace == 0 then ;In array, commas preceed all numbers 
      SInitsDef strcat SInitsDef, Snext           ;except for first element (fillarray)
      SInits strcat SInits, SInitsDef
      SInitsLen strcat SInitsLen, Snext
      SInitsLenDef = ""
      SInitsDef = ""
      iarrndx += 1
    elseif iarrndx > 0 && iMoreThanOneSpace == 1 then ;If this is multidigit number in array
      SInitsDef strcat ", ", Snext
      SInits strcat SInits, SInitsDef
      SInitsLen strcat SInitsLen, " "
      SInitsLen strcat SInitsLen, Snext
      SInitsLenDef = ""
      SInitsDef = ""
      iarrndx += 1
    else
      SInitsLen strcat SInitsLen, Snext
      SInitsLenDef = ""
      SInitsDef strcat SInitsDef, Snext
      SInits strcat SInits, SInitsDef
      SInitsDef = ""
      iarrndx += 1
   endif
  else
    SInitsLen strcat SInitsLen, Snext
    SInitsLenDef = "" 
    SInitsDef strcat SInitsDef, Snext
    SInits strcat SInits, SInitsDef
    SInitsDef = ""
  endif
 iMoreThanOneSpace = 0 ;Each time an alphabetical letter or number arrives, space locker is returned to 0
 else
   iInstr = 0 ;Safe way to make sure that defenition of instrument quits after first space
   if (iInsideArray == 0) && (iMoreThanOneSpace == 0)  then
     SInits strcat SInits, "\n"
     if iSpaceCount > 0 then
     SInitsLen strcat SInitsLen,"\"\n"
     endif
     iSpaceCount += 1
   endif
   if iMoreThanOneSpace == 0 then
    if iarrndx == 0 && (iStrLen-indx) != 1 then
      ;SPToString2a sprintf "%i[kIndex %% gi", (iSpaceCount+2) ;Len%i]
      SPToString sprintf ", gip%s%i[kIndex %% gip%sLen%i]",SPatName,(iSpaceCount+2), SPatName, (iSpaceCount+2)
      ;SPToString2b strcat SPToString2a,"Len%i]"
      ;SPToString2 sprintf SPToString2b, (iSpaceCount+2), (iSpaceCount+2)
      ;SCurrentPar strcat ", gip", SPatName
      ;SCurrentPar strcat SCurrentPar, SPToString
      Schedule strcat Schedule, SPToString
      SPToStringNum sprintf "%i", (iSpaceCount + 2)
      SPToStringArr strcat "gip", SPatName
      SPToStringArr strcat SPToStringArr, SPToStringNum
      SPToStringArr2 strcat "gip", SPatName
      SPToStringArr2 strcat SPToStringArr2, "Len"
      SPToStringArr2 strcat SPToStringArr2, SPToStringNum
      SInitsLenDef  strcat SPToStringArr2," StrayLen \""
      ;SInitsLenDef  strcat SInitsLenDef, SPToStringArr
      SInitsLen strcat SInitsLen, SInitsLenDef
      ;SInitsLen strcat SInitsLen, 
      ;SInitsLen strcat SInitsLen, "\n"
      SInitsDef    strcat SPToStringArr, "[] fillarray "
      iMoreThanOneSpace = 1
       else
      iMoreThanOneSpace = 1
     endif
   endif
endif
loop_lt	 indx, 1, iStrLen, loop
;Here comes Arguments for Schedkwhen
if iNumberedInstrument == 1 then    
  SInstrCat strcat "iInstr = ", SInstr ;If instrument name is number
  SInstrCat strcat SInstr, "\n"
  ;SInstr strcat SInstr, "\n"
  Schedule strcat "schedkwhen kTrigger, 0, 0, iInstr, 0 ", Schedule
elseif iNumberedInstrument == 0 then
  SInstrCat strcat "SInstr = \"", SInstr ;If instrument name is string
  SInstrCat strcat SInstrCat, "\"\n"
  Schedule strcat "\nschedkwhen kTrigger, 0, 0, SInstr, 0", Schedule
endif
Schedule strcat "\n;;Here comes the scheduler", Schedule ;;Useless but fixes a bug.
SInits strcat SInits, "\n"
Schedule strcat Schedule, "\n"
SPatName1 strcat "\ninstr ", SPatName
SPatName2 strcat  "\ninstr ",SPatNameState
SPatName1 strcat SPatName1, " \n"
SPatName3 strcat "\nSPatName = \"",SPatName
SPatName3 strcat SPatName3, "\"\n"
SPatternizerParam sprintf "giTimeSignature%s = %i\ngiBPM%s = %i\ngSpattern%s = \"%s\"\n", SPatName, iTimeSignature,SPatName, iBPM,SPatName, SPattern
SPatternizer sprintf "kTrigger, kOffTrigger, kIndex EvtPtrnz giTimeSignature%s, giBPM%s, gSpattern%s", SPatName,SPatName,SPatName
SAlways strcat SAlways, SPatternizer
SAlways strcat SAlways, Schedule
SAlways strcat SAlways,"\nif kOffTrigger == 1 then \n turnoff \n endif \n endin \n"
SAlways strcat SInstrCat, SAlways
SAlways strcat SPatName1, SAlways
State = "\"\nkActive active SPatName\nif kActive < 1 then\nschedkwhen 1, 0, 1, SPatName, 0, 100000\nendif\nendin\n;"
State strcat SInitsLen, State
State strcat SInits, State
State strcat SPatternizerParam, State
State strcat SPatName3, State
State strcat SPatName2, State
xout SAlways, State
;prints SAlways
;prints State
endop

opcode EvtLvLp, 0, SSSi[][]oj
SPatName, SPattern, SParameters, iTrackStates[][], iTimeSignature, iBPM xin
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
  iTrackID StrSum SPatName
  iPatSum  StrSum SPattern
  iParSum  StrSum SParameters
  iParCount StrayElCnt SParameters
if iTrackStates[iTrackID][0] != iPatSum  || \
   iTrackStates[iTrackID][1] != iParSum  || \
   iTrackStates[iTrackID][2] != iTimeSignature || \
   iTrackStates[iTrackID][3] != iBPM then
  SConsoleLog sprintf "Pattern: %s was evaluated!\n", SPatName
  prints SConsoleLog
  SAlways, State EvtS2P SPatName, SParameters, SPattern, iTimeSignature, iBPM
  iFailTest1 compilestr State
  if iFailTest1 != 0 then
    SConsoleLogFailEval sprintf "ERROR: FAILED TO EVALUATE PATTERN %s\n", SPatName 
    prints SConsoleLogFailEval
  endif
  if (iActive < 1) || (iTrackStates[iTrackID][4] != iParCount) then
    iFailTest2 compilestr SAlways
    if iFailTest2 != 0 then
      SConsoleLogStartFail sprintf "ERROR: FAILED TO START THE PATTERN %s\n", SPatName
      prints SConsoleLogStartFail
    endif
  endif
endif
  iTrackStates[iTrackID][0] = iPatSum
  iTrackStates[iTrackID][1] = iParSum
  iTrackStates[iTrackID][2] = iTimeSignature
  iTrackStates[iTrackID][3] = iBPM
  iTrackStates[iTrackID][4] = iParCount
  schedkwhen 1, 1, 1, SPatName2, 0, 1
donothing:
endop


