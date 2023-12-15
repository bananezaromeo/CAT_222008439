#!/bin/bash

# Function to check if a number is prime
is_prime() {
    local num=$1
    local sqrtnum=$(echo "sqrt($num)" | bc)
    for ((i=2;i<=sqrtnum;i++)); do
        if ((num%i==0)); then
            echo "$num is not a prime number."
            return
        fi
    done
    echo "$num is a prime number."
}

# Function to check if a number is palindrome
is_palindrome() {
    local num=$1
    local reverse=$(echo $num | rev)
    if [ $num -eq $reverse ]; then
        echo "$num is a palindrome."
    else
        echo "$num is not a palindrome."
    fi
}

# Function to calculate sum and product of digits
sum_and_product() {
    local num=$1
    local sum=0
    local product=1
    while [ $num -gt 0 ]; do
        digit=$((num % 10))
        sum=$((sum + digit))
        product=$((product * digit))
        num=$((num / 10))
    done
    echo "Sum of digits: $sum"
    echo "Product of digits: $product"
}

# Main script
if [ $# -ne 1 ] || ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Please provide one positive integer as a command line argument."
    exit 1
fi

echo "Choose an option:"
echo "1. Display the sum and the product of the digits of the number"
echo "2. Display whether the number is a palindrome or not"
echo "3. Display whether the number is prime or not"
read -p "Enter your choice: " choice

case $choice in
    1) sum_and_product $1;;
    2) is_palindrome $1;;
    3) is_prime $1;;
    *) echo "Invalid choice";;
esac
