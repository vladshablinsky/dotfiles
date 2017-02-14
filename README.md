My dotfiles for zsh, tmux and vim.

Installation
============

First install these:

```
git tmux vim zsh
```

Then run this:

```shell
git clone --recursive https://github.com/vladshablinsky/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

next

macOS
=====
### iTerm

```shell
brew cask install iterm2
```

### Remap keyboard

Use Karabiner-Elements

### Solarized iTerm
(github link)[https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized]

and follow instructions.

### Clipboard

```shell
git clone https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard.git
cd tmux-MacOSX-pasteboard/
make reattach-to-user-namespace
sudo mv reattach-to-user-namespace /usr/local/bin
```

Linux
====

TODO
