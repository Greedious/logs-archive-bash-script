# Log Archiving Script 💻

This Bash script is designed to archive log files from a specified source directory into a timestamped `.tar.gz` archive. The generated archive is stored in a target directory organized by month and year (e.g., `./logs/10_2024/`).

## Features

- Automatically creates the target directory if it does not exist.
- Checks for read and write permissions for both the source and target directories.
- Archives files in the source directory into a `.tar.gz` archive.
- Generates a unique archive filename based on the current timestamp and the source directory name.

## Usage

To run the script, use the following command format:

```bash
./log-archive.sh <source-directory>
```

## Example

```
./log-archive.sh /var/log/myapp
```
This command will create a .tar.gz archive of the log files in /var/log/myapp, and the archive will be saved in ./logs/current_month_current_year.

## Script Details

Required Permissions:
- The script checks if the source directory has read permissions before attempting to archive
- It also checks if the target directory is writable.


Error handling: 

- The script provides error messages for common issues such as missing permissions or incorrect usage.
- Specific exit codes are used for different types of errors for easier debugging.


## Author

Abdulghani Alkouwatli.
