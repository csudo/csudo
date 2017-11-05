/****************************************************************************
ilen StrayElCnt Stray [, iElOpn] [, iElCls] [, iSep1] [, iSep2]
Returns the number of elements from a string where a list/array can be counted as 1 element.

Returns the number of elements in Stray. Elements are defined by lists/arrays: iElOpn defaults to 91 (ASCII for '['), iElCls (ASCII for ']'), or by seperators when used outside of lists/arrays: isep1 defaults to 32 (= space) and isep2 defaults to 44 (= comma).
written by Hlöðver Sigurðsson

Stray - a string as array
iElOpn - open element deliminator (default=91: [)
iElCls - close element deliminator (default=93: ])
isep1  - the first seperator (default=32: space)
isep2  - the second seperator (default=44: comma) 
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1.0


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

instr 1
  ilen StrayElCnt {{these are "not" 5 elements -}}
  printf_i  "'%d'\n", 1, ilen
endin

instr 2
  Stray strget p4
  ipcnt pcount
  if ipcnt == 4 then
    ilen StrayElCnt Stray
  elseif ipcnt == 6 then
    ilen StrayElCnt Stray, p5, p6
  elseif ipcnt == 8 then
    ilen StrayElCnt Stray, p5, p6, p7, p8
  endif		
  printf_i  "'%d'\n", 1, ilen
endin 


</CsInstruments>
<CsScore>
i 1 0 0
i 2 0 0 "[element by] [square brackets] by default"
i 2 0 0 "element by (lispy parenthesis)" 40 41
i 2 0 0 "seperator:by:colon:[cool !]" 91 93 58 58

</CsScore>
</CsoundSynthesizer>
returns:
'6'
'6'
'3'
'4'
