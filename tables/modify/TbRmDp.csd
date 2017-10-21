/****************************************************************************
iend TbRmDp iftsrc, iftdst [, ioffset [, inumels]]
Removes duplicates from a function table

Removes duplicates from a function table, copies the elements in a new table, and returns the end position (which can be used to build a table with just these elements).
Requires the UDO TbMem
written by joachim heintz

iftsrc - source function table
iftdst - table (usually with the same length as iftsrc) for copying the non-duplicated elements of iftsrc
ioffset - index to start copying of elements in iftsrc
inumels - number of elements to investigate
iend - position after the last index which has been written in iftdest
****************************************************************************/


<CsoundSynthesizer>
<CsOptions>
-n -m0
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
  
  opcode TbRmDp, i, iioj
iftsrc, iftdst, ioffset, inumels xin
;copy first element
ifirst    tab_i     ioffset, iftsrc
          tabw_i    ifirst, 0, iftdst
;calculate border in iftsrc
iftlen    tableng   iftsrc
ireadend  =         (inumels == -1 || ioffset+inumels > iftlen ? iftlen : inumels+ioffset)
;compare each element with all already written in iftdst
;and add to iftdst if not already there
ireadindx =         ioffset+1
iwritindx =         1
loop:
iel       tab_i     ireadindx, iftsrc
itest     TbMem     iel, iftdst, 0, iwritindx
 if itest == -1 then
          tabw_i    iel, iwritindx, iftdst
iwritindx =         iwritindx + 1
 endif
          loop_lt   ireadindx, 1, ireadend, loop
          xout      iwritindx
  endop
  
  opcode TbNwPt, i, iioo
;copies ihowmany values starting from index istrtindx in isrc to a new function table (starting at index istrtwrite which defaults to 0) and returns its number
isrc, ihowmany, istrtindx, istrtwrite xin
icop      ftgen     0, 0, -(ihowmany + istrtwrite), -2, 0
ireadindx =         istrtindx
loop:
ival      tab_i     ireadindx, isrc
          tabw_i    ival, istrtwrite, icop
istrtwrite =        istrtwrite + 1
          loop_lt   ireadindx, 1, istrtindx+ihowmany, loop
          xout      icop
  endop


  opcode TbDmpSmpS, 0, iiSo
;prints the content of a table in a simple way, with an additional string as 'introduction'
ifn, iprec, String, ippr xin; function table, float precision while printing, String, parameters per row (maximum = 32)
ippr      =         (ippr == 0 ? 10 : ippr)
iend      =         ftlen(ifn)
indx      =         0
Sformat   sprintf   "%%.%df, ", iprec
Sdump     sprintf   "%s[", String
loop:
ival      tab_i     indx, ifn
Snew      sprintf   Sformat, ival
Sdump     strcat    Sdump, Snew
imod      =         (indx+1) % ippr
 if imod == 0 && indx != iend-1 then
          puts      Sdump, 1
Sdump     =         ""
 endif
          loop_lt   indx, 1, iend, loop
ilen      strlen    Sdump
Slast     strsub    Sdump, 0, ilen-2
		printf_i	"%s]\n", 1, Slast
  endop

instr 1
ift       ftgen     0, 0, -10, -2, 1, -1, 2, 1, -1, 0, -1.234, 2.345, 0, 2.345
icopy     ftgen     0, 0, -10, -2, 0
          TbDmpSmpS ift, 3, "\nsource function table:\n"
          
iend      TbRmDp    ift, icopy ;remove duplicates
ires      TbNwPt    icopy, iend ;copy into a new table
          TbDmpSmpS ires, 3, "\nioffset = 0, inumels = -1 (all):\n"
          
iend      TbRmDp    ift, icopy, 1
ires      TbNwPt    icopy, iend
          TbDmpSmpS ires, 3, "\nioffset = 1, inumels = -1 (all):\n"

iend      TbRmDp    ift, icopy, 5
ires      TbNwPt    icopy, iend
          TbDmpSmpS ires, 3, "\nioffset = 5, inumels = -1 (all):\n"
          
iend      TbRmDp    ift, icopy, 0, 5
ires      TbNwPt    icopy, iend
          TbDmpSmpS ires, 3, "\nioffset = 0, inumels = 5:\n"
          
iend      TbRmDp    ift, icopy, 2, 5
ires      TbNwPt    icopy, iend
          TbDmpSmpS ires, 3, "\nioffset = 2, inumels = 5:\n"
          prints    "\n"
endin

</CsInstruments>
<CsScore>
i 1 0 0
</CsScore>
</CsoundSynthesizer>

