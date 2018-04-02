/****************************************************************************
iEl ArrRndEl iInArr[] [, iStart [, iEnd]]
kEl ArrRndEl kInArr[] [, kStart [, kEnd]]
Returns a random element of an array, or of a part of the array.
As the random opcode is used, make sure to have set the global seed to zero to get always changing results.
written by joachim heintz

i(k)InArr[] - input array
i(k)Start - first index in i(k)InArr to use (default = 0)
iEnd - last index in iInArr to use (default = -1: whole length)
kEnd - last index in kInArr to use (default = 0.5: whole length)
i(k)El - random element of array
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
 iLen lenarray (iInArr)
 iEnd = (iEnd == -1) ? iLen-1 : iEnd
 iElIndx random iStart, iEnd+0.999
 iEl = iInArr[int(iElIndx)]
 xout iEl
endop

opcode ArrRndEl, k, k[]OV
 kInArr[], kStart, kEnd xin
 kLen lenarray (kInArr)
 kEnd = (kEnd == 0.5) ? kLen-1 : kEnd
 kElIndx random kStart, kEnd+0.999
 kEl = kInArr[int(kElIndx)]
 xout kEl
endop



;create i- and k-array
giArr[]     fillarray  1, 2, 3, 4, 5
gkArr[]     fillarray  11, 12, 13, 14, 15

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

</CsInstruments>
<CsScore>
i "El_i"  0 .1
i "El_k" .1 .1

</CsScore>
</CsoundSynthesizer>

prints (as one possibility):

I-ARRAYS
Using default values
  Random element 1: 1
  Random element 2: 2
  Random element 3: 3
  Random element 4: 2
  Random element 5: 5
Start index = 2
  Random element 1: 3
  Random element 2: 5
  Random element 3: 3
  Random element 4: 4
  Random element 5: 4
Start index = 2, End index = 3
  Random element 1: 3
  Random element 2: 3
  Random element 3: 4
  Random element 4: 3
  Random element 5: 3

K-ARRAYS
Using default values
  Random element 1: 12
  Random element 2: 13
  Random element 3: 13
  Random element 4: 11
  Random element 5: 15
Using different start indices
  Start index = 2, random element: 14
  Start index = 3, random element: 15
  Start index = 2, random element: 15
  Start index = 3, random element: 14
  Start index = 2, random element: 13
Using different end indices
  End index = 1, random element: 11
  End index = 1, random element: 11
  End index = 1, random element: 11
  End index = 2, random element: 12
  End index = 2, random element: 13
Using different indices but same for start and end
  Start and end index = 3, random element: 14
  Start and end index = 1, random element: 12
  Start and end index = 3, random element: 14
  Start and end index = 3, random element: 14
  Start and end index = 0, random element: 11

