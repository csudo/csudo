/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN tables/read:
*****************************************************************************
TbToLin    : kLin TbToLin iFt
*****************************************************************************
****************************************************************************/

/****************************************************************************
kLin TbToLin iFt
Reads a table in the same way as a linseg opcode

Reads a table which contains segments of value - duration - value in the same way as a linseg opcocde would do.
written by joachim heintz

iFt - a function table, usually generated with GEN02 and not normaized
kLin - k-rate output
****************************************************************************/

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
           timout     0, iDur, go
           reinit     segment
go:
kOut       linseg     iStart, iDur, iTarget
indx1      =          indx1+2
indx2      =          indx2+2
indx3      =          indx3+2
end:
           xout       kOut
  endop


