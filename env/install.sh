#/bin/sh

DIR=$HOME
FILE=".env"

CONFIG_FILE=$DIR/$FILE
CONFIG_FILE_BACKUP=$DIR/$FILE.back

if [ -f $CONFIG_FILE ]; then
    echo "Backing up current $FILE..."
    if [ -f $CONFIG_FILE_BACKUP ]; then
        echo "Backup already exists. Exiting ..."
        exit
    else
        mv $CONFIG_FILE $CONFIG_FILE_BACKUP
    fi
else
    echo "No current config"
fi

echo "Copying $FILE config..."
cp $FILE $DIR

