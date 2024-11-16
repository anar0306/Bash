#!/bin/bash

# Folder to which the backup will be taken
SOURCE_FOLDER="/path/to/source/folder"

# The folder where the backup will be saved
BACKUP_FOLDER="/path/to/backup/folder"

# File name for the backup (with timestamp)
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILENAME="backup_$TIMESTAMP.zip"
BACKUP_PATH="$BACKUP_FOLDER/$BACKUP_FILENAME"

# Check the backup directory, create it if it doesn't exist
if [ ! -d "$BACKUP_FOLDER" ]; then
    mkdir -p "$BACKUP_FOLDER"
    echo "Backup folder created: $BACKUP_FOLDER"
fi

# Compress the folder into a zip file
zip -r "$BACKUP_PATH" "$SOURCE_FOLDER" > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Backup created successfully: $BACKUP_PATH"
else
    echo "An error occurred during backup."
fi
