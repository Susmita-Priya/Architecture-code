.data
	msg0: .asciiz "Enter any number:"
	msg: .asciiz "Positive"
	msg1: .asciiz "negative"
.text 
main:
	li $v0,4
	la $a0,msg0
	syscall

#input
	li $v0,5
	syscall 
	move $s0,$v0	

#check
	bgez $s0,pos
	blt $s0,0,nega 
   pos:
         li $v0,4
         la $a0,msg
         syscall 
         j exit
  nega:
         li $v0,4
         la $a0,msg1
         syscall
  exit:
  	li $v0,10
  	syscall
