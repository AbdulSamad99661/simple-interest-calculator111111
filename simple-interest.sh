#!/bin/bash

# Simple Interest Calculator Script
# This script calculates simple interest based on principal, rate, and time period
# Formula: Simple Interest = (Principal × Rate × Time) / 100

echo "================================"
echo "Simple Interest Calculator"
echo "================================"
echo ""

# Input: Principal Amount
echo "Enter Principal Amount (in rupees): "
read principal

# Input: Rate of Interest
echo "Enter Rate of Interest (% per annum): "
read rate

# Input: Time Period
echo "Enter Time Period (in years): "
read time

# Validate inputs
if ! [[ "$principal" =~ ^[0-9]+\.?[0-9]*$ ]] || ! [[ "$rate" =~ ^[0-9]+\.?[0-9]*$ ]] || ! [[ "$time" =~ ^[0-9]+\.?[0-9]*$ ]]; then
    echo "Error: Please enter valid numeric values!"
    exit 1
fi

# Calculate Simple Interest
# Formula: SI = (P × R × T) / 100
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate Total Amount
# Total Amount = Principal + Simple Interest
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

# Display Results
echo ""
echo "================================"
echo "Calculation Results"
echo "================================"
echo "Principal Amount:      Rs. $principal"
echo "Rate of Interest:      $rate% per annum"
echo "Time Period:           $time years"
echo "Simple Interest:       Rs. $simple_interest"
echo "Total Amount:          Rs. $total_amount"
echo "================================"
