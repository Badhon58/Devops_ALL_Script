#!/bin/bash

echo "Enter value to print from 1 to : "

read -r number

for i in {1..$number}; do
    echo "The value is $i"
done

# read -p "Enter Charecter value to print one by one : " name
# for i in name; do
#     echo "THe value is $i"
# done
