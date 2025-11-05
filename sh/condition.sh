#!/bin/bash

read -p "Enter Your Mark" marks

if [[ $marks -gt 90 && $marks -gt 80 ]]; then
    echo "You Get A Plus"
elif [[ $marks -gt 70 && $marks -gt 79 ]]; then
    echo "You Get A "
elif [[ $marks -gt 60 && $marks -gt 69 ]]; then
    echo "You Get A Minus"
elif [[ $marks -gt 50 && $marks -gt 59 ]]; then
    echo "You Get B"
else
    echo "You are Failed"
fi
