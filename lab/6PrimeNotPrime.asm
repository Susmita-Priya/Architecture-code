.data
	msg: .asciiz "Enter any number:"
	msg1: .asciiz "Prime"
	msg2: .asciiz "Not Prime"
.text 
main:
#print msg
	li $v0,4
	la $a0,msg
	syscall
#take input
	li $v0,5
	syscall
	move $t0,$v0
#ckeck
	blez $t0,notprime
	beq $t0,1,notprime
	beq $t0,2,prime
	
	li $t1,2
	
	loop:
		beq $t0,$t1,prime
		
		div $t0,$t1
		mfhi $t2
		beqz $t2,notprime
		
		addi $t1,$t1,1
		
		j loop
	
#prime or not prime print
	prime:
		li $v0,4
		la $a0,msg1
		syscall
		j exit
	
	notprime:
		li $v0,4
		la $a0,msg2
		syscall
	
#exit
	exit:
		li $v0,10
		syscall	
	
