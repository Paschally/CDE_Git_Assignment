#!/bin/bash

# Environment Variables
raw="raw"
trans_folder="transformed"
csv="2023_year_finance.csv"

# Transform
echo "Starting the transformation process..."
mkdir -p $trans_folder
awk -F, 'BEGIN { OFS = "," } { if(NR == 1) { gsub("Variable_code", "variable_code", $0) } print $1,$2,$3,$4 }' $raw/data.csv > $trans_folder/$csv

# Check if the transformation was successful
if [ -f "$trans_folder/$csv" ]; then
    echo "File successfully transformed and saved in the Transformed directory."
else
    echo "Transformation process failed."
    exit 1
fi
