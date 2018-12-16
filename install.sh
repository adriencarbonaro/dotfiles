#!/bin/sh

TOPDIR=$HOME/dotfiles/

######################
# Directory creation #
######################
mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/polybar
mkdir -p $HOME/.config/rofi
mkdir -p $HOME/.config/terminator
mkdir -p $HOME/.vim/
mkdir -p $HOME/bin

#######
# ack #
#######
cp $TOPDIR/ack/.ackrc $HOME/

###########
# compton #
###########
cp $TOPDIR/compton/compton.conf $HOME/.config/

#######
# git #
#######
cp $TOPDIR/git/.gitconfig $HOME/

######
# i3 #
######
cp $TOPDIR/i3/config $HOME/.config/i3/config

#############
# oh-my-zsh #
#############
cp $TOPDIR/ohmyzsh/themes/* $HOME/.oh-my-zsh/themes

###########
# polybar #
###########
cp $TOPDIR/polybar/config $HOME/.config/polybar/config

########
# rofi #
########
cp $TOPDIR/rofi/carbo.rasi $HOME/.config/rofi/carbo.rasi
cp $TOPDIR/rofi/config $HOME/.config/rofi/config

##############
# terminator #
##############
cp $TOPDIR/terminator/config $HOME/.config/terminator/config

#########
# URxvt #
#########
cp $TOPDIR/urxvt/.Xdefaults $HOME/.Xdefaults

#######
# vim #
#######
cp $TOPDIR/vim/.vimrc $HOME/.vimrc
cp -r $TOPDIR/vim/.vim $HOME/

#######
# zsh #
#######
cp $TOPDIR/zsh/.zshrc $HOME/.zshrc
cp $TOPDIR/zsh/.bash_aliases $HOME/.bash_aliases

