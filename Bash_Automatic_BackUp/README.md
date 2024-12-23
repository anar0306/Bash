### **Bash Script for Creating Automatic Backups**

```bash
#!/bin/bash

# Folder to back up
SOURCE_FOLDER="/path/to/source/folder"

# Folder to store the backup
BACKUP_FOLDER="/path/to/backup/folder"

# File name for the backup (with timestamp)
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILENAME="backup_$TIMESTAMP.zip"
BACKUP_PATH="$BACKUP_FOLDER/$BACKUP_FILENAME"

# Check if the backup folder exists, create it if it doesn't
if [ ! -d "$BACKUP_FOLDER" ]; then
    mkdir -p "$BACKUP_FOLDER"
    echo "Backup folder created: $BACKUP_FOLDER"
fi

# Compress the folder into a zip file
zip -r "$BACKUP_PATH" "$SOURCE_FOLDER" > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "Backup successfully created: $BACKUP_PATH"
else
    echo "An error occurred during the backup process."
fi
```

---

### **Script Explanation**
1. **`SOURCE_FOLDER`:** The folder you want to back up.
2. **`BACKUP_FOLDER`:** The folder where the backup will be saved.
3. **`TIMESTAMP`:** Generates a unique timestamp for the backup file name.
4. **`zip`:** Compresses the source folder into a `.zip` file stored at the specified backup path.
5. **Folder Check:** If the target backup folder does not exist, it is created automatically.
6. **Output Redirection:** Suppresses the `zip` command's output using `> /dev/null 2>&1` to keep the script output clean.

---

### **How to Run**
1. **Save the script to a file:**
   Save the script as, for example, `backup.sh`:
   ```bash
   nano backup.sh
   ```
   Paste the code into the file and save it.

2. **Make the file executable:**
   ```bash
   chmod +x backup.sh
   ```

3. **Run the script:**
   ```bash
   ./backup.sh
   ```

---

### **Automation with Cron**
To automate the backup process, use `cron`:

1. Edit the `crontab` file:
   ```bash
   crontab -e
   ```

2. Add the following line to run the script daily at 2:00 AM:
   ```bash
   0 2 * * * /path/to/backup.sh
   ```

---
