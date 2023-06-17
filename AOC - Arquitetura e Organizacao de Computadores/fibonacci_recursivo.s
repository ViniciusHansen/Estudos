# colaboração com Amyr Allan e Anna Paula Mennegheli

.text
.globl main

main:
	li $v0, 5
	syscall
	move $a0, $v0
	move $v0, $zero
	jal recursion
end:
	move $a0, $v1
	li $v0, 1
	syscall # imprimir
	li $v0, 10
	syscall
recursion:
	# o indice de fibonacci desejado está em $a0
	
	# caso base
	blt $a0, 2, folha
	
	# salva contexto
	# guarda a0 na pilha para a próxima chamada recursiva
	addi $sp, $sp, -8
	sw $a0, 0($sp)
	sw $ra, 4($sp)
	
	# nós da esquerda
	# fibo(a0 -1)
	addi $a0, $a0, -1
	jal recursion
		
	# restaura contexto
	lw $a0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
		
	# nós da direita
	# fibo(ao-2)
	addi $a0, $a0, -2
	j recursion
	
	
folha:
	addi $v1, $v1, 1
	jr $ra

