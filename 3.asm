.data
	msg: .asciiz "Enter 5 numbers:\n"
	array: .word 0:5
	msg1: .asciiz "Maximum number is: "
.text
main:
	li $v0,4
	la $a0,msg
	syscall
	la $t0,array
	li $t1,0
	li $t2,5
	li $t3,-10000000
loop:
	beq $t1,$t2,set_t
	li $v0,5
	syscall
	move $t4,$v0
	sw $t4,($t0)
	addi $t0,$t0,4
	addi $t1,$t1,1
	j loop
set_t:
	li $t1,0
	li $t2,5
	subi $t0,$t0,20
find_max:
	beq $t1,$t2,end
	lw $t5,($t0)
	bgt $t5,$t3,max
	next:
	addi $t0,$t0,4
	addi $t1,$t1,1
	j find_max
max:
	move $t3,$t5
	j next
end:
	li $v0,4
	la $a0,msg1
	syscall
	li $v0,1
	move $a0,$t3
	syscall
	li $v0,10
	syscall	
	


