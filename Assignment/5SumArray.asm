# Name: Susmita Rani Saha
# ID : B-180305047
.data
	msg: .asciiz "Enter 10 values:\n"
	array: .word 0:10
	msg1: .asciiz "Sum is: "
.text 
main:
	li $v0,4
	la $a0,msg
	syscall
	
	li $t0,0
	li $t1,10
	la $t2,array
	li $a1,0
	
#Taking input	
for:
	beq $t0,$t1,set_t
	
	li $v0,5
	syscall
	move $t3,$v0
	
	sw $t3,($t2)
	addi $t2,$t2,4
	addi $t0,$t0,1
	
	j for

set_t:
	li $t0,0
	li $t1,10
	subi $t2,$t2,40

# For sum
sum:
	beq $t0,$t1,end
	
	lw $t5,($t2)
	add $a1,$a1,$t5
	addi $t2,$t2,4
	addi $t0,$t0,1
	
	j sum	
end:
	li $v0,4
	la $a0,msg1
	syscall
	
	li $v0,1
	move $a0,$a1
	syscall
	
	li $v0,10
	syscall	
