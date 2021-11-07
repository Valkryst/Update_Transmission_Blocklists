This repository contains a bash script which downloads one or more blocklists and adds them to Transmission.

## Requirements

To use this script, you must be running [Transmission](https://transmissionbt.com) on Linux.

## Usage

To run this script, copy and paste the following commands into your bash terminal.

```bash
# Install Dependencies
sudo apt update
sudo apt install wget



# Download Script
sudo wget https://github.com/Valkryst/Update_Transmission_Blocklists/blob/main/update.sh



# Modify the script's permissions to allow it to be run.
sudo chmod +x update.sh



# Run the script
sudo ./update.sh
```

This script supports any number of blocklists in the `.zip`, `.tar.gz`, `.gz`, `.7z`, and `.txt` formats. To add them, update the `blocklists` array with additional URLs as follows:

```bash
blocklists=(
	"https://example.com/file.zip",
	"https://example.com/file.tar.gz",
	"https://example.com/file.gz",
	"https://example.com/file.7z",
	"https://example.com/file.txt"
)
```