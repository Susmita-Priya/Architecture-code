.data
	comma: .asciiz ", "
	sum: .asciiz "\nSum is: "
.text 
main:
#initialization
	li $t0,1
	j for_loop
	
#condition
	for_loop:
		bgt $t0,10,exit

#print number	
	li $v0,1
	move $a0,$t0
	syscall

#sum
	add $t1,$t1,$t0
		
#no comma after last number
   	beq $t0,10,exit

#print comma
	li $v0,4
	la $a0,comma
	syscall
	
#increment
	addi $t0,$t0,1
	j for_loop
#exit
	exit:
		li $v0,4
		la $a0,sum
		syscall
		
		li $v0,1
		move $a0,$t1
		syscall
		
		li $v0,10
		syscall