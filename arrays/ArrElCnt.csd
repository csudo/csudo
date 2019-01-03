/****************************************************************************
kFound ArrElCnt kNeedle, iInArr[]
Returns a count of instances of kNeedle in iInArray
written by kevin welch

kNeedle - numeric value to search for
iInArr[] - input array to search through
kFound - count of instances found
****************************************************************************/

/****************************************************************************
kFound ArrElCnt kNeedle, kInArr[]
Returns a count of instances of kNeedle in iInArray
written by kevin welch

kNeedle - numeric value to search for
kInArr[] - input array to search through
kFound - count of instances found
****************************************************************************/

/****************************************************************************
iFound ArrElCnt iNeedle, iInArr[]
Returns a count of instances of kNeedle in iInArray
written by kevin welch

iNeedle - numeric value to search for
iInArr[] - input array to search through
iFound - count of instances found
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-n -m 0
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32

opcode ArrElCnt,k,ki[]
  kNeedle, iInArr[] xin
  kLen lenarray iInArr
  kIndx = 0
  kFound = 0
  while (kIndx<kLen) do
    if (kNeedle == iInArr[kIndx]) then
      kFound = kFound+1
    endif
    kIndx = kIndx+1
  od
  xout kFound
endop

opcode ArrElCnt,k,kk[]
  kNeedle, kInArray[] xin
  kLen lenarray kInArray
  kIndx = 0
  kFound = 0
  while (kIndx<kLen) do
    if (kNeedle == kInArray[kIndx]) then
      kFound = kFound+1
    endif
    kIndx = kIndx+1
  od
  xout kFound
endop

opcode ArrElCnt,i,ii[]
  iNeedle, iInArr[] xin
  iLen lenarray iInArr
  iIndex = 0
  iFound = 0
  while (iIndex<iLen) do
    if (iNeedle == iInArr[iIndex]) then
      iFound = iFound+1
    endif
    iIndex = iIndex+1
  od
  xout iFound
endop

; test 1 for irate needle, stack, and return count
instr 1
  iarray[] fillarray 4, 1, 2, 3, 4
    ; first a negative test
    prints "Test 1 - irate\n"
    ineedle=5
    itest1 ArrElCnt ineedle, iarray
    prints "negative test (should be 0): %d\n", itest1
    ; a positive test
    ineedle=3
    itest2 ArrElCnt ineedle, iarray
    prints "positive test (should be 1): %d\n", itest2
    ; double positive test
    ineedle=4
    itest3 ArrElCnt ineedle, iarray
    prints "multiples test (should be 2): %d\n", itest3
    turnoff
endin

; test 2 for krate needle and return count, irate stack,
instr 2
  iarray[] fillarray 4, 1, 2, 3, 4
    printks "Test 2 - mixed rate\n", 0
    ; first a negative test
    kneedle=5
    ktest1 ArrElCnt kneedle, iarray
    printks "mixed rate test 1 (should be 0): %d\n", 0, ktest1
    ; a positive test
    kneedle=3
    ktest2 ArrElCnt kneedle, iarray
    printks "mixed rate test 2 (should be 1): %d\n", 0, ktest2
    ; double positive test
    kneedle=4
    ktest3 ArrElCnt kneedle, iarray
    printks "mixed rate test 3 (should be 2): %d\n", 0, ktest3
    turnoff
endin

; test 3 for krate needle, stack, and return count
instr 3
  karray[] fillarray 4, 1, 2, 3, 4
    printks "Test 3 - krate\n", 0
    ; first a negative test
    kneedle=5
    ktest1 ArrElCnt kneedle, karray
    printks "krate test 1 (should be 0): %d\n", 0, ktest1
    ; a positive test
    kneedle=3
    ktest2 ArrElCnt kneedle, karray
    printks "krate test 2 (should be 1): %d\n", 0, ktest2
    ; double positive test
    kneedle=4
    ktest3 ArrElCnt kneedle, karray
    printks "krate test 3 (should be 2): %d\n", 0, ktest3
    turnoff
endin

</CsInstruments>  
<CsScore>
i1 0 .1
i2 .2 .1
i3 .4 .1
</CsScore>
</CsoundSynthesizer>
prints:
Test 1 - irate
negative test (should be 0): 0
positive test (should be 1): 1
multiples test (should be 2): 2
Test 2 - mixed rate
mixed rate test 1 (should be 0): 0
mixed rate test 2 (should be 1): 1
mixed rate test 3 (should be 2): 2
Test 3 - krate
krate test 1 (should be 0): 0
krate test 2 (should be 1): 1
krate test 3 (should be 2): 2


