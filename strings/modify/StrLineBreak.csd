/****************************************************************************
Sres StrLineBreak String, iNum

Inserts line breaks after iNum characters in the input string.
written by joachim heintz

Sin - Input string which may contain starting spaces or tabs.
Sout - Output string with removed initial spaces/tabs.
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n -m0
</CsOptions>
<CsInstruments>
ksmps = 16

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


  instr Test
String  =        "1234567890abcdefghij"
Sout    StrLineBreak String, p4
        puts     Sout, 1
        puts     "", 1
  endin

</CsInstruments>
<CsScore>
i "Test" 0 .1 5
i "Test" + .1 8
i "Test" + .1 20
</CsScore>
</CsoundSynthesizer>
returns:
12345
67890
abcde
fghij

12345678
90abcdef
ghij

1234567890abcdefghij

