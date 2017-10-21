/****************************************************************************
iFt Sinc iStart, iEnd [,iSize [,iFtNo]]
Creates a table with a sinc function.

Creates a table containing the values of a sinc function f(x)/x from x between start and end, with a table size of 4096 as default. Returns the table number which is by default generated by Csound, but can also be assigned by an input.
written by joachim heintz

iStart - lowest x value for sinc function
iEnd - highest x value for sinc function
iSize - size of the function table generated (default 4096 points)
iFtNo - number of the generated table (default 0: generated by Csound)
iFt - the number of the table 
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>
ksmps = 32

opcode Sinc, i, iioo
 iStart, iEnd, iSize, iFtNo xin
 iFt ftgen 0, 0, -iSize, 2, 0
 iRange = iEnd - iStart
 iCnt = 0
 while iCnt < iSize do
  iX = iRange/(iSize-1) * iCnt + iStart
  iY = (iX == 0 ? 1 : sin(iX) / iX)
  tablew iY, iCnt, iFt
  iCnt += 1
 od
 xout iFt
endop

instr test
 
 iTable Sinc -4*$M_PI, 4*$M_PI, 51
 prints "Table number = %d\n", iTable
 prints "Table size = %d\n", ftlen(iTable)
 prints "Table values:\n"
 indx = 0
 while indx < ftlen(iTable) do
  printf_i "  Index %2d: Value = %9f\n", indx+1, indx, table:i(indx, iTable)
  indx += 1
 od

endin
 
</CsInstruments>
<CsScore>
i "test" 0 0
</CsScore>
</CsoundSynthesizer>
prints:
Table number = 101
Table size = 51
Table values:
  Index  0: Value = -0.000000
  Index  1: Value = -0.039934
  Index  2: Value = -0.073032
  Index  3: Value = -0.090251
  Index  4: Value = -0.085719
  Index  5: Value = -0.058468
  Index  6: Value = -0.013123
  Index  7: Value =  0.040687
  Index  8: Value =  0.090170
  Index  9: Value =  0.122137
  Index 10: Value =  0.126138
  Index 11: Value =  0.097276
  Index 12: Value =  0.038058
  Index 13: Value = -0.041229
  Index 14: Value = -0.123806
  Index 15: Value = -0.189207
  Index 16: Value = -0.217133
  Index 17: Value = -0.191611
  Index 18: Value = -0.104623
  Index 19: Value =  0.041557
  Index 20: Value =  0.233872
  Index 21: Value =  0.450024
  Index 22: Value =  0.661837
  Index 23: Value =  0.839869
  Index 24: Value =  0.958418
  Index 25: Value =  1.000000
  Index 26: Value =  0.958418
  Index 27: Value =  0.839869
  Index 28: Value =  0.661837
  Index 29: Value =  0.450024
  Index 30: Value =  0.233872
  Index 31: Value =  0.041557
  Index 32: Value = -0.104623
  Index 33: Value = -0.191611
  Index 34: Value = -0.217133
  Index 35: Value = -0.189207
  Index 36: Value = -0.123806
  Index 37: Value = -0.041229
  Index 38: Value =  0.038058
  Index 39: Value =  0.097276
  Index 40: Value =  0.126138
  Index 41: Value =  0.122137
  Index 42: Value =  0.090170
  Index 43: Value =  0.040687
  Index 44: Value = -0.013123
  Index 45: Value = -0.058468
  Index 46: Value = -0.085719
  Index 47: Value = -0.090251
  Index 48: Value = -0.073032
  Index 49: Value = -0.039934
  Index 50: Value =  0.000000

