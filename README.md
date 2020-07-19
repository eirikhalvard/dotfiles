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

### Dependencies

An incomplete list of packages, programs, etc is located below. Some things might be missing, but these are the most important ones.

#### Non-brew programs

- `Karabiner`
- `iTerm`
- `ghc`
- `ohmyzsh/zsh`

#### brew installed packages

```
brew install ccat fd fswatch fzf google-java-format neovim tmux python3 pandoc node nvm readline proselint hub shellcheck wget tree ripgrep
```
