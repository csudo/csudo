/****************************************************************************
kLin TbToLin iFt
Reads a table in the same way as a linseg opcode

Reads a table which contains segments of value - duration - value in the same way as a linseg opcocde would do.

iFt - a function table, usually generated with GEN02 and not normaized
kLin - k-rate output
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

giLin1     ftgen      1, 0, -5, -2, 0, 3, 1, 2, 0
giLin2     ftgen      2, 0, -7, -2, -3, 1, 0, 5, 1, 1, 0

  opcode TbToLin, k, i
ift        xin
iftlen     tableng    ift
indx1      =          0
indx2      =          1
indx3      =          2
segment:
if indx3 >= iftlen igoto end
iStart     table      indx1, ift
iDur       table      indx2, ift
iTarget    table      indx3, ift
           timout     0, iDur, do
           reinit     segment
do:
kOut       linseg     iStart, iDur, iTarget
indx1      =          indx1+2
indx2      =          indx2+2
indx3      =          indx3+2
end:
           xout       kOut
  endop


instr test
kOut       TbToLin    p4
           printk     .5, kOut
endin
</CsInstruments>
<CsScore>
i "test" 0 6 1
i "test" 7 10 2
</CsScore>
</CsoundSynthesizer>
