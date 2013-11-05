/****************************************************************************
TbDmp ifn [,istart [,iend [,iprec [,ippr]]]]
Prints a function table at i-time.

Prints the content of a function table at i-time, i.e. once at the initialization of an instrument. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
You may have to set the flag -+max_str_len=10000 to avoid buffer overflow. See TbDmpk for the k-rate equivalent.

ifn - function table number
istart - first index to be printed (default = 0)
iend - first index not to be printed (default = -1: end of table)
iprec - float precision while printing (default = 3)
ippr - parameters per row (default = 10, maximum = 32)

****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-n -m0
</CsOptions>
<CsInstruments>

gitab      ftgen      1, 0, -7, -2, 0, 1, 2, 3, 4, 5, 6
gisin      ftgen      2, 0, 64, 10, 1


  opcode TbDmp, 0, iojjo
ifn, istart, iend, iprec, ippr xin
ippr       =          (ippr == 0 ? 10 : ippr)
iend       =          (iend == -1 ? ftlen(ifn) : iend)
iprec      =          (iprec == -1 ? 3 : iprec)
indx       =          istart
Sformat    sprintf    "%%.%df, ", iprec
Sdump      sprintf    "%s", "["
loop:
ival       tab_i      indx, ifn
Snew       sprintf    Sformat, ival
Sdump      strcat     Sdump, Snew
imod       =          (indx+1-istart) % ippr
 if imod == 0 && indx != iend-1 then
           puts       Sdump, 1
Sdump      =          ""
 endif
           loop_lt    indx, 1, iend, loop
ilen       strlen     Sdump
Slast      strsub     Sdump, 0, ilen-2
           printf_i   "%s]\n", 1, Slast
  endop


  instr SimplePrinting
           prints     "\nSimple Printing with defaults:\n"
           TbDmp      1
  endin

  instr PrintingParts
           prints     "\nPrinting a subset of the table (start =  2, end =  5):\n"
           TbDmp      1, 2, 5
  endin

  instr PrintingPrec
           prints     "\nPrinting a subset of the table with float precision 0:\n"
           TbDmp      1, 2, 5, 0
  endin

  instr PrintingPpr
           prints     "\nPrinting table 2 with 8 elements per row:\n"
           TbDmp      2, 0, -1, 3, 8
           prints     "\n"
  endin

</CsInstruments>
<CsScore>
i "SimplePrinting" 0 .1
i "PrintingParts" .1 .1
i "PrintingPrec" .2 .1
i "PrintingPpr" .3 .1
e
</CsScore>
</CsoundSynthesizer>

prints:
    
Simple Printing with defaults: 
[0.000, 1.000, 2.000, 3.000, 4.000, 5.000, 6.000]

Printing a subset of the table (start = 2, end = 5): 
[2.000, 3.000, 4.000]

Printing a subset of the table with float precision 0: 
[2, 3, 4]

Printing table 2 with 8 elements per row: 
[0.000, 0.098, 0.195, 0.290, 0.383, 0.471, 0.556, 0.634, 
0.707, 0.773, 0.831, 0.882, 0.924, 0.957, 0.981, 0.995, 
1.000, 0.995, 0.981, 0.957, 0.924, 0.882, 0.831, 0.773, 
0.707, 0.634, 0.556, 0.471, 0.383, 0.290, 0.195, 0.098, 
0.000, -0.098, -0.195, -0.290, -0.383, -0.471, -0.556, -0.634, 
-0.707, -0.773, -0.831, -0.882, -0.924, -0.957, -0.981, -0.995, 
-1.000, -0.995, -0.981, -0.957, -0.924, -0.882, -0.831, -0.773, 
-0.707, -0.634, -0.556, -0.471, -0.383, -0.290, -0.195, -0.098]


