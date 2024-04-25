.data 
	message : .asciiz "Hello World"
.text 
main :
#print string

	li $v0,4
	la $a0,message
	syscall
	
#exit	
	 li $v0,10 
	 syscall