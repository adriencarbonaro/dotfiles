#------------------------------------
# install_dotfiles.sh
#------------------------------------
# Copy config. files on the host
# to prepare environment.
#
# Programs:
# - ZSH (shell)
# - Vim (editor)
# - Ack (search program)
# - Mutt (mail editor)
# - Terminator (terminal)
# - i3 (window manager)
# - screenlock.sh (screenlock)
# - Polybar (top status bar)
# - Compton (compositor)
# - Rofi (menu launcher)
# - Dunst (notification manager)
# - Git (version manager)
#------------------------------------
# Author: Adrien CARBONARO
# Update: 19/01/19 18:38
#------------------------------------

INSTALL_DIR="$HOME/dotfiles"

# -- Install dependencies ------------------------------------------------------
cat general_dependencies.txt | xargs sudo apt install --yes
cat i3_gaps_dependencies.txt | xargs sudo apt install --yes
cat polybar_dependencies.txt | xargs sudo apt install --yes


# -- OH-MY-ZSH -----------------------------------------------------------------
cd $HOME && sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# -- POLYBAR -------------------------------------------------------------------
git clone --branch 3.2 --recursive https://github.com/jaagr/polybar $HOME/polybar
mkdir -p   $HOME/polybar/build
$HOME/polybar/build.sh -f
sudo cmake $HOME/polybar
cd $HOME/polybar && sudo make install
mkdir -p $HOME/.config/polybar
cp $INSTALL_DIR/polybar/config $HOME/.config/polybar/

# -- I3-GAPS -------------------------------------------------------------------
git clone https://www.github.com/Airblader/i3 $HOME/i3-gaps
cd $HOME/i3-gaps
sudo autoreconf --force --install
sudo rm -rf $HOME/i3-gaps/build/
mkdir -p $HOME/i3-gaps/build && cd $HOME/i3-gaps/build/
$HOME/i3-gaps/configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install
mkdir -p $HOME/.config/i3
cp $INSTALL_DIR/i3/config $HOME/.config/i3/

# -- ZSH -----------------------------------------------------------------------
cp $INSTALL_DIR/zsh/.zshrc $HOME
cp $INSTALL_DIR/zsh/.bash_aliases $HOME
cp -r $INSTALL_DIR/ohmyzsh/custom/themes $HOME/.oh-my-zsh/custom
cp -r $INSTALL_DIR/ohmyzsh/custom/plugins $HOME/.oh-my-zsh/custom

# -- VIM -----------------------------------------------------------------------
mkdir -p $HOME/.vim/colors
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
cp $INSTALL_DIR/vim/.vimrc $HOME
cp $INSTALL_DIR/vim/.vim/colors/carbo.vim $HOME/.vim/colors/

# -- ACK -----------------------------------------------------------------------
cp $INSTALL_DIR/ack/.ackrc $HOME

# -- MUTT ----------------------------------------------------------------------
cp $INSTALL_DIR/mutt/.muttrc $HOME

# -- URXVT ---------------------------------------------------------------------
cp $INSTALL_DIR/urxvt/.Xdefaults $HOME

# -- ROFI ----------------------------------------------------------------------
cp $INSTALL_DIR/rofi/carbo.rasi $HOME/.config/rofi/
cp $INSTALL_DIR/rofi/config $HOME/.config/rofi/

# -- COMPTON -------------------------------------------------------------------
cp $INSTALL_DIR/compton/compton.conf $HOME/.config/

# -- DUNST ---------------------------------------------------------------------
cp $INSTALL_DIR/dunst/dunstrc $HOME/.config/dunst/

# -- FONTS ---------------------------------------------------------------------
cp -r $INSTALL_DIR/fonts/* $HOME/.fonts/

# Screenlock
#mkdir -p $HOME/bin
#cp $INSTALL_DIR/i3lock/.screenlock.sh $HOME/bin/

# Terminator
#mkdir -p $HOME/.config/terminator
#cp $INSTALL_DIR/terminator/config $HOME/.config/terminator
