#!/bin/bash
select option in Add Subtract Multiply Divide Quit
do
   case $option in 
   Add) 
      read -p "Enter num1: " num1
      read -p "Enter num2: " num2
      echo "The addition of $num1 and $num2 is : $((num1+num2))"
      ;;
   Subtract) 
      read -p "Enter num1: " num1
      read -p "Enter num2: " num2
      echo "The subtraction of $num1 and $num2 is : $((num1-num2))"
      ;;
   Multiply) 
      read -p "Enter num1: " num1
      read -p "Enter num2: " num2
      echo "The multiplication of $num1 and $num2 is : $((num1*num2))"
      ;;
   Divide) 
      read -p "Enter num1: " num1
      read -p "Enter num2: " num2
      echo "The division of $num1 and $num2 is : $((num1/num2))"
      ;;
   Quit)
      echo "Thank you for using shell script"
      exit 0
      ;;
   *)
      echo "Invalid Option"
      ;;
   esac
done