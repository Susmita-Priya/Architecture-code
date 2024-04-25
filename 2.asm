.data
	msg: .asciiz "Enter 5 elements:\n"
	space: .asciiz " "
	array: .word 0:5
.text 
main:
	li $v0,4
	la $a0,msg
	syscall
	
	la $t0,array
	li $t1,0
	li $t2,5
	li $t4,2
	li $t6,0
for:
	beq $t1,$t2,set_t
	
	li $v0,5
	syscall
	move $t3,$v0
	
	sw $t3,($t0)
	addi $t1,$t1,1
	addi $t0,$t0,4
	
	j for
set_t:
	li $t1,0
	li $t2,5
	subi $t0,$t0,20
	
find_odd:
	beq $t1,$t2,end
	
	lw $t3,($t0)
	div $t3,$t4
	mfhi $t5
	
	bnez  $t5,odd
	next:
	      addi $t1,$t1,1
	      addi $t0,$t0,4
	j find_odd
odd:
	li $v0,1
	move $a0,$t3
	syscall
	
	li $v0,4
	la $a0,space
	syscall
	
	j next
end:
	li $v0,10
	syscall
