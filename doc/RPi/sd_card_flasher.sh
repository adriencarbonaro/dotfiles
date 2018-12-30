#!/bin/bash

##
# file: sd_card_flasher.sh
#
# This script flash an img/iso file on a SD cart,
# for example raspian in a Raspberry Pi SD card.
#
# 1. Copy the image in the SD card.
# 2. Copy back in a new img file.
# 3. Truncate the image to the right size.
# 4. Compare the two images to check its integrity.
#
# Author: Adrien CARBONARO

# 1st parameter: img/iso file path
# 2nd parameter: SD card path
SRC=$1
DEST=$2

# Check number of parameters
if [ $# != 2 ]
then
  echo -e "\033[31;1mERROR: number of parameters wrong\033[0m"
  echo ""
  echo -e "\033[36;1mCorrect way:\033[0m"
  echo -e "\033[36;1m$0 [SRC] [DEST]\033[0m"
  exit
fi

# Copy the image file into the SD card.
echo -e "\033[34mStarting copy from $SRC to $DEST\033[0m"
dd bs=4M if=$SRC of=$DEST status=progress conv=fsync
echo -e "\033[34mIMG copied to SD card\033[0m"

# Copy the content of SD card to a new image.
echo -e "\033[34mCopying the IMG back to check integrity\033[0m"
dd bs=4M if=$DEST of=from_sd_card.img status=progress conv=fsync
echo -e "\033[34mIMG copied back\033[0m"

# Truncate the image to the size of the original os image,
# in case the SD card is larger than the simple img file.
truncate --reference $SRC from_sd_card.img

# Show if there is a difference between the two images.
echo -e "\033[34mChecking integrity of IMG\033[0m"
diff from_sd_card.img $SRC &> /dev/null

if [ $? -eq 0 ]
then
  echo -e "\033[36;1mOK\033[0m"
else
  echo -e "\033[31;1mNOK\033[0m"
fi

# Flush writing buffer.
sync
