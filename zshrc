# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pmcgee"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git aws tmux)

# Don't abort commands if globbing fails.
# This enables the ^ operator in stuff like: git log HEAD^
setopt NO_NOMATCH

source $ZSH/oh-my-zsh.sh
source $HOME/.my_profile

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
