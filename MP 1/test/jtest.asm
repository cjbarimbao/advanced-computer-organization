ld x20,8(x0)
add x10,x0,x0
jal x0,28
ld x10,0(x0)
add x10,x11,x10
add x10,x10,x10
add x10,x10,x10
add x1,x0,x20
jalr x0,-8(x1)
ld x11,0(x0)
sd x11,24(x0)
jal x1,-28
sd x10,16(x0)