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


<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1.0


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

giPad_tbl_len = 2^18
giPad_base_freq = 23.3
giPad ftgen 0, 0, giPad_tbl_len, "padsynth", giPad_base_freq, 50, 1.1, 2, 1, 0.2, 0.3,0.2,0.1

instr 1
  giPad_tbl_len = 2^18
  giPad_base_freq = 23.3
  ifreq_constant = (sr/giPad_tbl_len/giPad_base_freq)
  asig1 poscil 0.1, ifreq_constant*p4/2, giPad, rnd(1)
  asig2 poscil 0.1, ifreq_constant*p4*1.01/2, giPad, rnd(1)
  asig sum asig1, asig2
  asig linen asig, p3*0.1,p3,p3*0.1
  kReleaseQmark release
  if (kReleaseQmark == 1) then
    xtratim 0.1
    aEndEnv expon 1, 0.1, 0.001
    asig *= aEndEnv
  endif
  outs asig*0.1, asig*0.1
endin

;; Example without useing the kOffTrigger
instr 2
  kDurs[]  fillarray 6,6,6,3,3,6,6
  kFreqs[] fillarray 7.09,7.04,7.09,7.08,7.09,7.00,7.11,7.09
  kTrigger, kOffTrigger, kIndex EvtPtrnz 4, 120, "0 1 2 3"
  schedkwhen kTrigger, 0, 0, 1, 0, kDurs[kIndex%lenarray(kDurs)],cpspch(kFreqs[kIndex%lenarray(kFreqs)])
endin

;; Example useing the kOffTrigger
instr 3
  kDurs[]  fillarray 6,6,6,3,3,6,6
  kFreqs[] fillarray 7.09,7.04,7.09,7.08,7.09,7.00,7.11,7.09
  kTrigger, kOffTrigger, kIndex EvtPtrnz 4, 120, "0 1 2 3"
  schedkwhen kTrigger, 0, 0, 1, 0, kDurs[kIndex%lenarray(kDurs)],cpspch(kFreqs[kIndex%lenarray(kFreqs)])
  if (kOffTrigger == 1) then
    turnoff2 1, 0, 1
  endif  
endin


</CsInstruments>
<CsScore>
i 2 0  10
i 3 10 10

</CsScore>
</CsoundSynthesizer>
