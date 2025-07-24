#!/bin/bash

printf "%-68s\n" ""
printf "%-68s\n" ""| tr " " "*"
printf "%s\n" "This is a simple BASH Compound Interest Calculator."
printf "%-68s\n" ""| tr " " "*"
echo  "\n  -sysadRussell"
printf "%-68s\n" ""
read -p 'How much are we starting with?:  ' bal           # principal balance
read -p 'What is the estimated percentage rate?:  ' rate          # percent annualy as float
read -p 'How often is this rate applied?:  ' frequency         # how often rate is applied annualy
read -p 'How many years will this balance collect interest?:  ' t           # years accrued
printf "%s\n" " "
cmpnd_int=$(echo "scale=10; $bal*((1+($rate*.01)/$frequency)^($frequency*$t))" | bc -l)
printf "%s %d %s %.2f\n" "After" "$t" "years, you will have approximately \$" "$cmpnd_int"
