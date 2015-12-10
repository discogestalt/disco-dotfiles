# System-wide defaults
#
#    SBIN - Have "administrative" commands added to your path

export SBIN=1
export SBIN_PATH="/usr/local/sbin:/usr/sbin:/sbin"

if [ $SBIN ]; then
  export PATH="${SBIN_PATH}:${PATH}"
fi

# Environment variables for systm programs

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

# Settings for saving shell history
export HISTFILE="${HOME}/.zsh.history"
export HISTSIZE='528'
export SAVEHIST='512'

# If you set the $PRINTER environment variable to a printer,
# lpr (and "lp", "lpq", etc.) will use that printer by default.
#export PRINTER="printername"

# umask is 022 by default, change that here if you want something different
#umask 022

