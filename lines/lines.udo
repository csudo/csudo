/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN lines:
*****************************************************************************
LinTrs     : iVal LinTrs iStart, iEnd, iNumSteps, iType, iStep
Linek      : kval, kfin Linek kthis, knext, ktim, ktrig
*****************************************************************************
****************************************************************************/

/****************************************************************************
iVal LinTrs iStart, iEnd, iNumSteps, iType, iStep
same as the transeg opcode in Csound

wraps the transeg opcode (with only one segment) as UDO to get only one value
written by joachim heintz

iStart - starting value 
iEnd - target value
iNumSteps - how many steps in total
iType - see the transeg manual page in Csound
iStep - this step (starting from 0 as first step)
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

opcode LinTrs, i, iiiii
 iStart, iEnd, iNumSteps, iType, iStep xin
 if iType != 0 then
  iVal = iStart + (iEnd - iStart) * (1 - exp(iStep*iType / (iNumSteps-1))) / (1 - exp(iType))
 else
  iVal = iStart + (iEnd - iStart) * (iStep / (iNumSteps-1))
 endif
 xout iVal
endop


