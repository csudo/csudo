/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN lines:
*****************************************************************************
Linek      : kval, kfin Linek kthis, knext, ktim, ktrig
*****************************************************************************
****************************************************************************/

/****************************************************************************
kval, kfin Linek kthis, knext, ktim, ktrig
performs a linear interpolation from one value to another value in a certain time whenever a trigger is received

Performs a linear interpolation from kthis to knext in ktim whenever ktrig is 1. Otherwise kthis is bypassed (before the first trigger impulse) or kval is held. The behaviour should be the same as in PD's/Max' "line" object.
written by joachim heintz

kthis - starting value
knext - target value
ktim - time for linear ramp in seconds
ktrig - if 1, ramping starts
kval - output value
kfin - 1 if target has been reached
****************************************************************************/

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


