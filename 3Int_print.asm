.data
	i : .word 3
.text 
main:
	li $v0,1
	lw $s0,i
	move $a0,$s0
	syscall 
	
	li $v0,10
	syscall
