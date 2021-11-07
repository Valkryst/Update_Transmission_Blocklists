#!/bin/bash

# Check if Transmission is Installed
if [[ -z $(type transmission-daemon 2>&1) ]]; then
	echo "The 'transmission-daemon' command could not be found, exiting."
	exit
fi



# Enable Blocklists in Transmission
sed -i 's/"blocklist-enabled": false/"blocklist-enabled": true/g' "/etc/transmission-daemon/settings.json"



# Create & CD Into Blocklists Folder
if [[ ! -d "/var/lib/transmission-daemon/info/blocklists" ]]; then
	mkdir "/var/lib/transmission-daemon/info/blocklists"
fi

cd "/var/lib/transmission-daemon/info/blocklists"



# Download Blocklists
blocklists=(
	"https://raw.githubusercontent.com/Naunter/BT_BlockLists/master/bt_blocklists.gz"
)

for url in "${blocklists[@]}"
do
	wget $url
done



# Extract Common Archives
if [[ -n $(type unzip 2>&1) ]]; then
	ls | grep ".*\.zip$" | xargs unzip -o >/dev/null 2>/dev/null
fi

if [[ -n $(type tar 2>&1) ]]; then
	ls | grep ".*\.tar.gz$" | xargs tar -x -z -f >/dev/null 2>/dev/null
fi

if [[ -n $(type gzip 2>&1) ]]; then
	ls | grep ".*\.gz$" | xargs gzip -d -f >/dev/null 2>/dev/null
fi

if [[ -n $(type p7zip 2>&1) ]]; then
	ls | grep ".*\.7z$" | xargs p7zip -d -f >/dev/null 2>/dev/null
fi



# Restart Transmission
sudo /etc/init.d/transmission-daemon reload



# Delete Downloaded Files
sleep 1m
ls | grep -v ".*\.bin" | xargs rm