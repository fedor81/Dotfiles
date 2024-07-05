# Laroxyss dotfiles

## How to use
Install `zsh`. Then install `oh-my-zsh`

```sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"```

You can install my configuration using the script `install.sh`

Or you can only install neovim config.

## Installation Neovim Config

 > Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone https://github.com/fedor81/Dotfiles.git ~/.config/fedor81/Dotfiles
NVIM_APPNAME=fedor81/Dotfiles/.config/nvim nvim --headless "+Lazy! sync" +qa
```
 This section was generated by [Dotfyle](https://dotfyle.com)
