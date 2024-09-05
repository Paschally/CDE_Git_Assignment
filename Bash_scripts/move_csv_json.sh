#!/bin/bash

source_folder="initial_folder"
final_folder="json_and_CSV"

mkdir -p $source_folder
mkdir -p $final_folder

# Create dummy CSV files
echo "Valdoz,ATE,400L" > "$source_folder/csv_a.csv"
echo "Paulo,MEE,500L" >> "$source_folder/csv_b.csv"

# Create dummy JSON files
echo '{"name": "Bamaiyi", "age": 78, "city": "Argungu"}' > "$source_folder/json_b.json"
echo '{"name": "General Ibrahim", "age": 55, "city": "Gumel"}' > "$source_folder/json_b.json"

for csv_json_file in $source_folder/*.{csv,json}; 
do
    if [ -f "$csv_json_file" ]; then
        mv "$csv_json_file" "$final_folder/"
        echo "CSV & JSON files moved successfully"
    else
	echo "Error is $?"
    fi
done
