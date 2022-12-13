lw $1, 0x12
add $2, $0, $1
sw $2, 0x14
sub $3, $2, $2
jcz 0x0C
sw $0, 0x14     # should not execute
lw $3, 0x14
add $4, $3, $0
hlt