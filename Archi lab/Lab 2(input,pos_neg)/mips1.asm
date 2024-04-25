.data 
	msg1: .asciiz "Enter any integer number:"
	msg2: .asciiz "Your number is:"
	
.text
main: 
	li $v0, 4
	la $a0, msg1
	syscall
	
# integer read
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, msg2 
	syscall
#integer print

	li $v0, 1
	move $a0, $s0
	syscall

#exit	
	li $v0, 10
	syscall