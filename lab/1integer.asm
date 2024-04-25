.data
	i: .word 30
.text 
main:
	lw $t0,i
	li $v0,1
	move $a0,$t0
	syscall