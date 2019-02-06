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

# Uncomment LSCOLORS below to set colors for ls output.
# Default is exfxcxdxbxegedabagacad
# Colors:
# a     black
# b     red
# c     green
# d     brown
# e     blue
# f     magenta
# g     cyan
# h     light grey
# A     bold black, usually shows up as dark grey
# B     bold red
# C     bold green
# D     bold brown, usually shows up as yellow
# E     bold blue
# F     bold magenta
# G     bold cyan
# H     bold light grey; looks like bright white
# x     default foreground or background
# Attributes:
# 1.   directory
# 2.   symbolic link
# 3.   socket
# 4.   pipe
# 5.   executable
# 6.   block special
# 7.   character special
# 8.   executable with setuid bit set
# 9.   executable with setgid bit set
# 10.  directory writable to others, with sticky bit
# 11.  directory writable to others, without sticky bit

export LSCOLORS='Exfxcxdxbxegedabagacad'
