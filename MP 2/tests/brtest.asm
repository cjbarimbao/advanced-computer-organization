ld x6,0(x0)
ld x21,8(x0)
ld x22,8(x0)
ld x23,16(x0)
addi x0, x0, 0
addi x0, x0, 0
beq x21,x22, 16
addi x0, x0, 0
addi x0, x0, 0
add x6,x6,x6
sd x6,24(x0)
beq x21,x23, 16
addi x0, x0, 0
addi x0, x0, 0
add x6,x6,x6
addi x0, x0, 0
addi x0, x0, 0
addi x0, x0, 0
sd x6,32(x0)
bne x22,x23, 16
addi x0, x0, 0
addi x0, x0, 0
add x6,x6,x6
sd x6,40(x0)
bne x22,x21, 16
addi x0, x0, 0
addi x0, x0, 0
add x6,x6,x6
addi x0, x0, 0
addi x0, x0, 0
addi x0, x0, 0
sd x6,48(x0)