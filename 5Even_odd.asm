.data
	msg: .asciiz "Enter any number:"
	msg1: .asciiz "Even"
	msg2: .asciiz "Odd"
.text
main:
	li $v0,4
	la $a0,msg
	syscall

	li $v0,5
	syscall
	move $s0,$v0
	
	move $t0,$s0
	li $t1,2
	div $t0,$t1
	mfhi $t2        # $t2=hi(modulas)
	beqz $t2,even
	bnez $t2,odd
	even:
	     li $v0,4
	     la $a0,msg1
	     syscall 
	     j exit
	odd:
	     li $v0,4
	     la $a0,msg2
	     syscall
	exit:
	     li $v0,10
	     syscall 