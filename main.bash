#!/usr/bin/bash

function hello() {
    echo "Welcome to the Simple converter!"
}

function menu() {
    
    while true; do
        echo "Select an option"
        echo "0. Type '0' or 'quit' to end program"
        echo "1. Convert units"
        echo "2. Add a definition"
        echo "3. Delete a definition"

        read input
    
        case "${input}" in

            0 | "quit")       
                echo "Goodbye!" 
                exit
                ;;
            1 | 2 | 3)     
                echo "Not implemented!" 
                ;;
            *)
                echo "Invalid option!"
        esac
    done    
}

hello
menu

# echo "Enter a definition:"
# read -a user_input
# arr_length="${#user_input[@]}"
# string="${user_input[0]}"
# number="${user_input[1]}"


# rn='^[+-]?[0-9]+\.?[0-9]*$'
# rs='[a-z]+_to_[a-z]+'
# float='^[0-9]+$'
# int='^[+-]?[0-9]+\.?[0-9]*$'


# if [[ $string =~ $rs ]] && [[ $number =~ $rn ]] && [[ $arr_length = 2 ]]; then
#     echo "Enter a value to convert:"
#     read value
#     while [[ ! $value =~ $float ]] && [[ ! $value =~ $int ]]
#     do
#         echo "Enter a float or integer value!"
#         read value
#     done
#     Result=$(bc -l <<<$number*$value)
#     echo "Result: $Result"
# else
#     echo "The definition is incorrect!"
# fi
