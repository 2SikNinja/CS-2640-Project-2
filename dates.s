#  Name:   Nguyen, Peter
#  Project:  #2
#  Due:      10/20/22
#  Course:  cs-2640-04-f22 
# 
#  Description: 
#  This program takes a date from the user and outputs whether its a leap year as well as the day of the week
#
#
#NOTES: USE $t1 for all math when loading new numbers and $t2 to store answers
#
               .data
promptMonth:   .asciiz        "Please enter the month: "    #$t3
promptDay:     .asciiz        "Please enter the day: "      #$t4
promptYear:    .asciiz        "Please enter the year: "     #$t5
promptLeapYear:.asciiz        " is a leap year and "
promptNotLeapYear:.asciiz     " is not a leap year and "
promptSunday:  .asciiz        " is a Sunday."
promptMonday:  .asciiz        " is a Monday."
promptTuesday: .asciiz        " is a Tuesday."
promptWednesday:.asciiz       " is a Wednesday."
promptThursday:.asciiz        " is a Thursday."
promptFriday:  .asciiz        " is a Friday."
promptSaturday:.asciiz        " is a Saturday."
slash:		.asciiz		"/"


                         .text
main:                    
                         li $v0,   4                                  #prints out month prompt
                         la $a0,   promptMonth
                         syscall

userInputs:    
                         #Get the user input for their month
                         li $v0,   5

                         syscall

               move      $t3,      $v0                                #finish month part

                         li $v0,   4                                  #prints out day prompt
                         la $a0, promptDay
                         syscall

                         #Get the user input for their day
                         li $v0,   5
                         syscall

               move      $t4,      $v0                                #finish day part

                         li $v0,   4                                  #prints out year prompt
                         la $a0, promptYear
                         syscall

                         #Get the user input for their day
                         li $v0,   5
                         syscall

               move      $t5,      $v0                                #finish taking all inputs



ifLeapYearFirstCheck:
               		li $t1,    4                                            #leapYear
               div       $t5, $t1                                      #divides by 4 to check whether its a leap year
               mfhi      $t1
               bnez      $t1       ifLeapYearThirdCheck             #if branch is not equal to zero goes to third check
               b         ifLeapYearSecondCheck                        #if it is equal to zero go to second check



ifLeapYearSecondCheck:
               		li $t1,   100                                     #if it does not equal to zero goes to ending prompt
               div       $t5, $t1
               mfhi      $t1
               bnez      $t1       endLeapYearIfIs

ifLeapYearThirdCheck:
               		li $t1,   400
               div       $t5, $t1                                #if it equals zero go to end prompt if not, go to endleap year if not
               mfhi      $t1
               beqz      $t1       endLeapYearIfIs
               b         endLeapYearIfNot

endLeapYearIfIs:
					li $v0,	1
			move		$a0,		$t5
					syscall


					li $v0,	4
					la $a0,	promptLeapYear
					syscall
			b		dayOfWeek


endLeapYearIfNot:
					li $v0,	1
			move		$a0,		$t5
					syscall


					li $v0,	4
					la $a0,	promptNotLeapYear
					syscall
			b		dayOfWeek




dayOfWeek:
                         li $t1,   14
               sub       $t2, $t1, $t3                                #subtracts month from 14 moves puts into $t2
                              								#$t1 is now the divisor for a

               div       $t7, $t2, 12							##store a into $t7
				

yPart:
			sub		$t9, $t5, $t7						##$t9 is used for holding y
													# Y IS CORRECT 2022
					
			
					

mPart:												##month is $t3
					li $t1,	12
			mul		$t6, $t7, $t1							#t6 and t0 can be used

					li $t1,	2
			add		$t8, $t3,	$t6
			sub		$t8, $t8, $t1						##$t8 is used for holding m
													# M IS CORRECT
			

dPart:													
			add		$t0, $t4,	$t9						# should be 2042


					li, $t1,	4							#t0 is d
			div		$t1, $t9,	$t1							#y/4
			add		$t0, $t1,	$t0



					li, $t1,	100
			div		$t1, $t9,	$t1
			sub		$t0, $t0,	$t1
					

					li, $t1,	400
			div		$t1, $t9,	$t1
			add		$t0, $t1,	$t0

					li, $t1,	31
					li, $t6,	12
			mul		$t1, $t8,	$t1
			div		$t1,	$t1,	$t6
			add		$t0, $t1, $t0


					li, $t1,	7
			rem		$t6, $t0, $t1

					li, $v0,	1
			move		$a0,		$t3
					syscall
					li, $v0,	4
					la $a0,	slash
					syscall
					li, $v0,	1
			move		$a0,		$t4
					syscall
					li, $v0,	4
					la $a0,	slash
					syscall
					li, $v0,	1
			move		$a0,		$t5
					syscall


			beq		$t6, 0,	promptSUNDAYS
			beq		$t6, 1,	promptMONDAYS
			beq		$t6, 2,	promptTUESDAYS
			beq		$t6, 3,	promptWEDNESDAYS
			beq		$t6, 4,	promptTHURSDAYS
			beq		$t6, 5,	promptFRIDAYS
			beq		$t6, 6,	promptSATURDAYS

promptSUNDAYS:
					li $v0,	4
					la $a0,	promptSunday
					syscall
			b		End

promptMONDAYS:
					li $v0,	4
					la $a0,	promptMonday
					syscall
			b		End

promptTUESDAYS:
					li $v0,	4
					la $a0,	promptTuesday
					syscall
			b		End

promptWEDNESDAYS:
					li $v0,	4
					la $a0,	promptWednesday
					syscall
			b		End

promptTHURSDAYS:
					li $v0,	4
					la $a0,	promptThursday
					syscall
			b		End

promptFRIDAYS:
					li $v0,	4
					la $a0,	promptFriday
					syscall
			b		End
			
promptSATURDAYS:
					li $v0,	4
					la $a0,	promptSaturday
					syscall
			b		End

End:      
                    li $v0,   10
                    syscall