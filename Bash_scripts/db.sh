#!/bin/bash

# Variables
database_name="posey"
database_user="postgres"
csv_folder="csv_files"
csv_files=("web_events.csv" "orders.csv" "accounts.csv" "sales_reps.csv" "regions.csv")
zip_file="posey_db.zip"

#Create a folder to extract the CSV files
echo "Setting up CSV folder..."
mkdir -p "$csv_folder"

#Unzip the csv files
echo "Extracting CSV files..."
unzip "$zip_file" -d "$csv_folder"

#Load each CSV file into the PostgreSQL database
for file in "${csv_files[@]}"; 
do
    echo "Loading $file into the database..."
    psql -U "$database_user" -d "$database_name" -c "\copy ${file%.csv} FROM '$csv_folder/$file' DELIMITER ',' CSV HEADER"
done

echo "All CSV files have been loaded into the PostgreSQL database."

