#!/bin/bash
#
# Compile script for kernel
# Copyright (C) 2022 Craft Rom.

SECONDS=0 # builtin bash timer

#Set Color
blue='\033[0;34m'
grn='\033[0;32m'
yellow='\033[0;33m'
red='\033[0;31m'
nocol='\033[0m'
txtbld=$(tput bold)
txtrst=$(tput sgr0) 

DATE=$(date '+%Y-%m-%d  %H:%M')
HOME_DIR="JFla-Karamel"

# Telegram setup
push_message() {
    curl -s -X POST \
         https://api.telegram.org/bot5759949181:AAH-yOhz9OdUsFeb-82v92x5sy-o5DNV3UI/sendMessage \
        -d chat_id="-100159083395" \
        -d text="$1" \
        -d "parse_mode=html" \
        -d "disable_web_page_preview=true"
}

push_message "<b>Build JFla-Karamel bot is running.</b>
<b>Date:</b> <code>$DATE</code>"
echo -e "$blue    \nSetup build environment.\n $nocol"
push_message "- Setup build environment."

cd $HOME && sudo apt-get install git -y && git clone https://github.com/Risti699/scripts && cd scripts && sudo bash setup/android_build_env.sh
echo -e "$blue    \nDownloading manifest and initialized repo.\n $nocol"
push_message "- Downloading manifest and initialized repo."
cd $HOME
mkdir -p $HOME_DIR
cd $HOME/$HOME_DIR
repo init -u https://github.com/Risti699/kernel_manifest -b nightly
repo sync --detach --current-branch --no-tags --force-remove-dirty --force-sync
