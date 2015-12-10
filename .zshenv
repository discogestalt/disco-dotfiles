#-------------------------------------------------------------------------#
#                                                                         #
# The system-wide defaults allow for a little bit of custimization:       #
#                                                                         #
#    SYSV - Get "System-V'ish" behavior                                   #
#                                                                         #
#           The way things are set up here, "/usr/ucb" comes before       #
#           "/usr/bin".  This is to ease the transition from SunOS to     #
#           Solaris.  If you're used to System V'ish commands ("ps -af"   #
#           rather than "ps -aux", etc.), uncomment the "export SYSV=1"   #
#           line below.                                                   #
#                                                                         #
#    SBIN - Have "administrative" commands added to your path             #
#                                                                         #
#           Commands that sysadmins might want to run (Like "dmesg", for  #
#           example) live in their own subdirectories.  The normal user   #
#           would never need to run them, but the option is provided just #
#           in case you ever need them.  To have these directories added  #
#           to your path, uncomment the "export SBIN=1" line below.  Note #
#           that doing so comes with a [very slight] performance loss, as #
#           each time you type in a command, an extra half-a-dozen        #
#           directories have to be searched.                              #
#                                                                         #
#-------------------------------------------------------------------------#

export SYSV=1
#export SBIN=1
export SBIN_PATH="/sbin:/usr/sbin:/usr/local/sbin"

export _OS="`uname -s`"

# Set language to the standard UNIX context so that sorting is all screwed up
if [ "$LANG" != "C" ]; then
  export LANG=C
fi

#-------------------------------------------------------------------------#
#                                                                         #
# Your "PATH" environment variable is a list of directories that are    #
# searched whenever you type a command.  Your shell will check each       #
# directory in this list for an executable matching the command you're    #
# running.  The first such executable found will be used.                 #
#                                                                         #
# When adding directories to your path, it is strongly encouraged that    #
# you put them at the *END* of your $PATH environment variable.  Doing so #
# will help to ensure a similar look-and-feel for everyone.               #
#                                                                         #
# You should *NOT* add "." to your $PATH.  There have been numerous       #
# instances of people being in directories with executables with names    #
# like "ls" or "cd", and having *THESE* file be executed without the      #
# user realizing what they were running.  You can protect yourself from   #
# having to worry about this by never putting "." on your $PATH.          #
#                                                                         #
# As an example, we'll add "$HOME/bin".                                   #
#                                                                         #
#-------------------------------------------------------------------------#

if [ $SBIN ]; then
  export PATH="${SBIN_PATH}:${PATH}"
fi


#-------------------------------------------------------------------------#
#                                                                         # 
# Certain programs allow you to override their default values by setting  #
# particular "environment variables" (Similar to $SBIN and $SYSV above).  #
# Many programs that run "vi" can be told to run "emacs" instead by       #
# setting the $EDITOR and $VISUAL variables.  Similarly, programs like    #
# "man" can be told to use something like "less" instead of "more" via    #
# the $PAGER variable.                                                    #
#                                                                         # 
# Also, programs like "less" and "enscript" allow you to pass default     #
# command-line options via the "$LESS" and "$ENSCRIPT" environment        #
# variables, respectively.  Here are a couple of examples.  For the gory  #
# details, read each program's manpage ("man less", e.g.).                #
#                                                                         # 
#-------------------------------------------------------------------------#

#export EDITOR='emacs'
#export VISUAL='emacs'
#export PAGER='less'
#export LESS='-eiXw'
#export ENSCRIPT='--fancy-header=mp'
export CLICOLOR='true'

######################################################################
# disco preferences

# prefer vim if it's installed
if [ -x /usr/local/bin/vim ]; then
  export EDITOR='vim'
  export VISUAL='vim';
else
  export EDITOR='vi'
  export VISUAL='vi';
fi

# for the vi editor
export EXINIT='set noai nosm sw=4 ic'

export LESS='ciMsR'
export PAGER='less'

# Settings for saving shell history
export HISTFILE="${HOME}/.zsh.history"
export HISTSIZE='528'
export SAVEHIST='512'

######################################################################

#-------------------------------------------------------------------------#
#                                                                         #
# Normally, when you use "lpr" to print, you specify the printer with the #
# "-P" flag.  If you set the $PRINTER environment variable to a printer,  #
# lpr (and "lp", "lpq", etc.) will use that printer by default.           #
#                                                                         #
# We don't actually set a printer by default.  There are too many people  #
# in too many floors of too many buildings to be able to guess where a    #
# user might want to print.  Thus, it's up to you to uncomment this line  #
# and change "printername" to one the one you want to print to.           #
#                                                                         #
#-------------------------------------------------------------------------#

#export PRINTER="printername"


#-------------------------------------------------------------------------#
#                                                                         # 
# Your "umask" is an octal "mask" that effects the permissions on files   #
# that you create.  InfoSec recommends it be set to "077" by default.     #
# This means that when a file is created, it will *NOT* have read, write, #
# or execute permissions for any other users.                             #
#                                                                         # 
# If you'd like your files to be world-readable, you can change this to   #
# "022" (This will make your files readable, and possibly executable, but #
# not writeable).  "man umask" for further details.                       #
#                                                                         # 
#-------------------------------------------------------------------------#

#umask 022

