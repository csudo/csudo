/****************************************************************************
iPeak TbPeak ift [, indxstrt [, indxend]]
Returns the peak (highest absolute number) value of a function table.

Returns the peak value of a function table, or a part of it, in a range between indxstart (included, defaults to zero) and indxend (excluded, defaults to table length). The return value is always positive.
written by joachim heintz

ift - function table
indxstart - starting index in ift to look for ival (default=0)
indxend - position after the last index which is tested (default = -1 = length of the table). if a number is given for indxend which exceeds the length of the function table, it will stop at table end
iPeak - peak value as absolute number
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>
ksmps = 32

  opcode TbPeak, i, ioj
ift, indxstrt, indxend xin
indxend   =         (indxend == -1 ? ftlen(ift) : indxend)
iPeak     =         0
while indxstrt < indxend do
  iVal = abs(table:i(indxstrt, ift))
  iPeak = iVal > iPeak ? iVal : iPeak
  indxstrt += 1
od
     xout      iPeak
  endop

instr 1
iftest    ftgen     0, 0, -7, -2, 1, 2.2, -3.3, 4, 5, 6, 7
iPeak     TbPeak    iftest
          print     iPeak
iPeak1    TbPeak    iftest, 2
          print     iPeak1
iPeak2    TbPeak    iftest, 0, 3
          print     iPeak2
endin

</CsInstruments>
<CsScore>
i 1 0 0
</CsScore>
</CsoundSynthesizer>

