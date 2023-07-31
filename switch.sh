#!/bin/bash
#Header
clear
printf '\n'
while true; do

text="\e[1m                                                                 \e[0m"
color="\e[48;2;71;74;138m"
width=$(tput cols)
padding=$(( ($width - ${#text}) / 2 ))
echo -ne "${color}${text}\033[0m\n"

text="\e[1m                          UTU_PHP_Switch                         \e[0m"
color="\e[48;2;71;74;138m"
width=$(tput cols)
padding=$(( ($width - ${#text}) / 2 ))
echo -ne "${color}${text}\033[0m\n"

text="\e[1m                                                                 \e[0m"
color="\e[48;2;71;74;138m"
width=$(tput cols)
padding=$(( ($width - ${#text}) / 2 ))
echo -ne "${color}${text}\033[0m\n"

    echo "Choose an option:"
    echo "1. Enable a PHP version"
    echo "2. Disable a PHP version"
    echo "3. Show alternative PHP versions for CLI"
    echo "4. Restart Apache"
    echo "0. Exit"
    read -p "Enter your choice: " CHOICE

    case $CHOICE in
        1)
            read -p "Enter PHP version to enable (e.g., 7.4, 8.0): " VERSION
            sudo a2enmod "php$VERSION"
            echo "PHP version $VERSION enabled."
            ;;
        2)
            read -p "Enter PHP version to disable (e.g., 7.4, 8.0): " VERSION
            sudo a2dismod "php$VERSION"
            echo "PHP version $VERSION disabled."
            ;;
        3)
            echo "Listing PHP alternatives for CLI..."
            sudo update-alternatives --config php
            ;;
        4)
            echo "Restarting Apache..."
            sudo systemctl restart apache2
            clear
            echo "Apache has been restarted."
            ;;
        0)
            echo "Exiting..."
            clear 
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
