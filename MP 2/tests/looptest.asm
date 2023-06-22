ld x15,0(x0)
ld x16,8(x0)
ld x17,8(x0)
add x20,x0,x0
addi x0,x0,0
addi x0,x0,0
addi x0,x0,0
loop1:
add x20,x20,x15
addi x16,x16,-1
addi x0,x0,0
addi x0,x0,0
addi x0,x0,0
bne x16,x0,loop1
addi x0,x0,0
addi x0,x0,0
sd x20,16(x0)
add x21,x0,x0
add x22,x0,x0
addi x0,x0,0
addi x0,x0,0
addi x0,x0,0
loop2:
beq x22,x17,exit
addi x0,x0,0
addi x0,x0,0
add x21,x21,x15
addi x22,x22,1
jal x23,loop2
addi x0,x0,0
addi x0,x0,0
exit:
sd x21,24(x0)
