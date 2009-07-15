#!/bin/bash

#############################################################################
# Synchronizing Address Book with Google Contacts
#
# Author:  Riobard Zhan
# Email:   me@riobard.com
# Web:     http://riobard.com
# Version: 0.1
#
# This script will modify your system to synchronize your Address Book with 
# Google Contacts without needing an iPhone/iPod. The synchronization is done 
# periodically in the background using `launchd`. 
#
# WARNING: I WILL NOT BE RESPONSABLE FOR ANY DATA LOSS OR DAMAGES CAUSED BY 
#          THIS SCRIPT. USE AT YOUR OWN RISK!
#############################################################################

# location of the gconsync command
GCONSYNC=/System/Library/PrivateFrameworks/GoogleContactSync.framework/Resources/gconsync


# trick OS X to think there is an iPod attached

echo "{ Devices = { red-herring = { 'Family ID' = 10001; }; }; }"  > ~/Library/Preferences/com.apple.iPod.plist


# enable Address Book synchronization with Google
echo
echo Now open \"Address Book\" and click \"Preferences\" in the menu. Check \"Synchronize with Google\" box. It will ask for your Google account and password. 
echo
read -p "Did you check the box and enter your Google account and password? (Yes/No): " answer
if [[ "$answer" != [Yy]* ]]; then
    echo Bye.
    exit
fi


# start initial sync
echo
echo Initial synchronization started, please wait ... 
$GCONSYNC  --sync gconclid

echo Initial synchronization done. You may open Address Book and your Gmail Contacts page to check the result. 

# enable perodic sync
echo
echo How often do you want the synchronization to happen periodically? 

while true; do
    read -p "Enter a number in seconds [Default: 300]: " INTERVAL
    if [[ $INTERVAL == "" ]]; then
        INTERVAL=300
        break
    elif [[ $INTERVAL =~ ^[0-9]+$ ]]; then
        break
    else
        echo Invalid number!
    fi
done


# create launchd job file
cd ~/Library/LaunchAgents/
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
<dict>
    <key>Label</key>
    <string>com.google.contacts.sync.addressbook</string>
    <key>ProgramArguments</key>
    <array>
        <string>$GCONSYNC</string>
        <string>--sync</string>
        <string>gconclid</string>
        <string>--syncmode</string>
        <string>fast</string>
    </array>
    <key>StartInterval</key>
    <integer>$INTERVAL</integer>
</dict>
</plist>" >  com.google.contacts.sync.addressbook.plist

# load the job
launchctl load com.google.contacts.sync.addressbook.plist

echo Done. 
