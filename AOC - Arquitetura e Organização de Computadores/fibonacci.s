.text
.globl main


# $s1 = n
# $s2 = 1
# $s0 = count

# 0 = $zero
# 1 = $s2
# 1 = $s3
# iterativo = $s4

main:
	addi $s2, $s2, 1
	addi $s3, $s3, 1
	li $v0, 5 
	syscall
	beq $v0, $zero, zero
	beq $v0, $s2, zero
	addi $s1, $v0, -1 # move o valor lido para $s1
	j loop
zero:
	addi $a0, $s2, 0
	li $v0, 1
	syscall
	j end
loop:
	beq $s0, $s1, print
	add $s4, $s2, $s3 # $s4 = $s2 + $s3
	addi $s2, $s3, 0
	addi $s3, $s4, 0
	addi $s0, $s0, 1 # count++
	j loop
print:	
	addi $a0, $s4, 0
	li $v0, 1
	syscall
end:
	li $v0, 10
	syscall

