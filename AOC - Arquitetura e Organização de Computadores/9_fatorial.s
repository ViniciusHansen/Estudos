# calcula 9! e armazena em $s0
.text
.globl main

main:
	li $v0, 5
	syscall
	addi $s1, $v0, 0 # move o valor lido para $s1
	#li $s1, 9
	li $s0, 1
sugugus:
	#mul $s0, $s0, $s1 # $s0 = $s0 * $s1 (32bits baixos) # multiplica do jeito plebeu
	
	mult $s0, $s1 # multiplica $s0 por $s1 e guarda nos registradores hi e lo, o hi contem o overflow
	mflo $v1 # move o valor do lo para $v1
	addi $s0, $v1, 0 # move o valor de v1 para s0
	subi $s1, $s1, 1 # $v1 = $v1 - 1
	bnez $s1, sugugus # se $s1 != 0 então va para: while
end:
	li $v0, 10
	syscall