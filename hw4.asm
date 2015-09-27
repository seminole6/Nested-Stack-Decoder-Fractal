# Homework 4
# name: Devon Maguire
# sbuid: 109284550

.text
.globl main
main:
###############################################################################################################################
# Part 0
###############################################################################################################################
# Prompt and read a str of at most 50 characters from user (Input file name)
# Try to open InputFile if failure, prompt user and attempt again
# Prompt and read a str of at most 50 characters from user (Output file name)
# Open OutputFile, create if doesn't exist
# decode_message1(... , ...) - Part 1
# Close Input and Output file

fileLoop1:
	la $a0, inputFile	# load prompt for user's string
	li $v0, 4	# use syscall to print string
	syscall	# print the string
	
	la $a0, inputBuffer	# load buffer address
	li $a1, 50	# maximum number of chars to read
	li $v0, 8	# use syscall to read a string
	syscall	# read the string
	
	jal newlineReplace	# replaces the newline char in the input string to a null char
	
	la $a0, inputBuffer	# move the file name into $a0
	li $a1, 0	# load zero into $a1 to open the file with no flag
	li $v0, 13	# use syscall to open a file
	syscall	# open the file
	
	bltz $v0, fileLoop1	# if the file descriptor is negative, ask user for input again
	
	move $s0, $v0	# move the file descriptor into $s0
	
	la $a0, outputFile	# load prompt for user's string
	li $v0, 4	# use syscall to print the string
	syscall	# print the string
	
	la $a0, outputBuffer	# load buffer address
	li $a1, 50	# maximum number of chars to read
	li $v0, 8	# use the syscall to read a string
	syscall	# read the string
	
	jal newlineReplace	# replaces the newline char in the output string to a null char
	
	la $a0, outputBuffer	# move the file name into $a0
	li $a1, 1	# creates a file if it doesn't exist
	li $v0, 13	# use syscall to open a file
	syscall	# open the file
	
	move $s1, $v0	# move the file descriptor into $s1
	
	move $a0, $s0	# move address of input into $a0
	move $a1, $s1	# move address of output into $a1
	
	jal decode_message1	# call first decode method
	
	move $a0, $s0	# load the descriptor for the input file
	li $v0, 16	# load the value to close the file
	syscall	# close the file

	move $a0, $s1	# load the descriptor for the input file
	li $v0, 16	# load the value to close the file
	syscall	# close the file

# Prompt and read a str of at most 50 characters from user (Input file name)
# Try to open InputFile if failure, prompt user and attempt again
# Prompt and read a str of at most 50 characters from user (Output file name)
# Open OutputFile, create if doesn't exist
# decode_message2(... , ...) - Part 2
# Close Input and Output file

fileLoop2:
	la $a0, inputFile	# load prompt for user's string
	li $v0, 4	# use syscall to print string
	syscall	# print the string
	
	la $a0, inputBuffer	# load buffer address
	li $a1, 50	# maximum number of chars to read
	li $v0, 8	# use syscall to read a string
	syscall	# read the string
	
	jal newlineReplace	# replaces the newline char in the input string to a null char
	
	la $a0, inputBuffer	# move the file name into $a0
	li $a1, 0	# load zero into $a1 to open the file with no flag
	li $v0, 13	# use syscall to open a file
	syscall	# open the file
	
	bltz $v0, fileLoop2	# if the file descriptor is negative, ask user for input again
	
	move $s0, $v0	# move the file descriptor into $s0
	
	la $a0, outputFile	# load prompt for user's string
	li $v0, 4	# use syscall to print the string
	syscall	# print the string
	
	la $a0, outputBuffer	# load buffer address
	li $a1, 50	# maximum number of chars to read
	li $v0, 8	# use the syscall to read a string
	syscall	# read the string
	
	jal newlineReplace	# replaces the newline char in the output string to a null char
	
	la $a0, outputBuffer	# move the file name into $a0
	li $a1, 1	# creates a file if it doesn't exist
	li $v0, 13	# use syscall to open a file
	syscall	# open the file
	
	move $s1, $v0	# move the file descriptor into $s1
	
	move $a0, $s0	# move address of input into $a0
	move $a1, $s1	# move address of output into $a1
	
	jal decode_message2	# call first decode method
	
	move $a0, $s0	# load the descriptor for the input file
	li $v0, 16	# load the value to close the file
	syscall	# close the file

	move $a0, $s1	# load the descriptor for the input file
	li $v0, 16	# load the value to close the file
	syscall	# close the file

# Prompt and read an integer from the user
# Prompt and read an digit from the user
# countN(... , ...) - Part 3
# Print the return value of countN
	
	la $a0, readInt	# load prompt for user's integer
	li $v0, 4	# use syscall to print string
	syscall	# print the string

	li $v0, 5 	# use syscall to read in an integer
	syscall	# read the integer

	move $s0, $v0	# save the integer in $s0

	la $a0, readDig	# load prompt for user's digit
	li $v0, 4	# use syscall to print string
	syscall	# print the string

	li $v0, 5 	# use syscall to read in an integer
	syscall	# read the integer

	move $s1, $v0	# save the digit in $s1

	move $a0, $s0 	# pass the integer to the countN function
	move $a1, $s1 	# pass the digit to the countN function

	jal countN	# call the third function countN

	move $t0, $v0

	la $a0, result 	# print result:
	li $v0, 4 	# load value to print a string
	syscall	# print the string

	move $a0, $t0
	li $v0, 1
	syscall

	la $a0, nl 	# print '\n'
	li $v0, 4 	# load value to print a string
	syscall	# print the string

# Prompt and read an integer and character from the user
# Prompt and read a str of at most 50 characters from user (Output file name)
# Open OutputFile, create if doesn't exist
# boxFractal(.... , ... , ...)
# Close Output file

	la $a0, readInt 	# load prompt for user's integer
	li $v0, 4	# use syscall to print string
	syscall	# print the string

	li $v0, 5 	# use syscall to read in an integer
	syscall	# read the integer

	move $s0, $v0	# save the integer in $s0

	la $a0, readChar	# load prompt for user's char
	li $v0, 4 	# use syscall to print a stirng
	syscall	# print the string

	li $v0, 12 	# use syscall to read a character
	syscall	# read in the char

	move $s1, $v0	# save the character in $s1

	la $a0, nl	# print a newline
	li $v0, 4 	# use syscall to print a stirng
	syscall	# print the string

	la $a0, outputFile	# load prompt for user's string
	li $v0, 4	# use syscall to print the string
	syscall	# print the string
	
	la $a0, outputBuffer	# load buffer address
	li $a1, 50	# maximum number of chars to read
	li $v0, 8	# use the syscall to read a string
	syscall	# read the string
	
	jal newlineReplace	# replaces the newline char in the output string to a null char
	
	la $a0, outputBuffer	# move the file name into $a0
	li $a1, 1	# creates a file if it doesn't exist
	li $v0, 13	# use syscall to open a file
	syscall	# open the file
	
	move $s2, $v0	# move the file descriptor into $s1

	move $a0, $s0 	# pass the integer to the function
	move $a1, $s1 	# pass the character to the function
	move $a2, $s2 	# pass the output file descriptor to the function

	jal boxFractal	# call the fourth function (fractal function)

	move $a0, $s2	# load the descriptor for the input file
	li $v0, 16	# load the value to close the file
	syscall	# close the file

# Exit main program

	li $v0, 10
	syscall
	
#####################
# START OF FUNCTIONS
#####################
###############################################################################################################################
# Part 1 Function
###############################################################################################################################
decode_message1:
	# @param $a0 holds the file descriptor for the input file
	# @param $a1 holds the file descriptor for the output file
	addi $sp, $sp, -28
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	sw $fp, 12($sp)
	sw $s0, 16($sp)
	sw $s1, 20($sp)
	sw $s2, 24($sp)
	
	la $fp, ($sp)	# stores the stack pointer in the frame pointer
	li $s0, 0	# holds a flag to indicate if an opening parenthasis was found
	move $s1, $a0	# saves the input file descriptor
	move $s2, $a1	# saves the output file descriptor
	
readLoop1:
	move $a0, $s1 	# move the input file descriptor into $a0
	la $a1, fileBuffer	# load the address of the buffer into $a1
	li $a2, 1	# the maximum number of chars that can be written into the buffer
	li $v0, 14	# syscall to read from a file
	syscall	# read from the file
	
	beqz $v0, endRead1	# if number of bytes read equals zero end the loop
	
	la $t0, fileBuffer	# load the starting address of the buffer into $t0
	
	bgtz $s0, saveStack1	# if an opening parenthasis was already found in the previous buffer

	lb $t1, ($t0)	# load the current char of the buffer
	li $t2, '('	# load the value of an open parenthasis into $t2
	
	beq $t1, $t2, setFlag1	# if you find an opening parenthasis branch to set flag
	#bgtz $s0, saveStack1	# if an opening parenthasis was already found

	# CHECK FOR SPECIAL CASES HERE
	li $t3, 48 	# load the ascii value for '0'
	blt $t1, $t3, checkSpace1 	# if not a valid char check for space

	li $t3, 57	# load the ascii value for '9'
	bgt $t1, $t3, checkUAlpha1	# if not a valid number check for upper alpha
	
	j readLoop1	# jump to the beginning of the loop

checkSpace1:
	li $t3, 32 	# load the ascii value for a space
	beq $t1, $t3, readLoop1	# check to see if the char is a string, if yes then jump back to reading

	j endRead1	# if no then error and jump to end

checkUAlpha1:
	li $t3, 65	# load the ascii value for 'A'
	blt $t1, $t3, endRead1	# if ascii char is invalid stop reading/ writing

	li $t3, 90	# load the ascii value for 'Z'
	bgt $t1, $t3, checkLAlpha1	# if not a number or upper case char check lower case

	j readLoop1	# char is an upper case valid char so keep reading

checkLAlpha1:
	li $t3, 97	# load the ascii value for 'a'
	blt $t1, $t3, endRead1 	# if ascii char is invalid stop reading/ writing

	li $t3, 122	# load the ascii value for 'z'
	bgt $t1, $t3, endRead1	# the ascii char is invalid so stop reading/ writing

	j readLoop1	# the char is a lower case valid char so keep reading
	
setFlag1:
	li $s0, 1	# set flag to indicate opening parenthasis found

	addi $sp, $sp, -1	# make room on the stack to save the char
	sb, $t1, ($sp)	# store the byte onto the stack

	j readLoop1	# jump to reading the next char in the string
	
saveStack1:
	li $t2, ')'	# load the value of a closing parenthasis into $t2
	lb $t1, ($t0)	# load the current byte in the char
	beq $t2, $t1, openWrite1	# write the current bytes on the stack into the output file

	# CHECK FOR SPECIAL CASES HERE
	li $t3, 48 	# load the ascii value for '0'
	blt $t1, $t3, checkWSpace1 	# if not a valid char check for space

	li $t3, 57	# load the ascii value for '9'
	bgt $t1, $t3, checkWUAlpha1	# if not a valid number check for upper alpha
	
checkedSave1:
	addi $sp, $sp, -1	# make room on the stack to save the char
	sb, $t1, ($sp)	# store the byte onto the stack

	j readLoop1	# jump back to the beginning of the reading in loop

checkWSpace1:
	li $t3, 32 	# load the ascii value for a space
	beq $t1, $t3, checkedSave1	# check to see if the char is a string, if yes then jump back to reading

	j endRead1	# if no then error and jump to end

checkWUAlpha1:
	li $t3, 65	# load the ascii value for 'A'
	blt $t1, $t3, endRead1	# if ascii char is invalid stop reading/ writing

	li $t3, 90	# load the ascii value for 'Z'
	bgt $t1, $t3, checkWLAlpha1	# if not a number or upper case char check lower case

	j checkedSave1	# char is an upper case valid char so keep reading

checkWLAlpha1:
	li $t3, 97	# load the ascii value for 'a'
	blt $t1, $t3, endRead1 	# if ascii char is invalid stop reading/ writing

	li $t3, 122	# load the ascii value for 'z'
	bgt $t1, $t3, endRead1	# the ascii char is invalid so stop reading/ writing

	j checkedSave1	# the char is a lower case valid char so keep reading

openWrite1:
	move $a0, $s2 	# load the output file descriptor into $a0
	la $a1, openParenthasis 	# load the opening parenthasis value
	li $a2, 1 	# only write one byte at a time
	li $v0, 15 	# load the call to write the byte to the file
	syscall	# write the byte to the file

	######## NEED TO WORK ON SPECIAL CASES TO MAKE SURE EACH BYTE IS ALPHANUMBERIC ##########
	
writeBytes1:
	# WRITE THE BYTES TO THE FILE --> $a0 = file descriptor $a1 = address of output buffer $a2 = number of characters to write
	# beq $sp, $fp, readLoop1	# when the $sp is back to the top of the stack ($fp) jump back to reading in the file.
	li $t0, '('	# load the opening parenthasis to check for end of the string
	lb $t1, ($sp)	# load the current char of the $sp
	beq $t0, $t1, closeWrite1	# put the closing parenthasis

	move $a0, $s2	# load the output file descriptor into $a0
	move $a1, $sp 	# load the address of the current byte to be written
	li $a2, 1 	# only write one byte at a time
	li $v0, 15 	# load the call to write the byte to the file
	syscall	# write the byte to the file

	addi $sp, $sp, 1 	# move to next char to pull off stack

	li $s0, 0	# set flag back to zero

	j writeBytes1	# jump to the beginning of the writing loop

closeWrite1:
	move $a0, $s2 	# load the output file descriptor into $a0
	la $a1, closeParenthasis 	# load the closing parenthasis value
	li $a2, 1 	# only write one byte at a time
	li $v0, 15 	# load the call to write the byte to the file
	syscall	# write the byte to the file

	j readLoop1	# continue reading the next char from the file

endRead1:
	la $sp, ($fp)	# put the address of the stackpointer back into $sp
	
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	lw $fp, 12($sp)
	lw $s0, 16($sp)
	lw $s1, 20($sp)
	lw $s2, 24($sp)
	addi $sp, $sp, 28

	jr $ra	# jump back to the main program

###############################################################################################################################
# Part 2 Function
###############################################################################################################################
	# @param $a0 holds the value of the input descriptor
	# @param $a1 holds the value of the output descriptor
decode_message2:
	addi $sp, $sp, -32
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	sw $fp, 12($sp)
	sw $s0, 16($sp)
	sw $s1, 20($sp)
	sw $s2, 24($sp)
	sw $s3, 28($sp)
	
	la $fp, ($sp)	# stores the stack pointer in the frame pointer
	li $s0, 0	# holds a flag to indicate if an opening parenthasis was found
	# $s1 holds the value of the current open parenthasis
	move $s2, $a0	# saves the input file descriptor
	move $s3, $a1	# saves the output file descriptor
	
readLoop2:
	move $a0, $s2 	# move the input file descriptor into $a0
	la $a1, fileBuffer	# load the address of the buffer into $a1
	li $a2, 1	# the maximum number of chars that can be written into the buffer
	li $v0, 14	# syscall to read from a file
	syscall	# read from the file
	
	beqz $v0, endRead2	# if number of bytes read equals zero end the loop
	
	la $t0, fileBuffer	# load the starting address of the buffer into $t0
	
	bgtz $s0, saveStack2	# if an opening parenthasis was already found in the previous buffer

	lb $t1, ($t0)	# load the current char of the buffer

	li $t2, '('	# load the value of an open parenthasis into $t2
	beq $t1, $t2, setFlagP0	# if you find an opening parenthasis branch to set flag
	
	li $t2, '{'	# load the value of an open parenthasis into $t2
	beq $t1, $t2, setFlagP1	# if you find an opening parenthasis branch to set flag

	li $t2, '['	# load the value of an open parenthasis into $t2
	beq $t1, $t2, setFlagP2	# if you find an opening parenthasis branch to set flag

	# CHECK FOR SPECIAL CASES HERE
	li $t3, 48 	# load the ascii value for '0'
	blt $t1, $t3, checkSpace2 	# if not a valid char check for space

	li $t3, 57	# load the ascii value for '9'
	bgt $t1, $t3, checkUAlpha2	# if not a valid number check for upper alpha
	
	j readLoop2	# jump to the beginning of the loop

checkSpace2:
	li $t3, 32 	# load the ascii value for a space
	beq $t1, $t3, readLoop2	# check to see if the char is a string, if yes then jump back to reading

	j endRead2	# if no then error and jump to end

checkUAlpha2:
	li $t3, 65	# load the ascii value for 'A'
	blt $t1, $t3, endRead2	# if ascii char is invalid stop reading/ writing

	li $t3, 90	# load the ascii value for 'Z'
	bgt $t1, $t3, checkLAlpha2	# if not a number or upper case char check lower case

	j readLoop2	# char is an upper case valid char so keep reading

checkLAlpha2:
	li $t3, 97	# load the ascii value for 'a'
	blt $t1, $t3, endRead2 	# if ascii char is invalid stop reading/ writing

	li $t3, 122	# load the ascii value for 'z'
	bgt $t1, $t3, endRead2	# the ascii char is invalid so stop reading/ writing

	j readLoop2	# the char is a lower case valid char so keep reading
	
setFlagP0:
	addi $s0, $s0, 1	# add one to the open parenthasis count

	# NEED TO WRITE THE PARENTHASIS TO THE FILE ALONG WITH THE FOLLOWING CHARACTERS
	move $a0, $s3 	# load the output file descriptor into $a0
	la $a1, openParenthasis 	# load the opening parenthasis value
	li $a2, 1 	# only write one byte at a time
	li $v0, 15 	# load the call to write the byte to the file
	syscall	# write the byte to the file

	addi $sp, $sp, -1	# make room on the stack to save the char
	sb, $t1, ($sp)	# store the byte onto the stack

	#move $s1, $t0	# move the opening parethasis into a saved register

	j readLoop2	# jump to reading the next char in the string

setFlagP1:
	addi $s0, $s0, 1	# add one to the open parenthasis count

	# NEED TO WRITE THE PARENTHASIS TO THE FILE ALONG WITH THE FOLLOWING CHARACTERS
	move $a0, $s3 	# load the output file descriptor into $a0
	la $a1, openParenthasis1 	# load the opening parenthasis value
	li $a2, 1 	# only write one byte at a time
	li $v0, 15 	# load the call to write the byte to the file
	syscall	# write the byte to the file

	addi $sp, $sp, -1	# make room on the stack to save the char
	sb, $t1, ($sp)	# store the byte onto the stack

	j readLoop2	# jump to reading the next char in the string

setFlagP2:
	addi $s0, $s0, 1	# add one to the open parenthasis count

	# NEED TO WRITE THE PARENTHASIS TO THE FILE ALONG WITH THE FOLLOWING CHARACTERS
	move $a0, $s3 	# load the output file descriptor into $a0
	la $a1, openParenthasis2 	# load the opening parenthasis value
	li $a2, 1 	# only write one byte at a time
	li $v0, 15 	# load the call to write the byte to the file
	syscall	# write the byte to the file

	addi $sp, $sp, -1	# make room on the stack to save the char
	sb, $t1, ($sp)	# store the byte onto the stack

	j readLoop2	# jump to reading the next char in the string
	
saveStack2:
	lb $t1, ($t0)	# load the current byte in the char

	li $t2, '('	# load the value of an open parenthasis into $t2
	beq $t1, $t2, setFlagP0	# if you find an opening parenthasis branch to set flag
	
	li $t2, '{'	# load the value of an open parenthasis into $t2
	beq $t1, $t2, setFlagP1	# if you find an opening parenthasis branch to set flag

	li $t2, '['	# load the value of an open parenthasis into $t2
	beq $t1, $t2, setFlagP2	# if you find an opening parenthasis branch to set flag

	li $t2, ')'	# load the value of a closing parenthasis into $t2
	beq $t2, $t1, openWriteP0	# write the current bytes on the stack into the output file

	li $t2, '}'	# load the value of a closing parenthasis into $t2
	beq $t2, $t1, openWriteP1	# write the current bytes on the stack into the output file

	li $t2, ']'	# load the value of a closing parenthasis into $t2
	beq $t2, $t1, openWriteP2	# write the current bytes on the stack into the output file

	# CHECK FOR SPECIAL CASES HERE
	li $t3, 48 	# load the ascii value for '0'
	blt $t1, $t3, checkWSpace2 	# if not a valid char check for space

	li $t3, 57	# load the ascii value for '9'
	bgt $t1, $t3, checkWUAlpha2	# if not a valid number check for upper alpha
	
checkedSave2:
	addi $sp, $sp, -1	# make room on the stack to save the char
	sb, $t1, ($sp)	# store the byte onto the stack

	j readLoop2	# jump back to the beginning of the reading in loop

checkWSpace2:
	li $t3, 32 	# load the ascii value for a space
	beq $t1, $t3, checkedSave2	# check to see if the char is a string, if yes then jump back to reading

	j endRead2	# if no then error and jump to end

checkWUAlpha2:
	li $t3, 65	# load the ascii value for 'A'
	blt $t1, $t3, endRead2	# if ascii char is invalid stop reading/ writing

	li $t3, 90	# load the ascii value for 'Z'
	bgt $t1, $t3, checkWLAlpha2	# if not a number or upper case char check lower case

	j checkedSave2	# char is an upper case valid char so keep reading

checkWLAlpha2:
	li $t3, 97	# load the ascii value for 'a'
	blt $t1, $t3, endRead2 	# if ascii char is invalid stop reading/ writing

	li $t3, 122	# load the ascii value for 'z'
	bgt $t1, $t3, endRead2	# the ascii char is invalid so stop reading/ writing

	j checkedSave2	# the char is a lower case valid char so keep reading

openWriteP0:
	move $s1, $t2	# save the current parenthasis into $s1

	j writeBytes2	# jump to writing the open parenthasis

openWriteP1:
	move $s1, $t2	# save the current parenthasis into $s1

	j writeBytes2	# jump to writing the open parenthasis
	
openWriteP2:
	move $s1, $t2	# save the current parenthasis into $s1

	j writeBytes2	# jump to writing the open parenthasis
	
writeBytes2:
	# WRITE THE BYTES TO THE FILE --> $a0 = file descriptor $a1 = address of output buffer $a2 = number of characters to write
	# beq $sp, $fp, readLoop1	# when the $sp is back to the top of the stack ($fp) jump back to reading in the file.
	lb $t1, ($sp)	# load the current char of the $sp

	li $t0, '('	# load the opening parenthasis to check for end of the string
	beq $t0, $t1, closeWriteP0	# check & put the closing parenthasis

	li $t0, '{'	# load the opening parenthasis to check for end of the string
	beq $t0, $t1, closeWriteP1	# check & put the closing parenthasis

	li $t0, '['	# load the opening parenthasis to check for end of the string
	beq $t0, $t1, closeWriteP2	# check & put the closing parenthasis

	move $a0, $s3	# load the output file descriptor into $a0
	move $a1, $sp 	# load the address of the current byte to be written
	li $a2, 1 	# only write one byte at a time
	li $v0, 15 	# load the call to write the byte to the file
	syscall	# write the byte to the file

	addi $sp, $sp, 1 	# move to next char to pull off stack

	j writeBytes2	# jump to the beginning of the writing loop

closeWriteP0:
	li $t0, ')'	# load the opening parenthasis to check for end of the string
	bne $t0, $s1, endRead2	# check the parenthasis, if they don't match then exit

	move $a0, $s3 	# load the output file descriptor into $a0
	la $a1, closeParenthasis 	# load the closing parenthasis value
	li $a2, 1 	# only write one byte at a time
	li $v0, 15 	# load the call to write the byte to the file
	syscall	# write the byte to the file

	addi $sp, $sp, 1 	# pull parenthasis off the stack

	addi $s0, $s0, -1 	# subtract one from the open parenthasis count

	j readLoop2	# continue reading the next char from the file

closeWriteP1:
	li $t0, '}'	# load the opening parenthasis to check for end of the string
	bne $t0, $s1, endRead2	# check the parenthasis, if they don't match then exit

	move $a0, $s3 	# load the output file descriptor into $a0
	la $a1, closeParenthasis1 	# load the closing parenthasis value
	li $a2, 1 	# only write one byte at a time
	li $v0, 15 	# load the call to write the byte to the file
	syscall	# write the byte to the file

	addi $sp, $sp, 1 	# pull parenthasis off the stack

	addi $s0, $s0, -1 	# subtract one from the open parenthasis count

	j readLoop2	# continue reading the next char from the file

closeWriteP2:
	li $t0, ']'	# load the opening parenthasis to check for end of the string
	bne $t0, $s1, endRead2	# check the parenthasis, if they don't match then exit

	move $a0, $s3 	# load the output file descriptor into $a0
	la $a1, closeParenthasis2 	# load the closing parenthasis value
	li $a2, 1 	# only write one byte at a time
	li $v0, 15 	# load the call to write the byte to the file
	syscall	# write the byte to the file

	addi $sp, $sp, 1 	# pull parenthasis off the stack

	addi $s0, $s0, -1 	# subtract one from the open parenthasis count

	j readLoop2	# continue reading the next char from the file

endRead2:
	la $sp, ($fp)	# put the address of the stackpointer back into $sp
	
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	lw $fp, 12($sp)
	lw $s0, 16($sp)
	lw $s1, 20($sp)
	lw $s2, 24($sp)
	lw $s3, 28($sp)
	addi $sp, $sp, 32

	jr $ra 	# jump back to the main program

###############################################################################################################################
# Part 3 Function
###############################################################################################################################
	# @param $a0 holds an integer value
	# @param $a1 holds the value of n
countN:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)

	addi $sp, $sp, -12
	sw $v0, 0($sp)
	sw $v1, 4($sp)
	sw $a0, 8($sp)

	move $t0, $a0 # stores the value of int in $t0
	move $t1, $a1 # stores the value of N in $t1

	la $a0, testPrint 	# print countN(int, N):
	li $v0, 4 	# load value to print a string
	syscall	# print the string

	move $a0, $t0
	li $v0, 1
	syscall

	la $a0, comma 	# print ', '
	li $v0, 4 	# load value to print a string
	syscall	# print the string

	move $a0, $t1
	li $v0, 1
	syscall

	la $a0, nl 	# print '\n'
	li $v0, 4 	# load value to print a string
	syscall	# print the string

	lw $v0, 0($sp)
	lw $v1, 4($sp)
	lw $a0, 8($sp)
	addi $sp, $sp, 12

	move $t0, $a0 # stores the value of int in $t0
	move $t1, $a1 # stores the value of N in $t1

	bltz $t0, exitFail	# if the input value is negative exit w. failure

	li $t2, 10 	# load 10 into $t2
	div $t0, $t2	# divide the int by 10 to get the first digit and the value of the next int to check

	mfhi $t3	# retrieve the remainder and save it in $t3
	mflo $t4	# retrieve the next int and save it in $t4

	beq $t1, $t3, digitFound	# branch if the remainder equals the digit
	beqz $t0, intZero	# branch if the int equals zero (end of function)

	#li $v1, 0 	# indicate no match to N found in this call

	move $a0, $t4	# pass next int to function
	move $a1, $t1	# pass N to the function

	jal countN	# make recursive call

	addi $sp, $sp, -12
	sw $v0, 0($sp)
	sw $v1, 4($sp)
	sw $a0, 8($sp)

	move $t0, $v0 # stores the value of int in $t0

	la $a0, result 	# print result:
	li $v0, 4 	# load value to print a string
	syscall	# print the string

	move $a0, $t0
	li $v0, 1
	syscall

	la $a0, nl 	# print '\n'
	li $v0, 4 	# load value to print a string
	syscall	# print the string

	lw $v0, 0($sp)
	lw $v1, 4($sp)
	lw $a0, 8($sp)
	addi $sp, $sp, 12

	li $v1, 0 	# indicate no match to N found in this call

	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	addi $sp, $sp, 12

	jr $ra 	# jump back to the begining of the function

digitFound:
	move $a0, $t4	# pass next int to function
	move $a1, $t1	# pass N to the function

	jal countN 	# make recursive call

	addi $sp, $sp, -12
	sw $v0, 0($sp)
	sw $v1, 4($sp)
	sw $a0, 8($sp)

	move $t0, $v0 # stores the value of int in $t0

	la $a0, result 	# print result:
	li $v0, 4 	# load value to print a string
	syscall	# print the string

	move $a0, $t0
	li $v0, 1
	syscall

	la $a0, nl 	# print '\n'
	li $v0, 4 	# load value to print a string
	syscall	# print the string

	lw $v0, 0($sp)
	lw $v1, 4($sp)
	lw $a0, 8($sp)
	addi $sp, $sp, 12

	addi $v0, $v0, 1 	# add one to the value in $v0

	li $t2, 1 	# load 1 into $t2
	beq $v1, $t2, secondDigit	# second N in a row found

	li $v1, 1 	# indicate that a digit was found this round

	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	addi $sp, $sp, 12

	jr $ra 	# jump back to the begining of the function

secondDigit:
	addi $v0, $v0, 1 	# add another one to $v0 indicating there were two digits next to each other

	li $v1, 1 	# indicate that a digit was found this round

	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	addi $sp, $sp, 12

	jr $ra 	# jump back to the begining of the function

intZero:
	li $v0, 0 	# if int equals zero then load zero into $v0
	li $v1, 0 	# if int equals zero then load zero into $v1

	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	addi $sp, $sp, 12

	jr $ra 	# jump back to the begining of the function

exitFail:
	li $v0, -1

	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	addi $sp, $sp, 12
	
	jr $ra 	# jump back to the begining of the function

###############################################################################################################################
# Part 4 Function
###############################################################################################################################
	# @param $a0 holds the integer value that decides the size of the fractal
	# @param $a1 holds the char that will be used to create the fractal
	# @param $a2 holds the file descriptor for the output file where the fractal will be printed
boxFractal:
	addi $sp, $sp, -24
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	sw $a2, 12($sp)
	sw $s0, 16($sp)
	sw $s0, 20($sp)

	bltz $a0, finishPrint	# if the integer is less than zero the function should exit without printing
	beqz $a0, finishPrint	# if the integer is equal to zero the function should exit without printing
	li $t0, 6	# load the value 6 to test if the integer is within the correct range
	bgt $a0, $t0, finishPrint	# if the integer is greater than 6 the function should exit without printing

	move $s1, $a0	# stores the var in $t0
	sb $a1, matrixChar	# stores the char into data memory address matrixChar
	move $s0, $a2	# stores the file descriptor in $t2

	jal calcMem	# call the calcMem function (integer value is already in $a0)

	sw $v0, dimension	# store the return value from calcMem into the dimension address in memory

	li $a0, 0 	# load first value for the row
	li $a1, 0 	# load first value for the column
	move $a2, $s1	# load the var value for the fractal
	lw $a3, dimension	# load the dim value for the fractal

	jal recursiveMatrixFill	# call the function to fill the matrix

	li $t1, 0 	# keep count for printing loop
	li $t2, 0 	# keep second cout for printing loop
	lw $t3, dimension 	# retrieve the dimension from data memory

	j printLoop2 	# jump to start printing the columns

printLoop:
	move $a0, $s0	# load the file descriptor of the file to print to
	la $a1, nl	# load the newline to print the next row of the fractal
	li $a2, 1 	# only print one byte at a time
	li $v0, 15	# load the syscall to write to a file
	syscall	# print the character to the file

	addi $t1, $t1, 1 	# increment the row counter
	li $t2, 0 	# keep second cout for printing loop

	beq $t3, $t1, finishPrint 	# when the number of rows has hit the highest dimension quit

printLoop2:
	beq $t3, $t2, printLoop 	# once the column number equals the dimension print the next row

	mul $t4, $t1, $t3	# store (row * dimension) in $t4
	add $t4, $t4, $t2	# store [(row * dimension) + column] in $t4

	la $t5, FRACTAL_BUF	# load the base address of the fractal
	add $t4, $t4, $t5	# store [(row * dimesnion) + column + base] in $t4

	li $t6, '\0'	# load the value for space into $t6
	lb $t7, ($t4)	# load the current byte in the fractal
	beq $t6, $t7, printSpace 	# if the current byte is null print a space

	move $a0, $s0	# load the file descriptor of the file to print to
	la $a1, ($t4) 	# load the char in the fractal to print
	li $a2, 1 	# only print one byte at a time
	li $v0, 15	# load the syscall to write to a file
	syscall	# print the character to the file

	addi $t2, $t2, 1 	# increment the column counter

	j printLoop2 	# jump to the begining of the second loop

printSpace:
	move $a0, $s0	# load the file descriptor of the file to print to
	la $a1, space 	# load the space to print
	li $a2, 1 	# only print one byte at a time
	li $v0, 15	# load the syscall to write to a file
	syscall	# print the character to the file

	addi $t2, $t2, 1 	# increment the column counter

	j printLoop2	# jump to the begining of the second loop

	# create 2D array and call recursiveMatrixFill after passing the appropriate arguments
	# save the dimension in the .data section
	# row * dimension + base (address of FRACTAL_BUF) + column
	# get it working for one then two and it should work

finishPrint:
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	lw $a2, 12($sp)
	lw $s0, 16($sp)
	lw $s0, 20($sp)
	addi $sp, $sp, 24

	jr $ra 	# jump back to the main program

###############################################################################################################################
	# @param $a0 holds the integer value that decides the size of the fractal
calcMem:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)

	li $t0, 1 	# loads the value of 1 into $t0
	bgt $a0, $t0, biggerFractal	# if the integer for size is greater than one call calcMem again

	li $v0, 1 	# integer is not greater than one so return 1

	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 8

	jr $ra 	# jump back to the main program

biggerFractal:
	addi $a0, $a0, -1 	# subtract one from the integer size value

	jal calcMem	# call calcMem with new integer value

	li $t0, 3 	# load the value of 3 into $t0
	mul $v0, $v0, $t0	# multiply the result of the calcMem call by three
	
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 8

	jr $ra 	# jump back to the main program

###############################################################################################################################
	# @param $a0 holds the integer value for the row
	# @param $a1 holds the integer value for the column
	# @param $a2 holds the integer value for the degree of the fractal
	# @param $a3 holds the integer value for the dimension
	# @param FRACTAL_BUF holds the 2D matrix for the fractal
	# @param matrixChar holds the char used to make the fractal
recursiveMatrixFill:
	addi $sp, $sp, -36
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	sw $a2, 12($sp)
	sw $a3, 16($sp)
	sw $s0, 20($sp)
	sw $s1, 24($sp)
	sw $s2, 28($sp)
	sw $s3, 32($sp)

	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	move $s3, $a3

	move $t0, $s0
	move $t1, $s1
	move $t2, $s2
	move $t3, $s3

	# STILL NEED TO PULL CHAR ARGUMENT OFF THE STACK AND SAVE IT TO A REGISTER
	# row * dimension (# of rows and columns) + base (address of buffer) + column

	li $t4, 1 	# load the value of one to check the dimension
	beq $t4, $t2, setMatrixChar

	# MAKE FIRST CALL: recursiveMatrixFill(row, col, (degree-1), r_d , matrix, c);
	addi $t2, $t2, -1 	# degree - 1

	li $t4, 3 	# load the value to divide the dimenson by three
	div $t3, $t4	# divide the dimension by 3 to find r_d

	mflo $t3	# load the divided dim

	move $a2, $t2	# move (degree - 1) into $a2
	move $a3, $t3	# move r_d into $a3

	jal recursiveMatrixFill	# make first call to fill matrix

	# MAKE SECOND CALL: recursiveMatrixFill(row, (col + (2*r_d)), (degree-1), r_d, matrix, c);
	move $t0, $s0	# reset the t registers holding the a values
	move $t1, $s1	# reset the t registers holding the a values
	move $t2, $s2	# reset the t registers holding the a values
	move $t3, $s3	# reset the t registers holding the a values

	li $t4, 3 	# load the value to divide the dimenson by three
	div $t3, $t4	# divide the dimension by 3 to find r_d

	mflo $t3	# load the divided dim

	li $t4, 2 	# load the value to multiply the dimension by 2
	mul $t5, $t4, $t3 	# multiply the r_d by 2
	add $t5, $t5, $t1	# add the the columns to (2*r_d)

	addi $t2, $t2, -1 	# degree - 1

	move $a1, $t5	# move the new column value into $a1
	move $a2, $t2	# move the new degree value into $a2
	move $a3, $t3	# move the r_d into $a3

	jal recursiveMatrixFill	# make the second call to fill the matrix

	# MAKE THIRD CALL: recursiveMatrixFill((row + r_d), (col + (r_d)), (degree -1), r_d, matrix, c);
	move $t0, $s0	# reset the t registers holding the a values
	move $t1, $s1	# reset the t registers holding the a values
	move $t2, $s2	# reset the t registers holding the a values
	move $t3, $s3	# reset the t registers holding the a values

	li $t4, 3 	# load the value to divide the dimenson by three
	div $t3, $t4	# divide the dimension by 3 to find r_d

	mflo $t3	# load the divided dim

	add $t0, $t0, $t3	# add r_d to the row
	add $t1, $t1, $t3	# add r_d to the column

	addi $t2, $t2, -1 	# degree - 1

	move $a0, $t0	# move the row value into $a0
	move $a1, $t1	# move the column value into $a1
	move $a2, $t2	# move the degree -1 into $a2
	move $a3, $t3	# move the r_d into $a3

	jal recursiveMatrixFill	# make the third call to fill the matrix

	# MAKE FOURTH CALL: recursiveMatrixFill((row + (2*r_d)), col, (degree-1), r_d, matrix, c);
	move $t0, $s0	# reset the t registers holding the a values
	move $t1, $s1	# reset the t registers holding the a values
	move $t2, $s2	# reset the t registers holding the a values
	move $t3, $s3	# reset the t registers holding the a values

	li $t4, 3 	# load the value to divide the dimenson by three
	div $t3, $t4	# divide the dimension by 3 to find r_d

	mflo $t3	# load the divided dim

	li $t4, 2 	# load the value to multiply the dimension by 2
	mul $t5, $t4, $t3 	# multiply the r_d by 2
	add $t5, $t5, $t0	# add the the row to (2*r_d)

	addi $t2, $t2, -1 	# degree - 1

	move $a0, $t5	# move the row value into $a0
	move $a1, $s1 	# move the column value into $a1
	move $a2, $t2	# move degree - 1 into $a2
	move $a3, $t3	# move r_d into $a3

	jal recursiveMatrixFill	# make the fourth call to fill the matrix

	# MAKE FIFTH CALL: recursiveMatrixFill((row + (2*r_d)), (col + (2*r_d)), (degree - 1), r_d, matrix, c);
	move $t0, $s0	# reset the t registers holding the a values
	move $t1, $s1	# reset the t registers holding the a values
	move $t2, $s2	# reset the t registers holding the a values
	move $t3, $s3	# reset the t registers holding the a values

	li $t4, 3 	# load the value to divide the dimenson by three
	div $t3, $t4	# divide the dimension by 3 to find r_d

	mflo $t3	# load the divided dim

	li $t4, 2 	# load the value to multiply the dimension by 2
	mul $t5, $t4, $t3 	# multiply the r_d by 2
	add $t5, $t5, $t0	# add the the row to (2*r_d)

	li $t4, 2 	# load the value to multiply the dimension by 2
	mul $t6, $t4, $t3 	# multiply the r_d by 2
	add $t6, $t6, $t1	# add the the column to (2*r_d)

	addi $t2, $t2, -1 	# degree - 1

	move $a0, $t5	# move the row value into $a0
	move $a1, $t6	# move the column value into $a1
	move $a2, $t2	# move degree - 1 into $a2
	move $a3, $t3	# move r_d into $a3

	jal recursiveMatrixFill	# make the fourth call to fill the matrix

	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	lw $a2, 12($sp)
	lw $a3, 16($sp)
	lw $s0, 20($sp)
	lw $s1, 24($sp)
	lw $s2, 28($sp)
	lw $s3, 32($sp)
	addi $sp, $sp, 36

	jr $ra 	# jump back to the main program

setMatrixChar:
	lb $t4, matrixChar 	# load the character to print to the array

	lw $t5, dimension	# load the original dimension of the array
	mul $t0, $t0, $t5	# multiply the row by the dimension --> store the result in $t0

	la $t5, FRACTAL_BUF
	add $t0, $t0, $t5	# add the base address of the buffer to (row * dim)

	add $t0, $t0, $t1	# add the column number to [(row * dim) + base]

	sb $t4, ($t0)	# store the matrixChar at the designated place in the memory buffer

	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	lw $a2, 12($sp)
	lw $a3, 16($sp)
	lw $s0, 20($sp)
	lw $s1, 24($sp)
	lw $s2, 28($sp)
	lw $s3, 32($sp)
	addi $sp, $sp, 36

	jr $ra 	# jump back to the main program

###############################################################################################################################
# Extra Functions
###############################################################################################################################
newlineReplace:
	# @param $a0 holds address of '\n' terminated string that needs to be replaced with '\0'
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	
	li $t0, '\n'	# load the value of newline into t0
	
newlineLoop:
	lb $t1, ($a0)	# load the current char from a0
	beq $t1, $t0, nullTerminate	# if newline char found branch to replace
	
	addi $a0, $a0, 1	# move to next char in the string
	
	j newlineLoop	# jump to the beginning of the loop

nullTerminate:
	li $t0, 0	# load null termination value into t0
	sb $t0, ($a0)	# null terminate the string
	
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 8
	
	jr $ra	# jump back to main program
	
.data
# PART I & II
inputFile: .asciiz "Please enter the name of the input file (max 50 characters): "
outputFile: .asciiz "Please enter the name of the output file (max 50 characters): "
inputBuffer: .space 51
outputBuffer: .space 51
fileBuffer: .space 1
openParenthasis: .ascii "("
closeParenthasis: .ascii ")"
# PART II
openParenthasis1: .ascii "{"
closeParenthasis1: .ascii "}"
openParenthasis2: .ascii "["
closeParenthasis2: .ascii "]"
# PART III & IV
readInt: .asciiz "Enter an integer: "
readDig: .asciiz "Enter a digit (0-9): "
testPrint: .asciiz "countN(int, N): "
comma: .asciiz ", "
nl: .asciiz "\n"
result: .asciiz "result:"
# PART IV
readChar: .asciiz "Enter a character: "
FRACTAL_BUF: .space 60000
matrixChar: .byte 1
dimension: .word 1
space: .ascii " "
