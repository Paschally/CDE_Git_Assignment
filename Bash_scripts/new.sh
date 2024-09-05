#!/bin/bash

# Environment Variables

data_url="https://we.tl/t-2xYLL816Yt"
derdsurl="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"
extract_folder="posey_db"

# Download & Extract data from url

downloaded_file="data_file.zip"  # Specify a file name for the downloaded file

# Download & Extract data from URL
echo "Starting the extraction"
mkdir -p "$extract_folder"

# Download the file and save it with the specified file name
curl -o "$extract_folder/$downloaded_file" "$data_url"

if [[ -f "$extract_folder/" ]];
then
	echo "File successfully downloaded into the raw folder"
else
	echo "File download failed"
	exit 1
fi
