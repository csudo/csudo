/****************************************************************************
Sout StripL Sin
Strips all initial spaces or tabs from a string.

Strips all spaces or tabs at the beginning of the input string Sin and returns the result as Sout.
written by joachim heintz

Sin - Input string which may contain starting spaces or tabs.
Sout - Output string with removed initial spaces/tabs.
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>

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


instr 1
Sin        strget     p4
           printf_i   "Sin = '%s'\n", 1, Sin
Sout       StripL     Sin
           printf_i   "Sout = '%s'\n\n", 1, Sout
endin
</CsInstruments>
<CsScore>
i 1 0 .01 "  ab  c d "
i 1 + . "a b c"
i 1 + . "  a"
i 1 + . "  a   "
i 1 + . "  "
i 1 + . "	a"
i 1 + . " 	a   "
i 1 + . " 	 "
i 1 + . ""
</CsScore>
</CsoundSynthesizer>

