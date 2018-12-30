# Tutorial Linux commands
Tutorial on use of Linux commands

## SHELL configuration
`.bashrc` file allows to configure and set preferences of SHELL

Location : `$HOME/.bashrc` (`$HOME` is the user home directory ex: `/home/adrien`)

## Alias
Aliases allow to execute commands by typing another command the user chose
ex : `google` for `google-chrome` or `subl` for `sublime-text`
Type in this command : `alias 'your_command'='real_command'`

To keep theses changes in memory at the next session opening, write the command in `.bashrc` file (A section of the file is dedicated to it).

Links: 
https://www.linuxtricks.fr/wiki/personnaliser-son-shell-alias-couleurs-bashrc-cshrc

## Terminal command configuration and preferences
`ls` command (and its aliases) can be configured in `.bashrc` file.

Tip : Create an alias to display all files in list with information on size, date of modification, owners, etc.
`ll` command is already written with `ls -alF` but `ls -hlF` is easier to read, because `-h` is a human readable format (128K instead of 128000).
(See `man ls`for more information on `ls` command).

## Commands & $PATH
It is possible to add executable commands (like the main of a programm)  to the `$PATH` variable so it can be used like `ls`or `cd` (just typing `main` instead of `./main`).

To do so, add the executable file to one of the directories in `$PATH` (for example /usr/bin). To show all these directories, `echo $PATH`.

You can also add a new directory to the $PATH variable by typing : `export PATH=$PATH:/path/to/your/directory`

Links:
https://askubuntu.com/questions/3744/how-do-i-modify-my-path-so-that-the-changes-are-available-in-every-terminal-sess

## Other shell: ZSH & oh-my-zsh
`zsh` is another shell that can replace `bash`. It's autocompletion is really efficient.

`oh-my-zsh` is a framework that allow to configure zsh theme and use diverse plugins.

See `.zshrc` in `programs_and_config_files` for configuration of `zsh`

See `robbyrussell.zsh-theme` in `programs_and_config_files` for theme configuration of `zsh`

Links:
- https://github.com/robbyrussell/oh-my-zsh
- https://code.tutsplus.com/tutorials/how-to-customize-your-command-prompt--net-24083

## List of usefull Linux commands

### Process
`ps` : show kernel processus with PID

`&` : run a process in background

`ctrl + z` : interrupt a process in terminal to give it back

`bg` : run a interrupted process with `ctrl + z` in background equivalent to running with `&`

`fg` : bring back a background process in foreground

`nohup` : allow to execute process unattached to terminal

### Space
`df` : display disc space usage

`du` : display size of files 

- `-s` only the total for directories, 

- `-h` human readable format,

- `du -sh * | sort -hr` print all files and directories and sort by size 

### Git
`gitg` : visual utility for git giving branches and files modifications

`git diff` : show differences between old and new file

`git add -p` : allow to choose which part of a code include in commit

`git checkout --` : remove a file from commit --> remove modifications

### USB
`lsusb` : show Bus and name of devices connected via USB

`dmesg` : show every kernle messages. Usefull to know which USB port is used by a device you just plugged

### Drives
`lsblk` : show the drives and partitions


`dd` : copy file on drive overwriting it
- usefull when writing a .iso or .img file to flash drive or SD card (`sudo dd if=/path/to/image of=/path/to/drive bs=4M && sync`)

### Search tools
`ack-grep` : like grep but better (recursive by default, configuration)

Configuration : create a `.ackrc` in home directory (See .ackrc configuration file in `programs_and_config_files`) :

## Author & update
**Adrien CARBONARO**
*17/07/2018 17:00*