/****************************************************************************
TbDmpS ifn, String [,istart [,iend [,iprec [,ippr]]]]
Prints a table with an introducing string at i-time

Prints the content of a table, with an additional string as 'introduction' at i-time (= once at the initialization of an instrument). You may have to set the flag -+max_str_len=10000 for avoiding buffer overflow. See TbDmpSk for the k-rate variant
written by joachim heintz

ifn - function table number
String - string to be printed as introduction
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


  opcode TbDmpS, 0, iSojjo
;prints the content of a table in a simple way, with an additional string as 'introduction'
ifn, String, istart, iend, iprec, ippr xin; function table, first index to print, first index not to be printed (-1 =whole table), float precision while printing, String, parameters per row (maximum =  32)
ippr       =          (ippr == 0 ? 10 : ippr)
iend       =          (iend == -1 ? ftlen(ifn) : iend)
iprec      =          (iprec == -1 ? 3 : iprec)
indx       =          istart
Sformat    sprintf    "%%.%df, ", iprec
Sdump      sprintf    "%s[", String
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
Smess      sprintf    "\n%s\n", "Simple Printing with defaults: "
           TbDmpS     1, Smess
  endin

  instr PrintingParts
Smess      sprintf    "\n%s\n", "Printing a  subset of the table  (start =  2, end =  5): "
           TbDmpS     1, Smess, 2, 5
  endin

  instr PrintingPrec
Smess      sprintf    "\n%s\n", "Printing a  subset of the table  with float precision 0: "
           TbDmpS     1, Smess, 2, 5, 0
  endin

  instr PrintingPpr
Smess      sprintf    "\n%s\n", "Printing table  2 with 8 elements per row: "
           TbDmpS     2, Smess, 0, -1, 3, 8
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


