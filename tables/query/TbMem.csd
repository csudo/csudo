/****************************************************************************
ipos TbMem ival, ift [, indxstrt [, indxend]]
Looks whether a number is in a function table

Looks whether a number is a member of a function table, in a range between indxstart (included) and indxend (excluded). Returns the position of the element if found, or -1 otherwise.
written by joachim heintz

ival - element (number) to be looked for
ift - function table
indxstart - starting index in ift to look for ival (default=0)
indxend - position after the last index which is tested (default = -1 = length of the table). if a number is given for indxend which exceeds the length of the function table, an error occurs
ipos - if ival has been found in ift, the position of the first occurence is returned, or -1, if ival has not been found
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-n
</CsOptions>
<CsInstruments>

  opcode TbMem, i, iioj
ival, ift, indxstrt, indxend xin
indxend   =         (indxend == -1 ? ftlen(ift) : indxend)
ipos      =         -1
loop:
iftel     tab_i     indxstrt, ift
  if iftel == ival then
ipos      =         indxstrt
          igoto     end  
  endif
          loop_lt   indxstrt, 1, indxend, loop
end:      xout      ipos
  endop

instr 1
iftest    ftgen     0, 0, -7, -2, 1, 2.2, -3.3, 4, 5, 6, 7
itest1    TbMem     1, iftest ;yes (pos0)
          print     itest1
itest2    TbMem     2.2, iftest ;yes (pos1)
          print     itest2
itest3    TbMem     -3.3, iftest ;yes (pos2)
          print     itest3
itest4    TbMem     -3.33, iftest ;no
          print     itest4
itest5    TbMem     -3.3, iftest, 3 ;no (because indxstrt is too large)
          print     itest5
itest6    TbMem     7, iftest, 3 ;yes (pos6)
          print     itest6
itest7    TbMem     7, iftest, 3, 5 ;no (because indxend is too small)
          print     itest7
itest8    TbMem     7.1, iftest, 0, 8 ;error
          print     itest8
endin

</CsInstruments>
<CsScore>
i 1 0 0
</CsScore>
</CsoundSynthesizer>

