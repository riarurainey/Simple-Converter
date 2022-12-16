#!/usr/bin/bash

function hello() {
    echo "Welcome to the Simple converter!"
}

function writeToFile() {
    file_name="definitions.txt"
    num_lines=$(wc -l < $file_name)
    add_sn=$((num_lines + 1))
    prefix="$add_sn".
    line="${user_input[*]}"
    echo "$line" >> "$file_name"
}

function addDefinition() {
    rn='^[+-]?[0-9]+\.?[0-9]*$'
    rs='[a-z]+_to_[a-z]+'
    float='^[0-9]+$'
    int='^[+-]?[0-9]+\.?[0-9]*$'
    
    while true;
    do
        echo "Enter a definition:"
        read -a user_input
        arr_length="${#user_input[@]}"
        string="${user_input[0]}"
        number="${user_input[1]}"
    
        if [[ $string =~ $rs ]] && [[ $number =~ $rn ]] && [[ $arr_length = 2 ]]; then
       
            writeToFile $user_input
            return
        else
            echo "The definition is incorrect!"
        fi
    done    
}




function deleteDefinition() {
    file_name="definitions.txt"
    
    if [ -s $file_name ]; then 
    
        echo "Type the line number to delete or '0' to return"
        mapfile -t myArray < $file_name
        var=1
        while IFS= read -r line; 
        do  
            echo "$var. ${line}"
            var=$((var + 1))
        done < $file_name

        num_lines=$(wc -l < $file_name)
        
        read line_number
        
        while [[ $line_number -gt $num_lines ]]  || [ -z $line_number ] || [[ "$line_number" == "" ]]; do
        
            echo "Enter a valid line number!"
            read line_number
               
        done 
        
        if [ $line_number -eq 0 ]; then 
            return
        else 
            sed -i "${line_number}d" "$file_name"
                
        fi
    else
        echo "Please add a definition first!"
    fi    
   
    
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
            1)     
                echo "Not implemented!" 
                ;;
            2)  
                addDefinition
                ;;
            3)
                deleteDefinition
                ;;
            *)
                echo "Invalid option!"
        esac
    done    
}

hello
menu
