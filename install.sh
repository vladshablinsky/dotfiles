#!/usr/bin/env bash
# make symlinks

dir=~/dotfiles
olddir=~/dotfiles_old
files="zshrc vimrc vim gitconfig tmux.conf oh-my-zsh brew_scripts brew_livecheck_watchlist"

if [[ -d $olddir ]]; then
  echo "First cleanup your $olddir"
  exit 1
fi

echo "Creating $olddir for backup of any dotfiles in ~"
mkdir -p $olddir
echo "...completed!"

cd $dir
for file in $files; do
  echo $file
  if [ -f ~/.$file -o -d ~/.$file ]; then
    mv ~/.$file $olddir && ln -s $dir/$file ~/.$file
  else
    ln -s $dir/$file ~/.$file
  fi
done
echo "...completed!"

install_oh_my_zsh () {
  if [[ ! -d $dir/oh-my-zsh/ ]]; then
    git clone http://github.com/robbyrussell/oh-my-zsh.git
  fi

  if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        echo "Changing shell to zsh..."
        chsh -s $(which zsh)
    fi
  else
    echo "You might want to install zsh."
  fi
}

install_oh_my_zsh
