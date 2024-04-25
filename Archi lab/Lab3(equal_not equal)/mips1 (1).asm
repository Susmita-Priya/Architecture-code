.data
	num1: .asciiz "Enter first number:"
	num2: .asciiz "Enter second number:"
	equal: .asciiz "Equal"
	notequal: .asciiz "Not Equal"
	
.text 
main: 
	li $v0, 4
	la $a0, num1
	syscall
	
	#input 1st number
	li $v0, 5
	syscall
	move $t1, $v0
	
	li $v0, 4
	la $a0, num2
	syscall
	
	#input 2nd number
	li $v0, 5
	syscall
	move $t2, $v0
	
	#compare
	beq $t1, $t2 Equal
	j Not_Equal

	Equal: 
		li $v0, 4
		la $a0, equal 
		syscall
		j Exit
	
	Not_Equal: 
		li $v0, 4
		la $a0, notequal 
		syscall
	
	Exit: 
		li $v0, 10
		syscall	
		
	