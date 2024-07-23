bindkey -e

# ----------------- COMPINIT
zstyle :compinstall filename '/home/occhima/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# ----------------- STARSHIP
eval "$(starship init zsh)"


# ----------------- ZINIT
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/occhima/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/occhima/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/occhima/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/occhima/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/occhima/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/home/occhima/mambaforge/etc/profile.d/mamba.sh"
fi
#
