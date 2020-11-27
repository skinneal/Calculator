;TITLE Assignment 1    (assignment_1.asm)

; Author: Allison Skinner
; Last Modified: 7/5/2020
; OSU email address: skinneal@oregonstate.edu
; Course number/section: CS 271-400
; Assignment Number: 1                Due Date: 7/5/2020
; Description: Asks the user to enter two numbers. Calculates the sum, difference, product, quotient and remainder of the numbers.

INCLUDE Irvine32.inc

.data
programmer	BYTE	"Name: Allison Skinner", 0
programTitle	BYTE	"Program Title: Assignment 1", 0
instructions	BYTE	"Please enter 2 numbers. This program will calculate the sum, difference, product, quotient and remainder of the numbers.", 0
goodbye		BYTE	"Thank you! Goodbye!", 0
tryagain	BYTE	"Please make sure that the second number is smaller than the first. Try again!", 0
extraCredit2	BYTE	"Extra Credit 2: Validate the second number to be less than the first.", 0
extraCredit1	BYTE	"Extra Credit 1: Repeat until user chooses to quit.", 0
playAgainPrompt	BYTE	"Would you like to go again? Enter 0 for no or 1 for yes", 0
playAgainChoice	DWORD	?
input_1		BYTE	"First number: ", 0
input_2		BYTE	"Second number: ", 0
print_sum	BYTE	"Sum: ", 0
print_difference	BYTE	"Difference: ", 0
print_product	BYTE	"Product: ", 0
print_quotient	BYTE	"Quotient: ", 0
print_remainder		BYTE	"Remainder: ", 0
number_1	DWORD	?
number_2	DWORD	?
sum	DWORD	?
difference	DWORD ?
product	DWORD ?
quotient	DWORD	?
remainder	DWORD	?

.code
main PROC
	call Clrscr

	;Programmer Introduction
		mov	edx, OFFSET programmer
		call WriteString
		call Crlf

	;Display Program Title
		mov	edx, OFFSET programTitle
		call WriteString
		call Crlf
	
	;Display Extra Credit 1
		mov edx, OFFSET extraCredit1
		call WriteString
		call Crlf

	;Display Extra Credit 2
		mov edx, OFFSET extraCredit2
		call WriteString
		call Crlf

USERINPUT:
	
	;Display Instructions
		mov edx, OFFSET instructions
		call WriteString
		call Crlf
		
	;Get User Input for 1st Number
		mov	edx, OFFSET input_1
		call WriteString
		call ReadInt
		mov	number_1, eax

	;Get User Input for 2nd Number
		mov	edx, OFFSET input_2
		call WriteString
		call ReadInt
		mov	number_2, eax

	;Check if First Number is Greater than Second Number
		mov eax, number_2
		mov ebx, number_1
		cmp ebx, eax
		ja CALCULATIONS	;jump to CALCULATIONS if ebx is greater than eax

	;If First Number is Less than Second Number, Try Again
		mov edx,	OFFSET tryagain
		call WriteString
		call Crlf
		jmp USERINPUT

CALCULATIONS:
	;Addition
		mov eax, number_1	;move number 1 to eax
		add eax, number_2	;move number 2 to eax
		mov sum, eax		;move value from eax to sum
		mov eax, 0			;zero out eax

	;Subtraction
		mov eax, number_1	;move number 1 to eax
		sub eax, number_2	;subtract number 2 from value in eax
		mov difference, eax	;move value from eax to difference
		mov eax, 0			;zero out eax

	;Multiplication
		mov eax, number_1	;move number 1 to eax
		add ebx, number_2	;move number 2 to ebx
		mul ebx				;multiply eax with ebx
		mov product, eax	;move value from eax to product
		mov eax, 0			;zero out eax

	;Division
		mov edx, 0			;initializes edx
		mov eax, number_1	;move number 1 to eax
		add ebx, number_2	;move number 2 to ebx
		div ebx				;divide value from eax to quotient
		mov quotient, eax	;move value from eax to quotient
		mov remainder, edx	;move value from edx to remainder

	;Print Calculations
		mov	edx, OFFSET print_sum
		call WriteString
		mov eax, sum
		call WriteDec
		call Crlf

		mov	edx, OFFSET print_difference
		call WriteString
		mov eax, difference
		call WriteDec
		call Crlf

		mov	edx, OFFSET print_product
		call WriteString
		mov eax, product
		call WriteDec
		call Crlf

		mov	edx, OFFSET print_quotient
		call WriteString
		mov eax, quotient
		call WriteDec
		call Crlf

		mov	edx, OFFSET print_remainder
		call WriteString
		mov eax, remainder
		call WriteDec
		call Crlf

	;Ask if the User Wants to Go Again
		mov edx, OFFSET playAgainPrompt
		call WriteString
		call Crlf
		call ReadInt
		call Crlf
		mov playAgainChoice, eax
		mov eax, 1
		cmp eax, playAgainChoice
		je USERINPUT	;jump if equal

	;Goodbye Message
		mov edx, OFFSET goodbye
		call WriteString
		call Crlf

	exit	; exit to operating system

main ENDP

END main
