/****************************************************************************
iNum StrExpr2 iNum1, iNum2, iOp

Evaluates two numbers which are combined by the operator iOp.
written by joachim heintz

iNum1, iNum2 - numbers
iOp - 1 -> +, 2 -> -, 3 -> *, 4 -> /, 5 -> %, 6 -> ^
iNum - Result as number
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32


  opcode StrExpr2, i, iii
iNum1, iNum2, iOp xin
if iOp == 1 then
iNum = iNum1 + iNum2
elseif iOp == 2 then
iNum = iNum1 - iNum2
elseif iOp == 3 then
iNum = iNum1 * iNum2
elseif iOp == 4 then
iNum = iNum1 / iNum2
elseif iOp == 5 then
iNum = iNum1 % iNum2
elseif iOp == 6 then
iNum = iNum1 ^ iNum2
endif
xout iNum
  endop
  
instr 1
iNum      StrExpr2  2, 3, 1
          printf_i  "2 + 3 = %f\n", 1, iNum
iNum      StrExpr2  2, 3, 2
          printf_i  "2 - 3 = %f\n", 1, iNum
iNum      StrExpr2  2, 3, 3
          printf_i  "2 * 3 = %f\n", 1, iNum
iNum      StrExpr2  2, 3, 4
          printf_i  "2 / 3 = %f\n", 1, iNum
iNum      StrExpr2  2, 3, 5
          printf_i  "2 %% 3 = %f\n", 1, iNum
iNum      StrExpr2  2, 3, 6
          printf_i  "2 ^ 3 = %f\n", 1, iNum
endin 

</CsInstruments>
<CsScore>
i 1 0 .01 
</CsScore>
</CsoundSynthesizer>
returns:
2 + 3 = 5.000000
2 - 3 = -1.000000
2 * 3 = 6.000000
2 / 3 = 0.666667
2 % 3 = 2.000000
2 ^ 3 = 8.000000

