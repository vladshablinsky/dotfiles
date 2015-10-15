My dotfiles for zsh, tmux and vim.

Installation
============

iTerm
=====
```shell
brew cask install iterm2
```

Karabiner and Seil
==================
Remapping keys and changing key repeats

(Karabiner)[https://pqrs.org/osx/karabiner/]
(Seil)[https://pqrs.org/osx/karabiner/seil.html.en]

Solarized iTerm
===============
(github link)[https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized]

and follow instructions.

vim, tmux, zsh
=============

To be able to configure tmux install:
```shell
git clone https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard.git
cd tmux-MacOSX-pasteboard/
make reattach-to-user-namespace
sudo mv reattach-to-user-namespace /usr/local/bin
```

```shell
git clone --recursive https://github.com/vladshablinsky/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```
