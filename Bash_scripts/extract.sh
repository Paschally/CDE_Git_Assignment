#!/bin/bash

# Environment Variables

data_url="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"
extract_folder="raw"

# Download & Extract data from url

echo "Starting the extraction"
mkdir -p "$extract_folder"
curl -o "$extract_folder/data.csv" "$data_url"

if [[ -f "$extract_folder/data.csv" ]];
then
	echo "File successfully downloaded into the raw folder"
else
	echo "File download failed"
	exit 1
fi
