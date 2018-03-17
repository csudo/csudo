/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN print:
*****************************************************************************
PrtArr1S   : PrtArr1S SArr [,istart [,iend]]
PrtArr1i   : PrtArr1 iArr [,istart [,iend [,iprec [,ippr]]]]]
PrtArr1k   : PrtArr1k kArr [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
PrtTb      : PrtTb ifn [,istart [,iend [,iprec [,ippr]]]]
PrtTbS     : PrtTbS ifn, String [,istart [,iend [,iprec [,ippr]]]]
PrtTbSk    : PrtTbSk ifn, String [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
PrtTbk     : PrtTbk ifn [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
Prt_a      : Prt_a aSig [,kPeriod [,kSpaces]]
*****************************************************************************
****************************************************************************/

/****************************************************************************
PrtArr1S SArr [,istart [,iend]]
Prints a one-dimensional string array at i-time.

Prints the content of a one-dimensional string array at i-time. 
Requires Csound 6.
written by joachim heintz

SArr - array to be printed
istart - first index to be printed (default = 0)
iend - first index not to be printed. -1 (default) mean the end of the array
****************************************************************************/
/****************************************************************************
PrtArr1 iArr [,istart [,iend [,iprec [,ippr]]]]]
Prints a one-dimensional array at i-time.

Prints the content of a one-dimensional array at i-time. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
Requires Csound 6.
written by joachim heintz

iArr - array to be printed
istart - first index to be printed (default = 0)
iend - first index not to be printed. -1 (default) mean the end of the array
iprec - float precision while printing (default = 3)
ippr - parameters per row (default = 10, maximum = 32)
****************************************************************************/
/****************************************************************************
PrtArr1k kArr [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
Prints a one-dimensional array at k-time.

Prints the content of a one-dimensional array at k-time, whenever a trigger is positive. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
Requires Csound 6.
written by joachim heintz

kArr - array to be printed
ktrig - if > 0, kArr is printed once in each k-cycle (= default). for any other value, no printing is performed
kstart - first index to be printed (default = 0)
kend - first index not to be printed. -1 or 0.5 (default) mean the end of the array
kprec - float precision while printing (default = 3)
kppr - parameters per row (default = 10, maximum = 32)
****************************************************************************/
/****************************************************************************
PrtTb ifn [,istart [,iend [,iprec [,ippr]]]]
Prints a function table at i-time.

Prints the content of a function table at i-time, i.e. once at the initialization of an instrument. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
You may have to set the flag -+max_str_len=10000 to avoid buffer overflow. See TbDmpk for the k-rate equivalent.
written by joachim heintz

ifn - function table number
istart - first index to be printed (default = 0)
iend - first index not to be printed (default = -1: end of table)
iprec - float precision while printing (default = 3)
ippr - parameters per row (default = 10, maximum = 32)

****************************************************************************/
/****************************************************************************
PrtTbS ifn, String [,istart [,iend [,iprec [,ippr]]]]
Prints a table with an introducing string at i-time

Prints the content of a table, with an additional string as 'introduction' at i-time (= once at the initialization of an instrument). You may have to set the flag -+max_str_len=10000 for avoiding buffer overflow. See TbDmpSk for the k-rate variant
written by joachim heintz

ifn - function table number
String - string to be printed as introduction
istart - first index to be printed (default = 0)
iend - first index not to be printed (default = -1: end of table)
iprec - float precision while printing (default = 3)
ippr - parameters per row (default = 10, maximum = 32)
****************************************************************************/
/****************************************************************************
PrtTbSk ifn, String [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
Prints a table with an introducing string at k-time

Prints the content of a function table with a string as 'introduction' at k-time, whenever a trigger is positive. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
You may have to set the flag -+max_str_len=10000 to avoid buffer overflow. See TbDmpS for the i-time equivalent.
Requires Csound 5.18 or higher for the usage of the k-rate default values P, O and V (thanks to Victor Lazzarini for implementing this feature).
written by joachim heintz

ifn - function table number
String - string to be printed as introduction / comment
ktrig - if > 0, ifn is printed once in each k-cycle (= default). for any other value, no printing is performed
kstart - first index to be printed
kend - first index not to be printed. -1 means the end of the table
kprec - float precision while printing
kppr - parameters per row (maximum = 32)
****************************************************************************/
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

  opcode PrtArr1i, 0, i[]ojjj
iArr[], istart, iend, iprec, ippr xin
iprint     init       0
ippr       =          (ippr == -1 ? 10 : ippr)
iend       =          (iend == -1 ? lenarray(iArr) : iend)
iprec      =          (iprec == -1 ? 3 : iprec)
indx       =          istart
Sformat    sprintf    "%%%d.%df, ", iprec+3, iprec
Sdump      sprintf    "%s", "["
loop:
Snew       sprintf    Sformat, iArr[indx]
Sdump      strcat     Sdump, Snew
imod       =          (indx+1-istart) % ippr
 if imod == 0 && indx != iend-1 then
           printf_i   "%s\n", iprint+1, Sdump
Sdump      strcpy     " "
 endif
iprint     =          iprint + 1
           loop_lt    indx, 1, iend, loop
ilen       strlen     Sdump
Slast      strsub     Sdump, 0, ilen-2
           printf_i   "%s]\n", iprint+1, Slast
  endop

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

  opcode PrtArr1S, 0, S[]oj
SArr[], istart, iend xin
iend       =          (iend == -1 ? lenarray(SArr) : iend)
indx       =          istart
           printf_i   "%s", 1, "["
 until indx >= iend-1 do
           printf_i    "%s, ", 1, SArr[indx]
indx       +=         1
 enduntil
           printf_i   "%s]\n", 1, SArr[indx]
  endop

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

  opcode PrtTb, 0, iojjo
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

  opcode PrtTbS, 0, iSojjo
;prints the content of a table in a simple way, with an additional string as 'introduction'
ifn, String, istart, iend, iprec, ippr xin; function table, first index to print, first index not to be printed (-1 =whole table), float precision while printing, String, parameters per row (maximum =  32)
ippr       =          (ippr == 0 ? 10 : ippr)
iend       =          (iend == -1 ? ftlen(ifn) : iend)
iprec      =          (iprec == -1 ? 3 : iprec)
indx       =          istart
Sformat    sprintf    "%%.%df, ", iprec
Sdump      sprintf    "%s[", String
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

  opcode PrtTbSk, 0, iSPOVVO
ifn, String, ktrig, kstart, kend, kprec, kppr xin
kprint     init       0
if ktrig > 0 then
kppr       =          (kppr == 0 ? 10 : kppr)
kend       =          (kend == -1 || kend == .5 ? ftlen(ifn) : kend)
kprec      =          (kprec == -1 || kprec == .5 ? 3 : kprec)
kndx       =          kstart
Sformat    sprintfk   "%%.%df, ", kprec
Sdump      sprintfk   "%s[", String
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


