# System-wide defaults
#
#    SBIN - Have "administrative" commands added to your path

# Make sure that .zlogin was sourced, important for cases when zsh is
# started via exec from .bashrc, for example.
if [[ -z "$ZLOGIN" ]]; then
  source ~/.zlogin
fi

if [ -d /usr/local/etd/bin ]; then
  export PATH="/usr/local/etd/bin:${PATH}"
fi

export SBIN=1
export SBIN_PATH="/usr/local/sbin:/usr/sbin:/sbin"

if [ -d /usr/local/etd/sbin ]; then
  export SBIN_PATH="/usr/local/etd/sbin:${SBIN_PATH}"
fi

if [ $SBIN ]; then
  export PATH="${SBIN_PATH}:${PATH}"
fi

# Environment variables for system programs

#export ENSCRIPT='--fancy-header=mp'
export CLICOLOR='true'

# prefer vim if it's installed
if [ -x /usr/bin/vim ]; then
  export EDITOR='vim'
  export VISUAL='vim';
else
  export EDITOR='vi'
  export VISUAL='vi';
fi

# for the vi editor
export EXINIT='set noai nosm sw=4 ic'

export PAGER='less'
export LESS='ciMsR'

# Shell history settings
export HISTFILE=${HOME}/.zsh.history
export HISTSIZE='528'
export SAVEHIST='512'
