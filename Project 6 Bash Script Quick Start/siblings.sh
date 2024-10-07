#!/bin/bash
read -p "How many siblings do you have? " siblings
if [[ $siblings -ge 2 ]]
then touch 2.txt
else
touch 1.txt
fi