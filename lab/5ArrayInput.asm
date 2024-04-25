.data
	array: .word 0:100 # array of 100 integers
	comma: .asciiz " , "
	print: .asciiz "The Array: "
 .text

	li $v0, 4
	la $a0, print
	syscall 
 
 li $t0, 0               # $t0 is the loop induction variable
 li $t5, 100             # $t5 is the sentinal value for the loop
 la $t1, array           # $t1 starts as the base address of the array
                         # and is the address of each element
 li $t4, 1               # $t4 is the value 18, to be put in desired element

for: 
	bge $t0, $t5, end_for
	 sw $t4, ($t1)
	 add $t1, $t1, 4     # get address of next array element
 	add $t0, $t0, 1     # increment loop induction variable

 #print array element
         li $v0, 1
	move $a0, $t4
	syscall
#Printing comma	
 	li $v0, 4
	la $a0, comma
	syscall 
		
addi $t4, $t4, 1	#incrementing array element value
 b for
end_for:

	exit:
	li $v0, 10
	syscall