echo "Enter a definition:"
read -a user_input
arr_length="${#user_input[@]}"
string="${user_input[0]}"
number="${user_input[1]}"


rn='^[+-]?[0-9]+\.?[0-9]*$'
rs='[a-z]+_to_[a-z]+'


if [[ $string =~ $rs ]] && [[ $number =~ $rn ]] && [[ $arr_length = 2 ]]; then
    echo "The definition is correct!"
else
    echo "The definition is incorrect!"
fi