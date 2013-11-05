/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN print/tables:
*****************************************************************************
TbDmp      : TbDmp ifn [,istart [,iend [,iprec [,ippr]]]]
TbDmpS     : TbDmpS ifn, String [,istart [,iend [,iprec [,ippr]]]]
TbDmpSk    : TbDmpSk ifn, String [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
TbDmpk     : TbDmpk ifn [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
*****************************************************************************
****************************************************************************/

/****************************************************************************
TbDmp ifn [,istart [,iend [,iprec [,ippr]]]]
Prints a function table at i-time.

Prints the content of a function table at i-time, i.e. once at the initialization of an instrument. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
You may have to set the flag -+max_str_len=10000 to avoid buffer overflow. See TbDmpk for the k-rate equivalent.

ifn - function table number
istart - first index to be printed (default = 0)
iend - first index not to be printed (default = -1: end of table)
iprec - float precision while printing (default = 3)
ippr - parameters per row (default = 10, maximum = 32)

****************************************************************************/
/****************************************************************************
TbDmpS ifn, String [,istart [,iend [,iprec [,ippr]]]]
Prints a table with an introducing string at i-time

Prints the content of a table, with an additional string as 'introduction' at i-time (= once at the initialization of an instrument). You may have to set the flag -+max_str_len=10000 for avoiding buffer overflow. See TbDmpSk for the k-rate variant

ifn - function table number
String - string to be printed as introduction
istart - first index to be printed (default = 0)
iend - first index not to be printed (default = -1: end of table)
iprec - float precision while printing (default = 3)
ippr - parameters per row (default = 10, maximum = 32)
****************************************************************************/
/****************************************************************************
TbDmpSk ifn, String [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
Prints a table with an introducing string at k-time

Prints the content of a function table with a string as 'introduction' at k-time, whenever a trigger is positive. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
You may have to set the flag -+max_str_len=10000 to avoid buffer overflow. See TbDmpS for the i-time equivalent.
Requires Csound 5.18 or higher for the usage of the k-rate default values P, O and V (thanks to Victor Lazzarini for implementing this feature).

ifn - function table number
String - string to be printed as introduction / comment
ktrig - if > 0, ifn is printed once in each k-cycle (= default). for any other value, no printing is performed
kstart - first index to be printed
kend - first index not to be printed. -1 means the end of the table
kprec - float precision while printing
kppr - parameters per row (maximum = 32)
****************************************************************************/
/****************************************************************************
TbDmpk ifn [,ktrig [,kstart [,kend [,kprec [,kppr]]]]]
Prints a function table at k-time.

Prints the content of a function table at k-time, whenever a trigger is positive. The indices being printed can be selected, the float precision and the number of values per line (up to 32).
You may have to set the flag -+max_str_len=10000 to avoid buffer overflow. See TbDmp for the i-time equivalent.
Requires Csound 5.18 or higher for the usage of the k-rate default values P, O and V (thanks to Victor Lazzarini for implementing this feature).

ifn - function table number
ktrig - if > 0, ifn is printed once in each k-cycle (= default). for any other value, no printing is performed
kstart - first index to be printed (default = 0)
kend - first index not to be printed. -1 or 0.5 (default) mean the end of the table
kprec - float precision while printing (default = 3)
kppr - parameters per row (default = 10, maximum = 32)
****************************************************************************/

  opcode TbDmp, 0, iojjo
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

  opcode TbDmpk, 0, iPOVVO
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

  opcode TbDmpS, 0, iSojjo
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

  opcode TbDmpSk, 0, iSPOVVO
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


