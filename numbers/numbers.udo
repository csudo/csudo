/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN numbers:
*****************************************************************************
NmCntr     : kcount NmCntr kup, kdown [, kstep [, istart]]
NmFrcLen   : iFracs NmFrcLen iNum
NmRndInt   : iRnd NmRndInt iMin, iMax
NmScl      : iValOut NmScl iVal, iInMin, iInMax, iOutMin, iOutMax
NmStpInc   : iOut NmStpInc iValStart, iValEnd, iNumSteps, iThisStep
*****************************************************************************
****************************************************************************/

/****************************************************************************
kcount NmCntr kup, kdown [, kstep [, istart]]
Step counter

Counts steps upwards or downwards, whenever a trigger signal has been received. This is meant to be used in live interaction, and is simliar to counter objects in realtime programs like Max or Pd. The example shows how the basic function can be extended to repeat sequences in a certain range.
written by joachim heintz

kstep - step size (default = 1)
istart - starting value (default = 0)
kup - counts upwards when 1
kdown - counts downwards when 1
kcount - current count as output
****************************************************************************/
/****************************************************************************
iFracs NmFrcLen iNum
Returns the real length of the fractional part of a number

Returns the real length of digits in the the fractional part of a number. "Real" means that the number 1.000 actually has no fractional part but is in this sense an integer.
written by joachim heintz

iNum - incoming number
iFracs - number of digits in the fractional part. 0 means that iNum is an integer
****************************************************************************/
/****************************************************************************
iRnd NmRndInt iMin, iMax
kRnd NmRndInt kMin, kMax
Returns a random integer number bewteen Min and Max (included).

Returns a random integer number bewteen Min and Max (included).
As the random opcode is used, make sure to set 'seed 0'.
written by joachim heintz

i(k)Min - minimum possible number
i(k)Max - maximum possible number
i(k)Rnd - result
****************************************************************************/
/****************************************************************************
iValOut NmScl iVal, iInMin, iInMax, iOutMin, iOutMax
kValOut NmScl kVal, kInMin, kInMax, kOutMin, kOutMax

Scales the incoming value i(k)Val in the range between i(k)InMin and i(k)InMax linear to the range between i(k)OutMin and i(k)OutMax.
written by joachim heintz

i(k)Val - incoming number
i(k)InMin - minimum possible incoming number
i(k)InMax - maximum possible incoming numer
i(k)OutMin - minimum possible outgoing number
i(k)OutMax - maximum possible outgoing number
i(k)ValOut - i(k)Val scaled
****************************************************************************/
/****************************************************************************
iOut NmStpInc iValStart, iValEnd, iNumSteps, iThisStep
kOut NmStpInc kValStart, kValEnd, kNumSteps, kThisStep

Step increment

The range between ValStart and ValEnd is divided in a number of steps. The opcode 
returns the proper value for one of these steps.
written by joachim heintz

iValStart (kValStart) - value at start (ThisStep=0)
iValEnd (kValEnd) - value at end (ThisStep=NumSteps)
iNumSteps (kNumSteps) - number of steps between ValStart and ValEnd
iThisStep (kThisStep) - index of this step (starting at zero)
****************************************************************************/

  opcode NmCntr, k, kkPo
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

  opcode NmFrcLen, i, io
;returns the number of digits in the fractional part of inum (0=integer)
inum, ifracs xin
ifac      =         10^ifracs
if int(inum*ifac) == inum*ifac then
          igoto     end
else
ifracs    NmFrcLen   inum, ifracs+1
endif
end:      xout      ifracs
  endop

  opcode NmRndInt, i, ii
iMin, iMax xin
iRnd random iMin, iMax+.999999
xout int(iRnd)
  endop
  opcode NmRndInt, k, kk
kMin, kMax xin
kRnd random kMin, kMax+.999999
xout int(kRnd)
  endop

  opcode NmScl, i, iiiii
iVal, iInMin, iInMax, iOutMin, iOutMax xin
iValOut = (((iOutMax - iOutMin) / (iInMax - iInMin)) * (iVal - iInMin)) + iOutMin
xout iValOut
  endop
  opcode NmScl, k, kkkkk
kVal, kInMin, kInMax, kOutMin, kOutMax xin
kValOut = (((kOutMax - kOutMin) / (kInMax - kInMin)) * (kVal - kInMin)) + kOutMin
xout kValOut
  endop

opcode NmStpInc, i, iiii
 iValStart, iValEnd, iNumSteps, iThisStep xin
 iOut = ((iValEnd-iValStart) / iNumSteps) * iThisStep + iValStart
 xout iOut
endop
opcode NmStpInc, k, kkkk
 kValStart, kValEnd, kNumSteps, kThisStep xin
 kOut = ((kValEnd-kValStart) / kNumSteps) * kThisStep + kValStart
 xout kOut
endop


