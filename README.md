### **Script Explanation**
1. **`SOURCE_FOLDER`:** The folder you want to back up.
2. **`BACKUP_FOLDER`:** The folder where the backup will be saved.
3. **`TIMESTAMP`:** Generates a unique timestamp for the backup file name.
4. **`zip`:** Compresses the source folder into a `.zip` file stored at the specified backup path.
5. **Folder Check:** If the target backup folder does not exist, it is created automatically.
6. **Output Redirection:** Suppresses the `zip` command's output using `> /dev/null 2>&1` to keep the script output clean.

---

How to Run
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

### **Improvements**
- **Notifications:** Send an email or Slack message upon completion.
- **Logging:** Save backup details to a log file for easier tracking.
- **Old Backups Cleanup:** Automatically delete backups older than a specific duration. For example:
  ```bash
  find /path/to/backup/folder -type f -name "*.zip" -mtime +30 -exec rm {} \;
  ```
  This removes backups older than 30 days.
