	.text
	.globl main
main:
	addi $sp, $sp, -8 # aloca espaço
	li $a0, 1
	sw $a0, 0($sp)
	li $a0, 2
	sw $a0, 4($sp)
	ori $a0, $zero, 3
	ori $a1, $zero, 4
	ori $a2, $zero, 5 # passa para a0
	ori $a3, $zero, 6
	jal folha # chama a função
	addi $sp, $sp, 8
	move $a0, $v0
	li $v0, 1
	syscall
end:
	li $v0, 10
	syscall
folha:
	lw $t0, 0($sp) # 1
	lw $t1, 4($sp) # 2
	
	addi $sp, $sp, -12 # aloca espaço
	sw $s2, 0($sp) # variável interna
	sw $s3, 4($sp)
	sw $s4, 8($sp)
	
	add $s2, $t0, $t1 # g + h
	add $s3, $a0, $a1 # i + j
	add $s4, $a2, $a3 # k + z
	sub $s2, $s2, $s3 # (g+h) - (i+j)
	mul $s3, $s4, 2 #TALVEZ ESTEJA ERRADO 2*(k+z)
	add $v0, $s2, $s3 # f = 18
	
	lw $s2, 0($sp)
	lw $s3, 4($sp)
	lw $s4, 8($sp)
	addi $sp, $sp, 12 #desaloca espaço
	jr $ra