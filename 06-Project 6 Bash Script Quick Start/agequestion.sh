#!/bin/bash

read -p "What is your age? " age
if [[ $age -gt 18 ]]
then echo "You're an adult."
else
echo "You're not an adult."
fi

#Remember double brackets! 
#Remember for read, -p allows for input.
