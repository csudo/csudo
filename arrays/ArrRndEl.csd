/****************************************************************************
iEl ArrRndEl iInArr[] [, iStart [, iEnd]]
kEl ArrRndEl kInArr[] [, kStart [, kEnd]]
SEl ArrRndEl SInArr[] [, iStart [, iEnd]]
Returns a random element of an array, or of a part of the array.
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.
written by joachim heintz

i(kS)InArr[] - input array
i(k)Start - first index in i(kS)InArr to use (default = 0)
iEnd - last index in i(S)InArr to use (default = -1: whole length)
kEnd - last index in kInArr to use (default = 0.5: whole length)
i(kS)El - random element of array
****************************************************************************/

<CsoundSynthesizer>
<CsOptions>
-nm0
</CsOptions>
<CsInstruments>
ksmps = 32
seed 0

opcode ArrRndEl, i, i[]oj
 iInArr[], iStart, iEnd xin
 iLen lenarray iInArr
 iEnd = (iEnd == -1) ? iLen-1 : iEnd
 iElIndx random iStart, iEnd+0.999
 iEl = iInArr[int(iElIndx)]
 xout iEl
endop

opcode ArrRndEl, k, k[]OV
 kInArr[], kStart, kEnd xin
 kLen lenarray kInArr
 kEnd = (kEnd == 0.5) ? kLen-1 : kEnd
 kElIndx random kStart, kEnd+0.999
 kEl = kInArr[int(kElIndx)]
 xout kEl
endop

opcode ArrRndEl, S, S[]oj
 SInArr[], iStart, iEnd xin
 iLen lenarray SInArr
 iEnd = (iEnd == -1) ? iLen-1 : iEnd
 iElIndx random iStart, iEnd+0.999
 SEl = SInArr[int(iElIndx)]
 xout SEl
endop



;create arrays
giArr[]     fillarray  1, 2, 3, 4, 5
gkArr[]     fillarray  11, 12, 13, 14, 15
gSArr[]     fillarray  "alpha", "beta", "gamma", "delta", "oops"

instr El_i
//get five random elements for different settings and print

 puts "\nI-ARRAYS",1
 
 indx = 0
 puts "Using default values", 1
 while indx < 5 do
  iRndEl ArrRndEl giArr
  prints "  Random element %d: %d\n", indx+1, iRndEl
  indx += 1
 od

 indx = 0
 puts "Start index = 2", 1
 while indx < 5 do
  iRndEl ArrRndEl giArr, 2
  prints "  Random element %d: %d\n", indx+1, iRndEl
  indx += 1
 od
 
 indx = 0
 puts "Start index = 2, End index = 3", 1
 while indx < 5 do
  iRndEl ArrRndEl giArr, 2, 3
  prints "  Random element %d: %d\n", indx+1, iRndEl
  indx += 1
 od

endin

instr El_k
//get for each five k-cycles random elements for different settings and print

 puts "\nK-ARRAYS",1
 kndx init 0
 
 if timeinstk() < 6 then
  printks "Using default values\n", 1
  kRndEl ArrRndEl gkArr
  printf "  Random element %d: %d\n", kndx+1, kndx+1, kRndEl

 elseif timeinstk() < 11 then
  printks "Using different start indices\n", 1
  kStart = int(random:k(2,4))
  kRndEl ArrRndEl gkArr, kStart
  printf "  Start index = %d, random element: %d\n", kndx+1, kStart, kRndEl

 elseif timeinstk() < 16 then
  printks "Using different end indices\n", 1
  kEnd = int(random:k(1,3))
  kRndEl ArrRndEl gkArr, 0, kEnd
  printf "  End index = %d, random element: %d\n", kndx+1, kEnd, kRndEl

 elseif timeinstk() < 21 then
  printks "Using different indices but same for start and end\n", 1
  kStartEnd = int(random:k(0,5))
  kRndEl ArrRndEl gkArr, kStartEnd, kStartEnd
  printf "  Start and end index = %d, random element: %d\n", kndx+1, kStartEnd, kRndEl
  
 else
  turnoff
 endif
 
 kndx += 1
 
endin

instr El_S

 puts "\nS-ARRAYS",1
 
 indx = 0
 puts "Using default values", 1
 while indx < 5 do
  SRndEl ArrRndEl gSArr
  printf_i "  Random element %d: %s\n", indx+1, indx+1, SRndEl
  indx += 1
 od

 indx = 0
 puts "Start index = 2", 1
 while indx < 5 do
  SRndEl ArrRndEl gSArr, 2
  printf_i "  Random element %d: %s\n", indx+1, indx+1, SRndEl
  indx += 1
 od
 
 indx = 0
 puts "Start index = 2, End index = 3", 1
 while indx < 5 do
  SRndEl ArrRndEl gSArr, 2, 3
  printf_i "  Random element %d: %s\n", indx+1, indx+1, SRndEl
  indx += 1
 od

endin


</CsInstruments>
<CsScore>
i "El_i"  0 .1
i "El_k" .1 .1
i "El_S" .2 .1
</CsScore>
</CsoundSynthesizer>

prints (as one possibility):

I-ARRAYS
Using default values
  Random element 1: 4
  Random element 2: 1
  Random element 3: 3
  Random element 4: 2
  Random element 5: 1
Start index = 2
  Random element 1: 3
  Random element 2: 3
  Random element 3: 4
  Random element 4: 4
  Random element 5: 4
Start index = 2, End index = 3
  Random element 1: 3
  Random element 2: 4
  Random element 3: 3
  Random element 4: 3
  Random element 5: 3

K-ARRAYS
Using default values
  Random element 1: 12
  Random element 2: 12
  Random element 3: 15
  Random element 4: 13
  Random element 5: 13
Using different start indices
  Start index = 2, random element: 15
  Start index = 3, random element: 14
  Start index = 3, random element: 15
  Start index = 3, random element: 14
  Start index = 2, random element: 15
Using different end indices
  End index = 2, random element: 13
  End index = 1, random element: 12
  End index = 2, random element: 12
  End index = 1, random element: 12
  End index = 1, random element: 12
Using different indices but same for start and end
  Start and end index = 2, random element: 13
  Start and end index = 2, random element: 13
  Start and end index = 0, random element: 11
  Start and end index = 4, random element: 15
  Start and end index = 1, random element: 12

S-ARRAYS
Using default values
  Random element 1: oops
  Random element 2: gamma
  Random element 3: beta
  Random element 4: gamma
  Random element 5: alpha
Start index = 2
  Random element 1: oops
  Random element 2: delta
  Random element 3: delta
  Random element 4: oops
  Random element 5: oops
Start index = 2, End index = 3
  Random element 1: delta
  Random element 2: gamma
  Random element 3: gamma
  Random element 4: gamma
  Random element 5: delta

