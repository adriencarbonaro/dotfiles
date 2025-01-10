mkdir -p $HOME/tmp $HOME/bin
curl -o $HOME/tmp/zellij.tar.gz -fsSL https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz
tar -C$HOME/bin -xf $HOME/tmp/zellij.tar.gz
