#!/bin/sh

TOPDIR=$(dirname ${BASH_SOURCE:-$0})

FG_BLUE="\033[34m"
FG_GREY="\033[37m"

echo "${FG_BLUE}Installing Adrien's dotfiles..."
echo "${FG_GREY}  Dotfiles: ${TOPDIR}"

# Call each sub-install scripts

