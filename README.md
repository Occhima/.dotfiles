# My Dotfiles

This repository contains my personal configuration files for Nyxt, Zsh, Emacs, and Hyprland.

## Installation

To install these dotfiles on a new system, follow these steps:

### 1. Clone the Repository

Clone the bare repository to a "dot" folder in your home directory:

```sh
git clone --bare https://github.com/Occhima/dot.git $HOME/.dotfiles
```

### 2. Define the `config` Alias

Create an alias for interacting with the repository:

```sh
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Add this alias to your `.bashrc` or `.zshrc`:

```sh
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```

### 3. Checkout the Content

Check out the actual content from the repository to your home directory:

```sh
config checkout
```

If you encounter errors about existing files, backup and remove them:

```sh
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
config checkout
```

### 4. Hide Untracked Files

Set the flag to hide untracked files:

```sh
config config --local status.showUntrackedFiles no
```

## Usage

These dotfiles include configurations for:

- **Nyxt**: `~/.config/nyxt/init.lisp`
- **Zsh**: `~/.zshrc`
- **Emacs**: `~/.emacs.d/init.el`
- **Hyprland**: `~/.config/hyprland/hyprland.conf`

### Example Commands

To add and commit changes to your dotfiles:

```sh
config status
config add .zshrc
config commit -m "Update zsh configuration"
config push
```

## Customization

Feel free to customize these dotfiles to suit your preferences. Each configuration file is documented to help you understand the settings.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request with any improvements or suggestions.

