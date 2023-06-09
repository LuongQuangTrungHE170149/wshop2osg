#Assignment: Shell Programming
#Class ID: SE1811
#Student ID: HE170149
#Student Name: Luong-Quang-Trung
#Source File: Luong-Quang-Trung.sh
#!/bin/bash

while true; do
    clear
    echo "*********************************************************************"
    echo "Please choose from the following options; type the option"
    echo "number and hit the <Enter> key."
    echo "a or A To display the current directory"
    echo "b or B To list names of the files in a given directory"
    echo "c or C To display today's date and time"
    echo "d or D To display whether a file is a simple file or directory"
    echo "e or E To execute a command line."
    echo "q or Q To exit the program."
    echo "*********************************************************************"
    read -p "Enter your choice and hit <Enter>: " choice

    case "$choice" in
        a|A)
            echo "Present working directory:"
            pwd
            ;;
        b|B)
            read -p "Please enter the directory path: " directory
            if [[ -d "$directory" ]]; then
                echo "Listing files in $directory:"
                ls -l "$directory"
            else
                echo "$directory is not a directory."
            fi
            ;;
        c|C)
            echo "Today's date and time:"
            date
            ;;
        d|D)
            read -p "Please enter file name: " file
            if [[ -e "$file" ]]; then
                if [[ -f "$file" ]]; then
                    echo "$file is an ordinary file."
                elif [[ -d "$file" ]]; then
                    echo "$file is a directory."
                else
                    echo "$file exists, but it is neither an ordinary file nor a directory."
                fi
            else
                echo "$file does not exist."
            fi
            ;;
        e|E)
            read -p "Please enter a command to be executed: " command
            echo "Executing command: $command"
            eval "$command"
            ;;
        q|Q)
            echo "Bye now!"
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac

    read -p "Hit <Enter> to continue."
done

