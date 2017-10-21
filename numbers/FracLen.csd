/****************************************************************************
iFracs FracLen iNum
Returns the real length of the fractional part of a number

Returns the real length of digits in the the fractional part of a number. "Real" means that the number 1.000 actually has no fractional part but is in this sense an integer.
written by joachim heintz

iNum - incoming number
iFracs - number of digits in the fractional part. 0 means that iNum is an integer
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>

  opcode FracLen, i, io
;returns the number of digits in the fractional part of inum (0=integer)
inum, ifracs xin
ifac      =         10^ifracs
if int(inum*ifac) == inum*ifac then
          igoto     end
else
ifracs    FracLen   inum, ifracs+1
endif
end:      xout      ifracs
  endop

instr 1
iNum      =         p4
iFracs    FracLen   iNum
          printf_i  "Length of fractional part in %f = %d digits\n", 1, iNum, iFracs
endin 

</CsInstruments>
<CsScore>
i 1 0 .01 1.2345678
i 1 + . 123.45
i 1 + . 123.45000
i 1 + . 1234.000
i 1 + . 1234.001
i 1 + . -12
</CsScore>
</CsoundSynthesizer>
returns:
Length of fractional part in 1.234568 = 7 digits
Length of fractional part in 123.450000 = 2 digits
Length of fractional part in 123.450000 = 2 digits
Length of fractional part in 1234.000000 = 0 digits
Length of fractional part in 1234.001000 = 3 digits
Length of fractional part in -12.000000 = 0 digits

