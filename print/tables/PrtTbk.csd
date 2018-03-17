/****************************************************************************
PrtTbk ifn [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
Prints a function table at k-time.

Prints the content of a function table at k-time, whenever a trigger is positive. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
You may have to set the flag -+max_str_len=10000 to avoid buffer overflow. See TbDmp for the i-time equivalent.
Requires Csound 5.18 or higher for the usage of the k-rate default values P, O and V (thanks to Victor Lazzarini for implementing this feature).
written by joachim heintz

ifn - function table number
ktrig - if > 0, ifn is printed once in each k-cycle (= default). for any other value, no printing is performed
kstart - first index to be printed (default = 0)
kend - first index not to be printed. -1 or 0.5 (default) mean the end of the table
kprec - float precision while printing (default = 3)
kppr - parameters per row (default = 10, maximum = 32)
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n -m0
</CsOptions>
<CsInstruments>

gitab      ftgen      1, 0, -7, -2, 0, 1, 2, 3, 4, 5, 6
gisin      ftgen      2, 0, 64, 10, 1
           seed       0


  opcode PrtTbk, 0, iPOVVO
ifn, ktrig, kstart, kend, kprec, kppr xin
kprint     init       0
if ktrig > 0 then
kppr       =          (kppr == 0 ? 10 : kppr)
kend       =          (kend == -1 || kend == .5 ? ftlen(ifn) : kend)
kprec      =          (kprec == -1 || kprec == .5 ? 3 : kprec)
kndx       =          kstart
Sformat    sprintfk   "%%.%df, ", kprec
Sdump      sprintfk   "%s", "["
loop:
kval       tab        kndx, ifn
Snew       sprintfk   Sformat, kval
Sdump      strcatk    Sdump, Snew
kmod       =          (kndx+1-kstart) % kppr
 if kmod == 0 && kndx != kend-1 then
           printf     "%s\n", kprint+1, Sdump
Sdump      strcpyk    ""
 endif
kprint     =          kprint + 1
           loop_lt    kndx, 1, kend, loop
klen       strlenk    Sdump
Slast      strsubk    Sdump, 0, klen-2
           printf     "%s]\n", kprint+1, Slast
endif
  endop

  opcode TbPrmRndk, 0, ik
;changes the contents of ift each time ktrig is positive
ift, ktrig xin
itablen    =          ftlen(ift)
icopy      ftgentmp   0, 0, -itablen, -2, 0
if ktrig > 0 then
           tablecopy  icopy, ift
kleng      =          itablen
kndxerg    =          0
loop:
krand      random     0, kleng - .0001
kndex      =          int(krand)
kval       tab        kndex, icopy
           tabw       kval, kndxerg, ift
lshift:
if (kndex == kleng-1) kgoto next
kndxneu    =          kndex
kndxalt    =          kndxneu+1
kvalalt    tab        kndxalt, icopy
           tabw       kvalalt, kndxneu, icopy
kndex      =          kndex + 1
           kgoto      lshift
next:
kleng      =          kleng - 1
kndxerg    =          kndxerg + 1
if (kleng > 0) kgoto loop
endif
  endop
  

  instr SimplePrinting
kPrint     metro      1
           prints     "\nSimple Printing with defaults, once a second:\n"
           PrtTbk     gitab, kPrint
  endin
  
  instr EatTheHead
kPrint     metro      1
kStart     init       0
           prints     "\nChanging the start index:\n"
 if kPrint == 1 then
           PrtTbk     gitab, 1, kStart
kStart     =          kStart + 1 
 endif
  endin

  instr EatTheTail
kPrint     metro      1
kEnd       init       7
           prints     "\nChanging the end index:\n"
 if kPrint == 1 then
           PrtTbk     gitab, 1, 0, kEnd
kEnd       =          kEnd - 1 
 endif
  endin

  instr PrintLong
kPrint     metro      1
           prints     "\nPrinting table 2 with 8 elements per row:\n"
           PrtTbk     gisin, kPrint, 0, -1, 3, 8
  endin

  instr PrintChanging
kPrint     metro      1
           prints     "\nPrinting table 1 each time it has been permutet randomly:\n"
           TbPrmRndk  gitab, kPrint
           PrtTbk     gitab, kPrint, 0, -1, 0, 0
  endin
  
</CsInstruments>
<CsScore>
i "SimplePrinting" 0 5
i "EatTheHead" 6 5
i "EatTheTail" 12 5
i "PrintLong" 18 3
i "PrintChanging" 22 7
</CsScore>
</CsoundSynthesizer>

prints:
    
Simple Printing with defaults, once a second:
[0.000, 1.000, 2.000, 3.000, 4.000, 5.000, 6.000]
[0.000, 1.000, 2.000, 3.000, 4.000, 5.000, 6.000]
[0.000, 1.000, 2.000, 3.000, 4.000, 5.000, 6.000]
[0.000, 1.000, 2.000, 3.000, 4.000, 5.000, 6.000]
[0.000, 1.000, 2.000, 3.000, 4.000, 5.000, 6.000]

Changing the start index:
[0.000, 1.000, 2.000, 3.000, 4.000, 5.000, 6.000]
[1.000, 2.000, 3.000, 4.000, 5.000, 6.000]
[2.000, 3.000, 4.000, 5.000, 6.000]
[3.000, 4.000, 5.000, 6.000]
[4.000, 5.000, 6.000]

Changing the end index:
[0.000, 1.000, 2.000, 3.000, 4.000, 5.000, 6.000]
[0.000, 1.000, 2.000, 3.000, 4.000, 5.000]
[0.000, 1.000, 2.000, 3.000, 4.000]
[0.000, 1.000, 2.000, 3.000]
[0.000, 1.000, 2.000]

Printing table 2 with 8 elements per row:
[0.000, 0.098, 0.195, 0.290, 0.383, 0.471, 0.556, 0.634, 
0.707, 0.773, 0.831, 0.882, 0.924, 0.957, 0.981, 0.995, 
1.000, 0.995, 0.981, 0.957, 0.924, 0.882, 0.831, 0.773, 
0.707, 0.634, 0.556, 0.471, 0.383, 0.290, 0.195, 0.098, 
0.000, -0.098, -0.195, -0.290, -0.383, -0.471, -0.556, -0.634, 
-0.707, -0.773, -0.831, -0.882, -0.924, -0.957, -0.981, -0.995, 
-1.000, -0.995, -0.981, -0.957, -0.924, -0.882, -0.831, -0.773, 
-0.707, -0.634, -0.556, -0.471, -0.383, -0.290, -0.195, -0.098]
[0.000, 0.098, 0.195, 0.290, 0.383, 0.471, 0.556, 0.634, 
0.707, 0.773, 0.831, 0.882, 0.924, 0.957, 0.981, 0.995, 
1.000, 0.995, 0.981, 0.957, 0.924, 0.882, 0.831, 0.773, 
0.707, 0.634, 0.556, 0.471, 0.383, 0.290, 0.195, 0.098, 
0.000, -0.098, -0.195, -0.290, -0.383, -0.471, -0.556, -0.634, 
-0.707, -0.773, -0.831, -0.882, -0.924, -0.957, -0.981, -0.995, 
-1.000, -0.995, -0.981, -0.957, -0.924, -0.882, -0.831, -0.773, 
-0.707, -0.634, -0.556, -0.471, -0.383, -0.290, -0.195, -0.098]
[0.000, 0.098, 0.195, 0.290, 0.383, 0.471, 0.556, 0.634, 
0.707, 0.773, 0.831, 0.882, 0.924, 0.957, 0.981, 0.995, 
1.000, 0.995, 0.981, 0.957, 0.924, 0.882, 0.831, 0.773, 
0.707, 0.634, 0.556, 0.471, 0.383, 0.290, 0.195, 0.098, 
0.000, -0.098, -0.195, -0.290, -0.383, -0.471, -0.556, -0.634, 
-0.707, -0.773, -0.831, -0.882, -0.924, -0.957, -0.981, -0.995, 
-1.000, -0.995, -0.981, -0.957, -0.924, -0.882, -0.831, -0.773, 
-0.707, -0.634, -0.556, -0.471, -0.383, -0.290, -0.195, -0.098]

Printing table 1 each time it has been permutet randomly:
[1, 2, 5, 3, 6, 0, 4]
[1, 4, 2, 0, 3, 5, 6]
[0, 3, 4, 2, 5, 1, 6]
[3, 5, 1, 6, 2, 4, 0]
[3, 2, 5, 1, 4, 0, 6]
[2, 3, 6, 5, 0, 4, 1]
[4, 6, 2, 1, 5, 0, 3]

