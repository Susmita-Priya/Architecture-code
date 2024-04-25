.data 
	msg1: .asciiz "Enter any integer number:"
	msg2: .asciiz "Your number is positive."
	msg3: .asciiz "Your number is negative. "
	
.text
main: 
	li $v0, 4
	la $a0, msg1
	syscall
	
# integer read
	li $v0, 5
	syscall
	move $s0, $v0
	
	addi $t2, $t2, 0
	slt $t0, $s0, $t2
	beq $t0, 0, pos
	
#negative
	li $v0, 4
	la $a0, msg3
	syscall
	
	j Exit
#positive 	
	pos: 
		li $v0, 4
		la $a0, msg2
		syscall	
Exit: 
	li $v0, 10
	syscall	