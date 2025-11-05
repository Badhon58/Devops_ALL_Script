#!/bin/bash

read -p "Enter First Number : " first
read -p "Enter Last Number : " last
# let sum=$first+$last
echo "The Sum is : $((first + last))"
echo "The Minus is : $((first - last))"
echo "The Mul is : $((first * last))"
echo "The div is : $((first / last))"
