.data
	msg: .asciiz "Enter 5 numbers:\n"
	msg1: .asciiz "Minimum number is: "
	array: .word 0:5
.text 
main:
	li $v0,4
	la $a0,msg
	syscall
	
	la $t0,array
	li $t1,0
	li $t2,5
	li $t4,100000000
	
for:
	beq $t1,$t2,set_t
	li $v0,5
	syscall
	move $t3,$v0
	sw $t3,($t0)
	addi $t0,$t0,4
	addi $t1,$t1,1
	j for
	
set_t:
	li $t1,0
	li $t2,5
	subi $t0,$t0,20

find_min:
	beq $t1,$t2,end
	lw $t5,($t0)
	blt $t5,$t4,min
	next:
	     addi $t0,$t0,4
	     addi $t1,$t1,1
	j find_min     

min:
	move $t4,$t5
	j next
end:
	li $v0,4
	la $a0,msg1
	syscall	
	li $v0,1
	move $a0,$t4
	syscall	
	li $v0,10
	syscall	
