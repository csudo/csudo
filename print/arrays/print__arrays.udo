/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN print/arrays:
*****************************************************************************
PrtArr1S   : PrtArr1S SArr [,istart [,iend]]
PrtArr1i   : PrtArr1 iArr [,istart [,iend [,iprec [,ippr]]]]]
PrtArr1k   : PrtArr1k kArr [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
*****************************************************************************
****************************************************************************/

/****************************************************************************
PrtArr1S SArr [,istart [,iend]]
Prints a one-dimensional string array at i-time.

Prints the content of a one-dimensional string array at i-time. 
Requires Csound 6.

SArr - array to be printed
istart - first index to be printed (default = 0)
iend - first index not to be printed. -1 (default) mean the end of the array
****************************************************************************/
/****************************************************************************
PrtArr1 iArr [,istart [,iend [,iprec [,ippr]]]]]
Prints a one-dimensional array at i-time.

Prints the content of a one-dimensional array at i-time. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
Requires Csound 6.

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

kArr - array to be printed
ktrig - if > 0, kArr is printed once in each k-cycle (= default). for any other value, no printing is performed
kstart - first index to be printed (default = 0)
kend - first index not to be printed. -1 or 0.5 (default) mean the end of the array
kprec - float precision while printing (default = 3)
kppr - parameters per row (default = 10, maximum = 32)
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


