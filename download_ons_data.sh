#!/bin/bash

# Destination directory for files
DOWNLOAD_DIR="/home/joao/Documents/ONS_CED_TimeSeries/raw_data"

# Create the destination directory if it does not exist
mkdir -p "$DOWNLOAD_DIR"

# Change to the destination directory
cd "$DOWNLOAD_DIR" || { echo "Failed to change to directory $DOWNLOAD_DIR. Check permissions."; exit 1; }

# Loop to download Parquet files from 2000 to 2025
for year in $(seq 2000 2025); do
    echo "Downloading CARGA_ENERGIA_${year}.parquet..."
    wget "https://ons-aws-prod-opendata.s3.amazonaws.com/dataset/carga_energia_di/CARGA_ENERGIA_${year}.parquet"
    if [ $? -ne 0 ]; then
        echo "Error downloading CARGA_ENERGIA_${year}.parquet. Continuing..."
    fi
done

echo "Download completed for years 2000 to 2025."
