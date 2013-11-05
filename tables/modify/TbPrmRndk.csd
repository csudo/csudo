/****************************************************************************
TbPrmRndk ift, ktrig
Permutes the values of a function table randomly, at k-time

Permutes the values of ift randomly and overwrites this table with the result. This operation is performed once a k-cycle, as long as a trigger is positive. See TbPrmRnd for the i-rate version

ift - function table to be permuted
ktrig - if > 0, the permutation is performed once a k-cycle
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n -d -m 0
</CsOptions>
<CsInstruments>

           seed       0
giTab      ftgen      0, 0, -12, -2, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12

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

  opcode TbDmpk, 0, ikkkkk
ifn, ktrig, kstart, kend, kprec, kppr xin
kprint     init       0
if ktrig > 0 then
kppr       =          (kppr == 0 ? 10 : kppr)
kend       =          (kend == -1 ? ftlen(ifn) : kend)
kprec      =          (kprec == -1 ? 3 : kprec)
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
  
  
instr 1
;12 permutations and printings in the first 12 k-cycles
kcount     init       0
           TbPrmRndk  giTab, 1
           TbDmpk     giTab, 1, 0, -1, 0, 12
kcount     =          kcount + 1
 if kcount == 12 then
           turnoff	
 endif
endin
</CsInstruments>
<CsScore>
i1	0	1
</CsScore>
</CsoundSynthesizer>

prints something like:
    
[1, 12, 2, 3, 9, 5, 10, 6, 4, 7, 11, 8]
[8, 12, 11, 3, 7, 6, 4, 1, 10, 5, 2, 9]
[3, 8, 4, 2, 1, 11, 9, 6, 12, 5, 7, 10]
[8, 11, 6, 1, 7, 12, 3, 4, 2, 5, 9, 10]
[3, 6, 8, 5, 11, 10, 4, 7, 12, 2, 1, 9]
[1, 8, 3, 11, 5, 12, 6, 7, 4, 2, 9, 10]
[11, 4, 12, 6, 7, 1, 9, 2, 10, 5, 8, 3]
[11, 8, 9, 5, 12, 6, 7, 10, 3, 2, 4, 1]
[10, 5, 12, 4, 8, 3, 9, 7, 2, 1, 11, 6]
[8, 7, 2, 11, 1, 3, 12, 10, 4, 5, 6, 9]
[3, 4, 7, 6, 9, 2, 10, 5, 8, 1, 11, 12]
[5, 8, 12, 1, 9, 2, 4, 7, 11, 6, 3, 10]


<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>72</x>
 <y>179</y>
 <width>400</width>
 <height>200</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>231</r>
  <g>46</g>
  <b>255</b>
 </bgcolor>
 <bsbObject version="2" type="BSBVSlider">
  <objectName>slider1</objectName>
  <x>5</x>
  <y>5</y>
  <width>20</width>
  <height>100</height>
  <uuid>{60a698d9-677e-405d-ad67-997221231d09}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
