# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions

if [ $SSH_TTY ]; then
  if [ -e /bin/zsh ]; then
    exec /bin/zsh
  elif [ -e /usr/bin/zsh ]; then
    exec /usr/bin/zsh
  fi
fi

