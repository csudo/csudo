/****************************************************************************
iOutArr[] ArrSrti_simp iInArr[]
Sorts the content of iInArr[] and returns the sorted array as iOutArr[].
This is a simple version of ArrSrti.
written by joachim heintz

iInArr[] - array to sort
iOutArr[] - sorted array
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>
ksmps = 32

  opcode ArrSrti_simp, i[], i[]
iInArr[] xin    
iOutArr[]  init       lenarray(iInArr)
iMax       maxarray   iInArr
iIndx      =          0
 until iIndx == lenarray(iInArr) do
iMin, iMinIndx minarray iInArr
iOutArr[iIndx] =      iInArr[iMinIndx]
iInArr[iMinIndx] =    iMax+1
iIndx      +=         1
 enduntil
           xout       iOutArr
  endop


instr 1
iArr[]     fillarray  1, -4, 19, 3, 2
iSorted[]  ArrSrti_simp iArr
iPrint     =          0
until iPrint == lenarray(iSorted) do
           printf_i   "iSorted[%d] = %d\n", iPrint+1, iPrint, iSorted[iPrint]
iPrint     +=         1
enduntil
           turnoff
endin


</CsInstruments>
<CsScore>
i 1 0 1
</CsScore>
</CsoundSynthesizer>
returns:
iSorted[0] = -4
iSorted[1] = 1
iSorted[2] = 2
iSorted[3] = 3
iSorted[4] = 19

