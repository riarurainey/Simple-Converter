echo "Enter a definition:"
read -a user_input
arr_length="${#user_input[@]}"
string="${user_input[0]}"
number="${user_input[1]}"


rn='^[+-]?[0-9]+\.?[0-9]*$'
rs='[a-z]+_to_[a-z]+'
float='^[0-9]+$'
int='^[+-]?[0-9]+\.?[0-9]*$'


if [[ $string =~ $rs ]] && [[ $number =~ $rn ]] && [[ $arr_length = 2 ]]; then
    echo "Enter a value to convert:"
    read value
    while [[ ! $value =~ $float ]] && [[ ! $value =~ $int ]]
    do
        echo "Enter a float or integer value!"
        read value
    done
    Result=$(bc -l <<<$number*$value)
    echo "Result: $Result"
else
    echo "The definition is incorrect!"
fi
