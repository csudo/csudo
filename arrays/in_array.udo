; search array for value, return number of instances found
; inputs: kneedle, ihaystack[]
; outputs: kfound
opcode in_array,k,ki[]
  kval, iarray[] xin
  klen lenarray iarray
  kptr = 0
  kfound = 0
  while (kptr<klen) do
    if (kval == iarray[kptr]) then
      kfound = kfound+1
    endif
    kptr = kptr+1
  od
  xout kfound
endop
