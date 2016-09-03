#!/usr/bin/env bash
# make symlinks

dir=~/dotfiles
olddir=~/dotfiles_old
files="zshrc vimrc vim gitconfig tmux.conf oh-my-zsh"

echo "Creating $olddir for backup of any dotfiles in ~"
mkdir -p $olddir
echo "...completed"

cd $dir
for file in $files; do
  if [ -f $file ]; then
    mv ~/.$file ~/dotfiles_old/
  fi
  ln -s $dir/$file ~/.$file
done

install_oh_my_zsh () {
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
  if [[ ! -d $dir/oh-my-zsh/ ]]; then
      git clone http://github.com/robbyrussell/oh-my-zsh.git
  fi

  # if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
  #     chsh -s $(which zsh)
  # fi
  echo "You might want to change shell, use chsh -s $(which zsh)"
else
  platform=$(uname);

  if [[ $platform == 'Linux' ]]; then
    sudo apt-get install zsh
    install_oh_my_zsh
  elif [[ $platform == 'Darwin' ]]; then
    if command -v brew >/dev/null 2>&1 ;then
      brew install zsh
      install_oh_my_zsh
    else
      echo "You got it without zsh"
      exit
    fi
  fi
fi
}

install_oh_my_zsh
