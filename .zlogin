#@IgnoreInspection BashAddShebang
####################################################################
# Set "$_OS" to the current operating system ("Darwin 14.5.0", etc.) #
####################################################################

export _OS="`uname -sr`"

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

