#!/bin/bash

# Function to cipher a single character (Caesar Cipher)
c_c() {

    local curr_char=$1
    local shift_num=$2

    # Why we wrote the uppercase-lowercase alphanumerical chars in a string form is to be able to
    # make the necessary calculations and printing measures relatively easily
    local lc_alphanum="abcdefghijklmnopqrstuvwxyz"
    local uc_alphanum="ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    if [[ $curr_char == [a-z] ]]; then # If the current character is a lowercase letter
        
	# Finds the position of the current character at the lowercase alphanumerical string
	local pos=$(expr index "$lc_alphanum" "$char")

	# Then uses that position to apply tihe caesar cipher algorithm
	# (uses remainder to keep the new position under scope)
        local new_pos=$(( (pos + shift_num - 1) % 26 ))
        echo -n "${lc_alphanum:new_pos:1}"

    elif [[ $curr_char == [A-Z] ]]; then # Same logic as the previous if statement but for uppercase letters
        
	local pos=$(expr index "$uc_alphanum" "$curr_char")
        local new_pos=$(( (pos + shift_num - 1) % 26 ))
        echo -n "${uc_alpha_num:new_pos:1}"
    else
        echo -n "$curr_char" # If we cannot apply the rules above, print the char unchanged
    fi
}

# Check if two arguments are passed
if [ $# -ne 2 ]; then
    echo "$0 'String' + 'Number'"
    exit 1
fi

input_string=$1
shift_number=$2

# Checking (1) all chars are numeral, (2) it's length is equal to one or (3) equal to the length of the string
if ! [[ $shift_number =~ ^[0-9]+$ ]] || ([ ${#shift_number} -ne 1 ] && [ ${#shift_number} -ne ${#input_string} ]); then
    echo "The number must be either of length 1 or the same length as the string."
    exit 1
fi

# Selecting each character at the string using for loop
for (( i=0; i<${#input_string}; i++ )); do
    char="${input_string:$i:1}"
    if [ ${#shift_number} -eq 1 ]; then # If shift numbers length equals to 1
        c_c "$char" "$shift_number"
    else # If shift numbers length equals to length of the string
        shift_digit="${shift_number:$i:1}" # Select corresponding numeral from the shifting number
        c_c "$char" "$shift_digit"
    fi
done

echo # Print a newline at the end

