.data
	var: .word 23
.text
main:
	li $v0,1
	lw $t0,var
	move $a0,$t0
	syscall         # print 23
	
	li $t1,5
	sw $t1,var
	lw $t2,var
	move $a0,$t2
	syscall        #print 5