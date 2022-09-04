#/bin/sh

CONFIG_DIR=$HOME/.config

PROGRAM="alacritty"

PROGRAM_DIR=$CONFIG_DIR/$PROGRAM
PROGRAM_BACKUP_DIR=$CONFIG_DIR/$PROGRAM.back

if [ -d $PROGRAM_DIR ]; then
    echo "Backing up current $PROGRAM..."
    if [ -d $PROGRAM_BACKUP_DIR ]; then
        echo "Backup already exists. Exiting ..."
        exit
    else
        mv $PROGRAM_DIR $PROGRAM_BACKUP_DIR
    fi
else
    echo "No current config"
fi

echo "Copying $PROGRAM config..."
cp -r . $PROGRAM_DIR

