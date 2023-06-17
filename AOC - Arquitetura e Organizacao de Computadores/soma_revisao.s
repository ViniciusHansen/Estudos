	.text
	.globl main
main:
	li $v0, 5
	syscall
	move $a0, $v0
	move $v0, $zero
	jal soma_base
	# print
	move $a0, $v0
	li $v0, 1
	syscall
end:
	li $v0, 10
	syscall
	
soma_base:
	bnez $a0, soma_recursao
	move $v0, $zero
	jr $ra
	
soma_recursao:
	# salva contexto
	addi $sp, $sp, -8
	sw $s0, 0($sp) # x
	sw $ra, 4($sp) 
	
	move $s0, $a0 # salva $a0
	addi $a0, $a0 , -1 # decrementa $a0
	jal soma_base 
	add $v0, $v0, $s0 # soma o valor de $s0 ao $v0 que vai ser retornado no final
	
	# restaura contexto
	lw $s0, 0($sp) 
	lw $ra, 4($sp) 
	addi $sp, $sp, 8
	
	jr $ra
	

	
	