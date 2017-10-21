/****************************************************************************
TbPrmRnd ift
Permutes the values of a function table randomly, at i-time

Permutes the values of ift randomly and overwrites this table with the result. See TbPrmRndk for the k-rate version
written by joachim heintz

ift: function table to be permuted
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n -d -m 0
</CsOptions>
<CsInstruments>

           seed       0
giTab      ftgen      0, 0, -12, -2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12

  opcode TbPrmRnd, 0, i
ift xin
itablen    =          ftlen(ift)
icopy      ftgentmp   0, 0, -itablen, -2, 0
           tableicopy  icopy, ift
ileng      =          itablen
indxerg    =          0
loop:
irand      random     0, ileng - .0001
index      =          int(irand)
ival       tab_i      index, icopy
           tabw_i     ival, indxerg, ift
lshift:
if (index == ileng-1) igoto next
indxneu    =          index
indxalt    =          indxneu+1
ivalalt    tab_i      indxalt, icopy
           tabw_i     ivalalt, indxneu, icopy
index      =          index + 1
           igoto      lshift
next:
ileng      =          ileng - 1
indxerg    =          indxerg + 1
if (ileng > 0) igoto loop
  endop

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
  
  
instr 1
;12 permutations and printings because of the i-loop
icount     init       0
print:
           TbPrmRnd   giTab
           TbDmp      giTab, 0, -1, 0, 12
           loop_lt    icount, 1, 12, print
           turnoff	
endin
</CsInstruments>
<CsScore>
i1	0	1
</CsScore>
</CsoundSynthesizer>

prints something like:
    
[2, 4, 9, 7, 11, 1, 3, 6, 12, 8, 10, 5]
[7, 3, 10, 5, 4, 6, 1, 11, 8, 9, 2, 12]
[4, 2, 9, 7, 6, 10, 5, 3, 8, 1, 11, 12]
[11, 8, 6, 4, 12, 1, 2, 3, 10, 9, 7, 5]
[11, 3, 4, 5, 10, 12, 9, 8, 6, 2, 7, 1]
[11, 10, 6, 9, 2, 3, 7, 8, 12, 5, 4, 1]
[3, 8, 2, 12, 11, 1, 10, 6, 5, 9, 7, 4]
[10, 1, 6, 3, 9, 11, 4, 2, 12, 5, 7, 8]
[12, 1, 6, 5, 10, 8, 4, 7, 11, 2, 9, 3]
[10, 8, 6, 4, 5, 2, 3, 12, 11, 1, 7, 9]
[1, 6, 12, 4, 8, 5, 3, 9, 7, 11, 10, 2]
[10, 6, 3, 2, 7, 8, 12, 1, 9, 4, 11, 5]


