# arithmetic.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# 1. Prompt the user for 3 inputs: a, b, c
# 2. Calculate 32*(a - 4*b) + 7*c using only one mult instruction
# 3. Print out the result

.text
main:
	

	# TODO: Write your code here
	# get a
	li $v0, 5
	syscall
	# store a in t0
	move $t0, $v0

	# get b
	li $v0, 5
	syscall
	# store b in t1
	move $t1, $v0

	# get c
	li $v0, 5
	syscall
	# store c in t2
	move $t2, $v0

	# t3 = a - 4*b
	sll $t1, $t1, 2
	sub $t3, $t0, $t1

	# t3 = 32*t3
	sll $t3, $t3, 5

	# t4 = 7*c
	li $t4, 7
	mult $t2, $t4
	mflo $t4

	# t4 = t3 + t4
	add $t4, $t3, $t4

#Printing!
    li $v0, 1
    move $a0, $t4
    syscall

# Exit properly!
exit:
	# Exit SPIM: Write your code here!
	li $v0, 10
    syscall

