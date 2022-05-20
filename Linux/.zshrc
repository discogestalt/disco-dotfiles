# Aliases

#alias f='finger'
#alias rl="rlogin"
#alias t="telnet"
alias ns="nslookup"
alias p="ping"

alias alpha='cat ~/phonetics.txt'
alias cn='cat > /dev/null'
alias dig='dig +search'
alias dir='ls -al'
alias dm='docker-machine'
alias edm='eval $(docker-machine env dev)'
alias g='grep -i'
alias gl='git log --pretty=fuller'
alias h='fc -dl -20'
alias j='jobs'
alias ls='ls -F --color=auto'
alias l='ls -an'
alias ll='ls -an | less'
alias m='less'
alias screen='_ssh_auth_save; screen'
alias s='screen -S'
alias sdr='screen -Dr'
alias sr='screen -r'
alias t='traceroute'
alias tm='_ssh_auth_save; SSH_AUTH_SOCK=~/.ssh/ssh-auth-sock-screen tmux -CC'
alias tma='tmux -CC attach'
alias where='whence -a'
#alias whois='whois -h geektools.com'

# If you would rather use nping, uncomment the line below
#alias ping 'nping'

# Load aliases from the .zaliases file, if it exists
#[ -f $HOME/.zaliases ] && source $HOME/.zaliases

#-------------------------------------------------------------------------#
# In zsh, you can embed arguments into your aliases by using the function #
# command.  Example function given below.                                 #
# "shell functions"                                                       #
#                                                                         #
#  $1 is the first argument                                               #
#  $2 is the second argument, etc.                                        #
#  $* Inserts all arguments                                               #
#-------------------------------------------------------------------------#

function cdp() {
    cd $*
    pwd
}

function _ssh_auth_save() {
	ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh-auth-sock-screen
}

# Functions for using the NetScaler Nitro API
function nshanode() {
  curl -sSk -u isgdo-rw:${NSPASS} -H "Content-Type: application/vnd.com.citrix.netscaler.hanode+json" "https://$1/nitro/v1/config/hanode" | jq '.'
}

function nscertkeys() {
  curl -sSk -u isgdo-rw:${NSPASS} -H "Content-Type: application/vnd.com.citrix.netscaler.sslcertkey+json" "https://$1/nitro/v1/config/sslcertkey/" | jq '.' | grep '"certkey"'
}

function nscert() {
  curl -sSk -u isgdo-rw:${NSPASS} -H "Content-Type: application/vnd.com.citrix.netscaler.sslcertkey+json" "https://$1/nitro/v1/config/sslcertkey/$2" | jq '.'
}

function nscertfiles() {
  curl -sSk -u isgdo-rw:${NSPASS} -H "Content-Type: application/vnd.com.citrix.netscaler.systemfile+json" "https://$1/nitro/v1/config/systemfile?args=filelocation:%2Fnsconfig%2Fssl" | jq '.' | grep $2
}

function nscertupdate() {
  curl -k -v -H "Content-Type: application/vnd.com.citrix.netscaler.sslcertkey+json" -u isgdo-rw:${NSPASS} "https://$1/nitro/v1/config/sslcertkey?action=update" -X POST -d "{\"sslcertkey\": {\"certkey\": \"$2\", \"cert\": \"$3.cert\", \"key\": \"$3.key\", \"passplain\": \"$4\", \"noDomainCheck\": \"true\"}}"
}

function nscertbinding() {
  curl -sSk -H "Content-Type: application/vnd.com.citrix.netscaler.sslcertkey_binding+json" -u isgdo-rw:${NSPASS} "https://$1/nitro/v1/config/sslcertkey_binding/$2" | jq '.'
}

function nscertdelete() {
  curl -sSk -u isgdo-rw:${NSPASS} -H "Content-Type: application/vnd.com.citrix.netscaler.sslcertkey+json" -X DELETE "https://$1/nitro/v1/config/sslcertkey/$2" | jq '.'
}

function nslbvserver() {
  curl -sSk -H "Content-Type: application/vnd.com.citrix.netscaler.lbvserver+json" -u isgdo-rw:${NSPASS} "https://$1/nitro/v1/config/lbvserver/$2" | jq '.'
}

function nscsvserver() {
  curl -sSk -H "Content-Type: application/vnd.com.citrix.netscaler.csvserver+json" -u isgdo-rw:${NSPASS} "https://$1/nitro/v1/config/csvserver/$2" | jq '.'
}

function nssslvserver() {
  curl -sSk -H "Content-Type: application/vnd.com.citrix.netscaler.sslvserver_binding+json" -u isgdo-rw:${NSPASS} "https://$1/nitro/v1/config/sslvserver_binding/$2" | jq '.'
}

function nssslvserver_bindcert() {
  curl -v -k -H "Content-Type: application/vnd.com.citrix.netscaler.sslvserver_sslcertkey_binding+json" -u isgdo-rw:${NSPASS} "https://$1/nitro/v1/config/sslvserver_sslcertkey_binding" -X PUT -d "{\"sslvserver_sslcertkey_binding\": {\"vservername\": \"$2\", \"certkeyname\": \"$3\"}}" | jq '.'
}

function nsservicegroups() {
  curl -sSk -u isgdo-rw:${NSPASS} -H "Content-Type: application/vnd.com.citrix.netscaler.servicegroup+json" "https://$1/nitro/v1/config/servicegroup" | jq '.'
}

function nssg() {
  curl -sSk -u isgdo-rw:${NSPASS} -H "Content-Type: application/vnd.com.citrix.netscaler.servicegroup+json" "https://$1/nitro/v1/config/servicegroup/$2" | jq '.'
}

function nssgxfwd() {
  curl -k -v -H "Content-Type: application/vnd.com.citrix.netscaler.servicegroup+json" -u isgdo-rw:${NSPASS} "https://$1/nitro/v1/config/servicegroup" -X PUT -d "{\"servicegroup\": {\"servicegroupname\": \"$2\", \"cip\": \"ENABLED\", \"cipheader\": \"X-forwarded-for\"}}"
}

function nssaveconf() {
  curl -k -v -u isgdo-rw:${NSPASS} -H "Content-Type: application/vnd.com.citrix.netscaler.nsconfig+json" "https://$1/nitro/v1/config/nsconfig?action=save" -X POST -d "{\"nsconfig\": {}}"
}

function nssc() {
  echo $(curl -sSk -u isgdo-rw:${NSPASS} -H "Content-Type: application/vnd.com.citrix.netscaler.nssavedconfig+json" "https://$1/nitro/v1/config/nssavedconfig") | awk -F '\n' '{print}'
}

function nsget() {
  curl -sSk -u isgdo-rw:${NSPASS} -H "Content-Type: application/vnd.com.citrix.netscaler.$2+json" "https://$1/nitro/v1/config/$2" | jq '.'
}

function nsput() {
  curl -k -v -u isgdo-rw:${NSPASS} -H "Content-Type: application/vnd.com.citrix.netscaler.$2+json" "https://$1/nitro/v1/config/$2" -X PUT -d "$3"
}

# Shell prompt config
# Set colors
fg_red=$'[1;31m'
fg_dkred=$'[0;31m'
fg_green=$'[1;32m'
fg_yellow=$'[1;33m'
fg_blue=$'[1;34m'
fg_magenta=$'[1;35m'
fg_dkmagenta=$'[0;35m'
fg_cyan=$'[1;36m'
fg_dkcyan=$'[0;36m'
fg_white=$'[1;37m'
fg_reset=$'[0;39m'

if [ "$TERM" = "xterm" -o "rxvt" ]; then
  HN=`hostname | awk -F. '{print (NF-2)}'`
  if [ "$HOME" = "/root" ] || [ "$USER" = "root" ]; then
    PROMPT="%{${fg_red}%}%n%{${fg_yellow}%}@%{${fg_dkred}%}%${HN}m%{${fg_white}%}:%{${fg_cyan}%}%2~%{${fg_red}%}%(#.#.>)%{${fg_reset}%} "
  elif [ "x$SSH_CLIENT" != "x" ]; then
    PROMPT="%{${fg_dkcyan}%}%n%{${fg_yellow}%}@%{${fg_dkmagenta}%}%${HN}m%{${fg_white}%}:%{${fg_cyan}%}%2~%{${fg_white}%}%(#.#.>)%{${fg_reset}%} "
  else
    # uncomment these two lines for timestamp on the right
    #PROMPT="%{${fg_yellow}%}%n%{${fg_white}%}@%{${fg_blue}%}%${HN}m%{${fg_white}%}:%{${fg_magenta}%}%2~%{${fg_white}%}%(#.#.>)%{${fg_reset}%} "
    #RPROMPT="%B[%*]%b"
    # uncomment this line for timestamp on the left
    PROMPT="%B[%*]%b %{${fg_yellow}%}%n%{${fg_white}%}@%{${fg_blue}%}%${HN}m%{${fg_white}%}:%{${fg_magenta}%}%2~%{${fg_white}%}%(#.#.>)%{${fg_reset}%} "
  fi
else
  PROMPT="%m:%2c%(#.#.>) "
fi

#-------------------------------------------------------------------------#
# Options can be set to alter the behavior of an interactive shell.  Some #
# of these options are given below.  See 'man zshoptions' for details     #
#-------------------------------------------------------------------------#

setopt CORRECT
setopt NOBEEP
setopt NOHUP

setopt AUTO_CD
setopt LIST_TYPES

# History options
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

# Bind the up and down arrow keys for correct operation
bindkey '[A' up-line-or-history
bindkey '[B' down-line-or-history

# Set language to the standard UNIX context so that sorting isn't all screwed up
# Pulled from .zshenv since the /etc/profile.d/lang.sh steps all over it
if [ "$LC_COLLATE" != "C" ]; then
  export LC_COLLATE=C
fi

# Enable iTerm shell integration if installed
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Virtualenv Wrapper tools
test -e /usr/local/etd/bin/virtualenvwrapper.sh && source /usr/local/etd/bin/virtualenvwrapper.sh

# Get the bash completions too
autoload -U +X bashcompinit && bashcompinit
