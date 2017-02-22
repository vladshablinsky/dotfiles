# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# case-sensitive completion.
# CASE_SENSITIVE="true"

DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"

plugins=(git)
# plugins=(git colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:/Users/vlad/.rvm/bin"
export CXX=g++
export CC=gcc

source $ZSH/oh-my-zsh.sh
fpath=(/usr/local/share/zsh/site-functions $fpath)
fpath=(/usr/local/share/zsh-completions $fpath)

local ret_status="%(?:%{$fg_bold[yellow]%}➜ :%{$fg_bold[red]%}➜ %s)"

if [ -z "$SSH_CLIENT"  ]; then
  PROMPT='${ret_status}%{$fg_no_bold[green]%}%n:%c$ %{$reset_color%}'
else
  PROMPT='${ret_status}%{$fg_no_bold[magenta]%}%n:%c$ %{$reset_color%}'
fi

RPROMPT='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Homebrew
export HOMEBREW_DEVELOPER=true
export HOMEBREW_NO_AUTO_UPDATE=true
export HOMEBREW_EDITOR=vim

# API Tokens
if [ -f ~/.sectets ]; then
  source ~/.secrets
fi

# Fun shit to export
export CDPATH=~/Projects:~/projects
source ~/.brew_scripts
