
alias config='/usr/bin/git --git-dir=/home/occhima/.cfg/ --work-tree=/home/occhima'
alias doom='~/.config/emacs/bin/doom'

# Changing "ls" to "exa"
 alias ls='exa -al --color=always --group-directories-first --icons' # my preferred listing
 alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
 alias ll='exa -l --color=always --group-directories-first --icons'  # long format
 alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
 alias l.='exa -a  --icons| egrep "^\."'

# # pacman and yay
 alias parsua='paru -Sua --noconfirm'             # update only AUR pkgs (paru)
 alias parsyu='paru -Syu --noconfirm'             # update standard pkgs and AUR pkgs (paru)
 alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
 alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages


 # test
