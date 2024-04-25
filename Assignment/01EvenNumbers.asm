# Name: Susmita Rani Saha
# ID : B-180305047
.data
	msg: .asciiz "Enter 10 elements:\n"
	msg1: .asciiz "Even Numbers : "
	comma: .asciiz ", "
	array: .word 0:10
.text 
main:
	li $v0,4
	la $a0,msg
	syscall
	
	la $t0,array    
	li $t1,0        
	li $t2,10
	li $t4,2       
	li $t6,0
#Taking input	
loop:
	beq $t1,$t2,set_t    
	
	li $v0,5                
	syscall
	move $t3,$v0
	
	sw $t3,($t0)            	
	addi $t0,$t0,4	      	
	addi $t1,$t1,1          
	
	j loop
	
set_t:
	li $t1,0
	li $t2,10
	subi $t0,$t0,40
	
#Finding even numbers	
find_even:
	beq $t1,$t2,end   

	lw $t3,($t0)
	div $t3,$t4
	mfhi $t5
	
	beqz $t5,even
	next:
	     addi $t0,$t0,4
	     addi $t1,$t1,1
	
	j find_even
	
even:
	beqz $t6,print
	
	li $v0,4
	la $a0,comma
         syscall
         
	li $v0,1
	move $a0,$t3
	syscall
   
	j next
print:
	li $v0,4
	la $a0,msg1
	syscall
	
	li $v0,1
	move $a0,$t3
	syscall
	
	addi $t6,$t6,1 
	
	j next
			
end:
	li $v0,10
	syscall




				
