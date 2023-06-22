ld x20,8(x0)
add x10,x0,x0
jal x0, jump1
addi x0, x0, 0
addi x0, x0, 0
ld x10,0(x0)
jump2:
add x10,x11,x10
addi x0, x0, 0
addi x0, x0, 0
addi x0, x0, 0
add x10,x10,x10
addi x0, x0, 0
addi x0, x0, 0
addi x0, x0, 0
add x10,x10,x10
addi x0, x0, 0
addi x0, x0, 0
addi x0, x0, 0
add x1,x0,x20
addi x0, x0, 0
addi x0, x0, 0
addi x0, x0, 0
jalr x0, 68(x1)
jump1:
ld x11,0(x0)
addi x0, x0, 0
addi x0, x0, 0
addi x0, x0, 0
sd x11,24(x0)
jal x1,jump2
addi x0, x0, 0
addi x0, x0, 0
sd x10,16(x0)
