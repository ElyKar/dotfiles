# Path to your oh-my-zsh installation.
  export ZSH=/home/elykar/.oh-my-zsh

  export TERM="xterm-256color"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bullet-train-custom"

export BULLETTRAIN_TIME_BG=220
export BULLETTRAIN_TIME_FG=21
export BULLETTRAIN_DIR_BG=93
export BULLETTRAIN_DIR_FG=233
export BULLETTRAIN_GIT_BG=243
export BULLETTRAIN_GIT_FG=53

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:~/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

if [ -f "./.shrc_custom" ]; then
    source "./.shrc_custom"
fi
