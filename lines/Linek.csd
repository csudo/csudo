/****************************************************************************
kval, kfin Linek kthis, knext, ktim, ktrig
performs a linear interpolation from one value to another value in a certain time whenever a trigger is received

Performs a linear interpolation from kthis to knext in ktim whenever ktrig is 1. Otherwise kthis is bypassed (before the first trigger impulse) or kval is held. The behaviour should be the same as in PD's/Max' "line" object.

kthis - starting value
knext - target value
ktim - time for linear ramp in seconds
ktrig - if 1, ramping starts
kval - output value
kfin - 1 if target has been reached
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-ndm0
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 4410

  opcode Linek, kk, kkkk
;performs a linear interpolation from kthis to knext in ktim whenever ktrig is 1
kthis, knext, ktim, ktrig xin 
kstat     init      0 ;status at the begin
kfin      init      0
knprd     =         round(ktim*kr) ;number of k-cycles for ktim
ktimek    timek
 if ktrig == 1 then ;freeze values 
kthistim  =         ktimek 
kstrt     =         kthis
kend      =         knext
kstat     =         1
 endif
 if kstat == 0 then
kval      =         kthis
 elseif kstat == 1 then
kcount    =         ktimek-kthistim ;number of k-cycles in the time needed
kinc      =         (kend-kstrt) / knprd ;increment
kval      =         kstrt + kcount * kinc 
  if ktimek == kthistim+knprd then ;if target reached
kfin      =         1 ;tell it
kstat     =         2 ;set status
  else
kfin      =         0
  endif
 elseif kstat == 2 then
kval      =         kval ;stay at kval if no new trigger
kfin      =         0
 endif
          xout      kval, kfin ;value and 1 if target reached
  endop


instr 1
kthis     init      p4
knext     rand      100, 1.1
ktim      =         1 ;time in sec
ktrig     metro     .5, .5
kval,kfin Linek     kthis, knext, ktim, ktrig
 if ktrig == 1 then
          printks   "kthis = %.3f, knext = %.3f\n", 0, kthis, knext
 endif
          printk2   kval
 if kfin == 1 then
          printks   "target reached!\n", 0
kthis     =         kval
 endif
endin

</CsInstruments>
<CsScore>
i 1 0 10 0
i 1 10 10 1
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
