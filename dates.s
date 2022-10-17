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
promptMonth:   .asciiz        "Please enter the month: "
promptDay:     .asciiz        "Please enter the day: "
promptYear:    .asciiz        "Please enter the year: "

               .text
main:          #prints out month prompt
               li $v0,   4
               la $a0,   prompt
               syscall

               #Get the user input for their day
               li $v0,   5
               syscall
               