# Dotfiles

Welcome to my dotfiles 🌅 

## About

My current setup is only tested on MacOS. I use a combination of iTerm, neovim and tmux.

### Structure

- Neovim related files is located in `/nvim`.
- Karabiner config for complete keyboard control `/karabiner/karabiner.json`
- Various scripts I use can be found in `/scripts`
- `/shell` has configs and profiles for bash, zsh, tmux, etc.

## Installation

- Clone the repository and move it to `~/.config`. If `~/.config` already exists, rename the old as `~/.config_backup`
- Install necessary programs using mainly `brew`. See the _Dependencies_ section for an incomplete list.
- [Symlink](https://linuxize.com/post/how-to-create-symbolic-links-in-linux-using-the-ln-command/) the following list of files to the home directory. This will let you have a file on the home directory which is just soft linked to a file in this repository. Changes in one of the files will reflect on the other, since they reference the same file.
  - `ln -s ~/.config/shell/bash_profile ~/.bash_profile`
  - `ln -s ~/.config/shell/ghci ~/.ghci`
  - `ln -s ~/.config/shell/zshrc ~/.zshrc`
  - `ln -s ~/.config/shell/tmux.conf ~/.tmux.conf`
  - `ln -s ~/.config/shell/ideavimrc ~/.ideavimrc`
  - `ln -s ~/.config/shell/gitconfig ~/.gitconfig`

### Dependencies

An incomplete list of packages, programs, etc is located below. Some things might be missing, but these are the most important ones.

#### Non-brew programs

- `iTerm`
- `ghc`. -> install via ghcup
- `ohmyzsh/zsh` `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- `base16` `git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell`

#### brew installed packages

Important:
```
brew install fd fswatch fzf neovim tmux python3 node nvm readline wget tree ripgrep gh bw exa zsh-syntax-highlighting coreutils greadlink

brew install --cask spotify iterm2 amethyst Contexts

brew tap homebrew/cask-fonts && brew install --cask font-fira-code 
-- install nerd font patch

brew install 

brew install gcloud
brew install --cask google-cloud-sdk
brew install --cask docker

brew install ffmpeg
pip3 install spotdl

brew install tokei ccat git-delta bat sd

-- language servers
npm i -g bash-language-server
npm i -g vscode-langservers-extracted

-- oh my zsh plugins
cd ${ZSH_CUSTOM1:-$ZSH/custom}/plugins
gh repo clone djui/alias-tips
gh repo clone zsh-users/zsh-syntax-highlighting
gh repo clone zsh-users/zsh-history-substring-search

-- tmux status
brew install go
go install github.com/arl/gitmux@latest
gh repo clone jonmosco/kube-tmux ~/.tmux/kube-tmux
```
