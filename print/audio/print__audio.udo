/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN print/audio:
*****************************************************************************
Prt_a      : Prt_a aSig [,kPeriod [,kSpaces]]
*****************************************************************************
****************************************************************************/

/****************************************************************************
Prt_a aSig [,kPeriod [,kSpaces]]
Prints an audio signal (vector) every kPeriod seconds.

Prints the values of an audio signal. As this is a list of single sample values in the length of ksmps, ksmps values are printed in []. Like in the printk opcode, you can specify the period between print operations, and the starting spaces.
You may have to set the flag -+max_str_len=10000 to avoid buffer overflow. 
written by joachim heintz

aSig - input signal to be printed
kPeriod - time in seconds between print operations (default = 1). 0 means that printing is performed in each control cycle.
kSpaces - number of spaces to insert before printing (default = 0)

****************************************************************************/

  opcode Prt_a, 0, aPO
aSig, kPeriod, kSpaces xin
kTim       timeinsts
kNextPeriod init      0
kPrevTim   init       0 
;perform printout if period has been reached
if kTim >= kPrevTim + kNextPeriod - ksmps/sr then
kIndx      =          0
Sformat    sprintfk   "%%%ds %%.6f: [", kSpaces + 5
Sout       sprintfk   Sformat, "Time:", kTim
;collect all values in a string
printloop:
kVal       vaget      kIndx, aSig
Sval       sprintfk   "%f, ", kVal
Sout       strcatk    Sout, Sval
           loop_lt    kIndx, 1, ksmps, printloop
;remove the last comma and close the bracket
kLen       strlenk    Sout
Scut       strsubk    Sout, 0, kLen-2
           printf     "%s]\n", kTim, Scut
;reset previous time and next period
kPrevTim   =          kTim      
kNextPeriod =         kPeriod
endif
  endop


