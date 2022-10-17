#  Name:   Nguyen, Peter
#  Project:  #2
#  Due:      10/20/22
#  Course:  cs-2640-04-f22 
# 
#  Description: 
#  This program takes a date from the user and outputs whether its a leap year as well as the day of the week
#
#
#
#
               .data
promptMonth:   .asciiz        "Please enter the month: "    #$t3
promptDay:     .asciiz        "Please enter the day: "      #$t4
promptYear:    .asciiz        "Please enter the year: "     #$t5


               .text
main:          
               li $v0,   4                                  #prints out month prompt
               la $a0,   promptMonth
               syscall

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

     move      $t5,      $v0                                #finish year part






















End:
               li $v0,   10
               syscall