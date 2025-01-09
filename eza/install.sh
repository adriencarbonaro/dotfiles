mkdir -p $HOME/tmp $HOME/bin
curl -o $HOME/tmp/eza.zip -fsSL https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.zip
7z -y -o$HOME/bin x $HOME/tmp/eza.zip
