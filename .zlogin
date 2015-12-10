####################################################################
# Set "$_OS" to the current operating system ("SunOS 5.5.1", etc.) #
####################################################################

export _OS="`uname -sr`"

######################################################################
# If we're on a SunOS box, and we have a ".zlogin.sunos4", source it #
######################################################################

if [ "${_OS#SunOS 4}" != "$_OS" -a -f $HOME/.zlogin.sunos4 ]; then
  source $HOME/.zlogin.sunos4
  exit
fi

################################################
# Make sure that our terminal type isn't hosed #
################################################

if [ "$TERM" = "" ]; then
	echo "Setting terminal stuff"
	export TERM="`tset -S | awk '{print $1}'`"
fi
if [ "$TERM" = "xterm-color" ]; then
	export TERM="xtermc"
fi
if [ $TERM = "dialup" -o $TERM = "network" ]; then
	export TERM=vt100
fi

###########################################################################
# ----------------------------------------------------------------------- #
# ---- Put any commands you'd like to run upon login after this line ---- #
# ----------------------------------------------------------------------- #
###########################################################################

export ZLOGIN=done

