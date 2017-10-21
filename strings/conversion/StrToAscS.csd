<CsoundSynthesizer>
<CsOptions>
-ndm0 
</CsOptions>
<CsInstruments>
ksmps = 32

/****************************************************************************
Sout StrToAscS Sin
Returns the ASCII numbers of the input string as string.

Returns the ASCII numbers of the input string as string. The integers in the output string are seperated by one space.
written by joachim heintz

Sin - Input string with any sequence of characters or numbers.
Sout - Output string containing the ASCII numbers of all characters, seperated by spaces.
****************************************************************************/

  opcode StrToAscS, S, S
Sin        xin
ilen       strlen     Sin
ipos       =          0
Sres       =          ""
loop:
ichr       strchar    Sin, ipos
Snew       sprintf    "%d ", ichr
Sres       strcat     Sres, Snew
           loop_lt    ipos, 1, ilen, loop
           xout       Sres
  endop
  

  instr Test
S_csound StrToAscS "csound"
S_ascii StrToAscS {{!"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~}}
printf_i "\n'csound'\n->  '%s'\n", 1, S_csound
printf_i {{\n'!"#$%%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~'\n->  '%s'\n\n}}, 1, S_ascii
  endin

</CsInstruments>
<CsScore>
i "Test" 0 0
</CsScore>
</CsoundSynthesizer>

