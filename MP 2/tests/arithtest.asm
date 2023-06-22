ld x20, 0(x0)
ld x21, 8(x0)
addi x0, x0, 0
addi x0, x0, 0
addi x0, x0, 0
add x22, x20, x21
sub x23, x20, x21
and x24, x20, x21
or x25, x20, x21
xor x26, x20, x21
slt x27, x20, x21
slt x28, x21, x20
addi x29, x20, 100
addi x30, x20, -100
sd x22, 16(x0)
sd x23, 24(x0)
sd x24, 32(x0)
sd x25, 40(x0)
sd x26, 48(x0)
sd x27, 56(x0)
sd x28, 64(x0)
sd x29, 72(x0)
sd x30, 88(x0)
