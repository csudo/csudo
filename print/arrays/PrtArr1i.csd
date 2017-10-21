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


<CsoundSynthesizer>
<CsOptions>
-n -m0
</CsOptions>
<CsInstruments>

           seed       0


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
  

  instr SimplePrinting
iArr[]     array      1, 2, 3, 4, 5, 6, 7
           prints     "\nSimple Printing with defaults:\n"
           PrtArr1i   iArr
  endin

  instr PrintFormatted
;create an array with 24 elements
iArr[]     init       24

;fill with random values 
indx       =          0
 until indx == lenarray(iArr) do
iArr[indx] rnd31      10, 0
indx       +=         1
 od

;print
           prints     "\nPrinting with precision=5 and 4 elements per row:\n"
           PrtArr1i   iArr, 0, -1, 5, 4
           prints     "\n", 0

  endin

</CsInstruments>
<CsScore>
i "SimplePrinting" 0 0
i "PrintFormatted" 0 0
</CsScore>
</CsoundSynthesizer>

returns:

Simple Printing with defaults:
[ 1.000,  2.000,  3.000,  4.000,  5.000,  6.000,  7.000]

Printing with precision=5 and 4 elements per row:
[ 7.31651,  8.64815,  9.49609,  0.77574, 
 -2.07689, -6.23011, -9.47259, -5.84165, 
 -0.68859,  6.88661,  3.25671, -4.47940, 
 -5.23011, -2.40409, -5.49139,  6.12480, 
 -0.54879, -3.43166,  4.07036, -9.44858, 
 -2.30122,  3.39005, -3.50829, -3.75510]

