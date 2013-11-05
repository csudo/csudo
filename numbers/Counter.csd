/****************************************************************************
kcount Counter kup, kdown [, kstep [, istart]]
Step counter

Counts steps upwards or downwards, whenever a trigger signal has been received. This is meant to be used in live interaction, and is simliar to counter objects in realtime programs like Max or Pd. The example shows how the basic function can be extended to repeat sequences in a certain range.

kstep - step size (default = 1)
istart - starting value (default = 0)
kup - counts upwards when 1
kdown - counts downwards when 1
kcount - current count as output
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-nd
</CsOptions>
<CsInstruments>

  opcode Counter, k, kkPo
kup, kdown, kstep, istart xin
kcount    init      istart
kchange   changed   kup, kdown
if kchange == 1 then
 if kup == 1 then
kcount    =         kcount+kstep
 elseif kdown == 1 then	
kcount    =         kcount-kstep
 endif
endif
          xout      kcount
  endop
  
  opcode KeyOnce, kk, kkk
;returns '1' just in the k-cycle a certain key has been pressed (kdown) or released (kup)
key, kd, kascii    xin ;sensekey output and ascii code of the key (e.g. 32 for space)
knew      changed   key
kdown     =         (key == kascii && knew == 1 && kd == 1 ? 1 : 0)
kup       =         (key == kascii && knew == 1 && kd == 0 ? 1 : 0)
          xout      kdown, kup
  endop
  

instr 1 ;counts up or down for the "+" or "-" key
;can be used either endless (kcount) or in a step sequencer (kseq)
prints "\nUse the '+' or '-' key to count up or down.\n"
prints "The size of a sequence is 7.\n"
prints "The step size starts with 1; you can set it to 1, 2 or 3 with the number keys.\n\n"

iseq      =         7 ;how many steps to use in a sequencer
key,kd    sensekey
kup,k0    KeyOnce   key, kd, 43
kdown,k0  KeyOnce   key, kd, 45
kStep1,k0 KeyOnce   key, kd, 49
kStep2,k0 KeyOnce   key, kd, 50
kStep3,k0 KeyOnce   key, kd, 51
kStep     init      1
 if kStep1 == 1 then
kStep     =         1
          printks   "Step = 1!%n", 0
 elseif kStep2 == 1 then
kStep     =         2
          printks   "Step = 2!%n", 0
 elseif kStep3 == 1 then
          printks   "Step = 3!%n", 0
kStep     =         3
 endif
kcount    Counter   kup, kdown, kStep
kseq      =         kcount % iseq ;sequencer 1-7
kseq      =         (kseq > 0 ? kseq : iseq+kseq)
knew      changed   kcount
 if knew == 1 then
          printks   "kcount = %.0f, kseq = %.0f%n", 0, kcount, kseq
 endif
endin

</CsInstruments>
<CsScore>
i 1 0 1000
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
