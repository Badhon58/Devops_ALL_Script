#!/bin/bash

echo "Enter your choise"
echo "a. to print the today date "
echo "b. to print the list of the script "
echo "c. to check the current location "
echo "Badhon Biswas. to Display Your Name  "

read -r choice

Date=$(date)

case $choice in
a)
    echo "You enter A Value"
    date
    echo "Ending of A Value "
    ;;
b)
    echo "You enter B Value"
    ls -la
    echo "Ending of B Value "
    ;;
c)
    echo "You enter C Value"
    pwd
    echo "Ending of C Value "
    ;;
"Badhon Biswas")
    echo "Enter enter a Text"
    echo "Your Name is Badhon Biswas"
    ;;

*)
    echo "You enter Wrong Value"
    # ls -la
    echo "Ending of wrong Value "
    ;;
esac
