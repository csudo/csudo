/****************************************************************************
PrtArr1k kArr [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
Prints a one-dimensional array at k-time.

Prints the content of a one-dimensional array at k-time, whenever a trigger is positive. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
Requires Csound 6.

kArr - array to be printed
ktrig - if > 0, kArr is printed once in each k-cycle (= default). for any other value, no printing is performed
kstart - first index to be printed (default = 0)
kend - first index not to be printed. -1 or 0.5 (default) mean the end of the array
kprec - float precision while printing (default = 3)
kppr - parameters per row (default = 10, maximum = 32)
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n -m0
</CsOptions>
<CsInstruments>

           seed       0


  opcode PrtArr1k, 0, k[]POVVO
kArr[], ktrig, kstart, kend, kprec, kppr xin
kprint     init       0
kndx       init       0
if ktrig > 0 then
kppr       =          (kppr == 0 ? 10 : kppr)
kend       =          (kend == -1 || kend == .5 ? lenarray(kArr) : kend)
kprec      =          (kprec == -1 || kprec == .5 ? 3 : kprec)
kndx       =          kstart
Sformat    sprintfk   "%%%d.%df, ", kprec+3, kprec
Sdump      sprintfk   "%s", "["
loop:
Snew       sprintfk   Sformat, kArr[kndx]
Sdump      strcatk    Sdump, Snew
kmod       =          (kndx+1-kstart) % kppr
 if kmod == 0 && kndx != kend-1 then
           printf     "%s\n", kprint+1, Sdump
Sdump      strcpyk    " "
 endif
kprint     =          kprint + 1
           loop_lt    kndx, 1, kend, loop
klen       strlenk    Sdump
Slast      strsubk    Sdump, 0, klen-2
           printf     "%s]\n", kprint+1, Slast
endif
  endop
  

  instr SimplePrinting
kArr[]     fillarray  1, 2, 3, 4, 5, 6, 7
kPrint     metro      1
           prints     "\nSimple Printing with defaults, once a second:\n"
           PrtArr1k   kArr, kPrint
  endin

  instr EatTheHead
kArr[]     fillarray  1, 2, 3, 4, 5, 6, 7
kPrint     metro      1
kStart     init       0
           prints     "\nChanging the start index:\n"
 if kPrint == 1 then
           PrtArr1k   kArr, 1, kStart
kStart     +=         1 
 endif
  endin

  instr EatTheTail
kArr[]     fillarray  1, 2, 3, 4, 5, 6, 7
kPrint     metro      1
kEnd       init       7
           prints     "\nChanging the end index:\n"
 if kPrint == 1 then
           PrtArr1k   kArr, 1, 0, kEnd
kEnd       -=         1 
 endif
  endin

  instr PrintFormatted
;create an array with 24 elements
kArr[] init 24

;fill with random values 
kndx = 0
until kndx == lenarray(kArr) do
kArr[kndx] rnd31 10, 0
kndx += 1
od

;print
           prints     "\nPrinting with precision=5 and 4 elements per row:\n"
           PrtArr1k   kArr, 1, 0, -1, 5, 4
           printks    "\n", 0
           
;turnoff after first k-cycle
turnoff
  endin

</CsInstruments>
<CsScore>
i "SimplePrinting" 0 5
i "EatTheHead" 6 5
i "EatTheTail" 12 5
i "PrintFormatted" 18 1
</CsScore>
</CsoundSynthesizer>

returns:

Simple Printing with defaults, once a second:
[ 1.000,  2.000,  3.000,  4.000,  5.000,  6.000,  7.000]
[ 1.000,  2.000,  3.000,  4.000,  5.000,  6.000,  7.000]
[ 1.000,  2.000,  3.000,  4.000,  5.000,  6.000,  7.000]
[ 1.000,  2.000,  3.000,  4.000,  5.000,  6.000,  7.000]
[ 1.000,  2.000,  3.000,  4.000,  5.000,  6.000,  7.000]

Changing the start index:
[ 1.000,  2.000,  3.000,  4.000,  5.000,  6.000,  7.000]
[ 2.000,  3.000,  4.000,  5.000,  6.000,  7.000]
[ 3.000,  4.000,  5.000,  6.000,  7.000]
[ 4.000,  5.000,  6.000,  7.000]
[ 5.000,  6.000,  7.000]

Changing the end index:
[ 1.000,  2.000,  3.000,  4.000,  5.000,  6.000,  7.000]
[ 1.000,  2.000,  3.000,  4.000,  5.000,  6.000]
[ 1.000,  2.000,  3.000,  4.000,  5.000]
[ 1.000,  2.000,  3.000,  4.000]
[ 1.000,  2.000,  3.000]

Printing with precision=5 and 4 elements per row:
[-6.02002,  1.55606, -7.25789, -3.43802, 
 -2.86539,  1.35237,  9.26686,  8.13951, 
  0.68799,  3.02332, -7.03470,  7.87381, 
 -4.86597, -2.42907, -5.44999,  2.07420, 
  1.00121,  7.33340, -7.53952,  3.23020, 
  9.93770,  2.84713, -8.23949, -1.12326]
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>72</x>
 <y>179</y>
 <width>400</width>
 <height>200</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>170</r>
  <g>170</g>
  <b>127</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
