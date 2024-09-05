#!/bin/bash


database_name="posey"
database_user="postgres"
data_url="https://we.tl/t-2xYLL816Yt"
csv_folder="csv_files"
csv_files=("web_events.csv" "orders.csv" "accounts.csv" "sales_reps.csv" "regions.csv")  

#Download CSV files from link to a storage folder
echo "Downloading CSV files..."
mkdir -p "csv_folder"
curl -o "$csv_folder/csv_files.zip" "$data_url"

#Unzip the downloaded files
echo "Extracting CSV files..."
unzip "$csv_folder/csv_files.zip" -d "$csv_folder"

#Load each CSV file into the PostgreSQL database
for file in "${csv_files[@]}";
do
    echo "Loading $file into the database..."
    psql -U "$database_user" -d "$daabase_name" -c "\copy ${file%.csv} FROM '$csv_folder/$file' DELIMITER ',' CSV HEADER"
done
