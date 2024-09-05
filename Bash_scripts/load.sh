#!/bin/bash

# Environment Variables
raw="raw"
trans_folder="transformed"
csv="2023_year_finance.csv"

transformed_file="$trans_folder/$csv"
load_folder="gold"
final_file="finale.csv"

# Load
echo "Starting the load process..."
mkdir -p "$load_folder"

# Move the file to the load folder and rename it to finale.csv
mv "$transformed_file" "$load_folder/$final_file"

# Check if the final file exists in the load folder
if [ -f "$load_folder/$final_file" ]; then
    echo "File successfully loaded into the Gold directory."
else
    echo "Loading failed."
    exit 1
fi
