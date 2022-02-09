# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

############################################################################################################################################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

############################################################################################################################################

# Text Reset
Color_Off=$'\033[0m'

# Regular Colors	         # Bold	                      # Underline	                # High Intensity	          # Bold High Intensity
Black=$'\033[0;30m'        	BBlack=$'\033[1;30m'       	UBlack=$'\033[4;30m'       	IBlack=$'\033[0;90m'       	BIBlack=$'\033[1;90m'
Red=$'\033[0;31m'          	BRed=$'\033[1;31m'         	URed=$'\033[4;31m'         	IRed=$'\033[0;91m'         	BIRed=$'\033[1;91m'
Green=$'\033[0;32m'        	BGreen=$'\033[1;32m'       	UGreen=$'\033[4;32m'       	IGreen=$'\033[0;92m'       	BIGreen=$'\033[1;92m'
Yellow=$'\033[0;33m'       	BYellow=$'\033[1;33m'      	UYellow=$'\033[4;33m'      	IYellow=$'\033[0;93m'      	BIYellow=$'\033[1;93m'
Blue=$'\033[0;34m'         	BBlue=$'\033[1;34m'        	UBlue=$'\033[4;34m'        	IBlue=$'\033[0;94m'        	BIBlue=$'\033[1;94m'
Purple=$'\033[0;35m'       	BPurple=$'\033[1;35m'      	UPurple=$'\033[4;35m'      	IPurple=$'\033[0;95m'      	BIPurple=$'\033[1;95m'
Cyan=$'\033[0;36m'         	BCyan=$'\033[1;36m'        	UCyan=$'\033[4;36m'        	ICyan=$'\033[0;96m'        	BICyan=$'\033[1;96m'
White=$'\033[0;37m'        	BWhite=$'\033[1;37m'       	UWhite=$'\033[4;37m'       	IWhite=$'\033[0;97m'       	BIWhite=$'\033[1;97m'


# Background	             # High Intensity backgrounds
On_Black=$'\033[40m'       	On_IBlack=$'\033[0;100m'
On_Red=$'\033[41m'         	On_IRed=$'\033[0;101m'
On_Green=$'\033[42m'       	On_IGreen=$'\033[0;102m'
On_Yellow=$'\033[43m'      	On_IYellow=$'\033[0;103m'
On_Blue=$'\033[44m'        	On_IBlue=$'\033[0;104m'
On_Purple=$'\033[45m'      	On_IPurple=$'\033[0;105m'
On_Cyan=$'\033[46m'        	On_ICyan=$'\033[0;106m'
On_White=$'\033[47m'       	On_IWhite=$'\033[0;107m'

############################################################################################################################################
proxy='127.0.0.1:3128'
noProxy='.uci.cu,.edu.cu,10.36.32.218,10.8.120.202'

export http_proxy=$proxy          # http://user:password@10.0.0.1:8080
export https_proxy=$http_proxy
export ftp_proxy=$http_proxy
export all_proxy=$http_proxy
export no_proxy=$noProxy          # No wildcards. Complete ip address -> 10.36.32.218.

export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$https_proxy
export FTP_PROXY=$ftp_proxy
export ALL_PROXY=$all_proxy
export NO_PROXY=$no_proxy

############################################################################################################################################
export PIP_INDEX=http://nexus.prod.uci.cu/repository/pypi-all/pypi
export PIP_INDEX_URL=http://nexus.prod.uci.cu/repository/pypi-all/simple
export PIP_TRUSTED_HOST=nexus.prod.uci.cu
export PIP_TIMEOUT=120
############################################################################################################################################

export alias chromium="/snap/bin/chromium \
--proxy-server='https=$http_proxy;http=$http_proxy' \
--proxy-bypass-list='*.uci.cu,*.edu.cu,10.0.0.0/8,192.168.0.0/16,169.254.0.0/16'"

############################################################################################################################################

host='127.0.0.1' # CNTLM
port='3128'
sp=org.gnome.system.proxy

gsettings set $sp use-same-proxy true
gsettings set $sp mode 'manual'
gsettings set $sp autoconfig-url ''
gsettings set $sp ignore-hosts "['localhost', '127.0.0.0/8', '::1','10.0.0.0/8', '192.168.0.0/16', '.edu.cu', '.uci.cu']"

gsettings set $sp.http enabled true
gsettings set $sp.http port $port
gsettings set $sp.http host $host
gsettings set $sp.http use-authentication false
gsettings set $sp.http authentication-user ''
gsettings set $sp.http authentication-password ''
gsettings set $sp.https port $port
gsettings set $sp.https host $host
gsettings set $sp.ftp port $port
gsettings set $sp.ftp host $host
gsettings set $sp.socks port $port
gsettings set $sp.socks host $host

############################################################################################################################################

__backup_file() {
  for file in $@; do
       test -f $file && test ! -f $file'~' && cp $file $file'~'
  done
}

__backup_file_as_root() {
  for file in $@; do
    sudo test -f $file && sudo test ! -f $file'~' && sudo cp $file $file'~'
  done
}

__remove_empty_lines() {
  for file in $@; do
       test -f $file && cat  -s $file | tee '~'$file &> /dev/null && mv '~'$file $file;
  done
}

__remove_empty_lines_as_root() {
  for file in $@; do
       sudo test -f $file && sudo cat -s $file | sudo tee '~'$file &> /dev/null && sudo mv '~'$file $file;
  done
}

############################################################################################################################################

WGET() {
  echo -e "\n***Do not use on Single Page Applications(SPA)***\n";

  __get() {
    local domain=$(echo $1 | sed -nE 's!(http|https)://!!p' | sed -nE 's!/.*!!p')
    echo 'Website:  '$domain'\n'
    wget --mirror --convert-links --adjust-extension --page-requisites --no-parent --no-clobber --domains $domain $1
  }

  local url;
  if [ -z $1 ]; then
    read -p "URL: " url
    __get $url
  else
    for url in "$@"; do
      __get $url
    done
  fi
}

############################################################################################################################################

CNTLM_SET() {
  local user pass
  local regex cmd
  read -p 'UCI User: ' -i 'jctexidor' -e user
  read -p 'UCI Password: ' -s pass
  echo

  __backup_file_as_root /etc/cntlm.conf

  regex='/^[[:space:]]*(Username|Domain|Password|Proxy|Listen|NoProxy|PassLM|PassNT|PassNTLMv2|SOCKS5Proxy|Gateway|Allow|Deny).*$/'
  sudo sed -i -E $regex'd' /etc/cntlm.conf

  local cmd="
Username        $user
Domain          UCI.CU
Password        $pass
Proxy           10.0.0.1:8080
NoProxy         uci.cu, edu.cu, localhost, 127.*, 10.*, 192.168.*
Listen          3128
SOCKS5Proxy     8010
Gateway         yes
Allow           127.0.0.1
Allow           10.8.120.0/24
Deny            0/0
"

  echo -e "$cmd" | sudo tee -a /etc/cntlm.conf &> /dev/null;

  echo $pass | cntlm -H -u $user@UCI.CU | sed -r '/^Password:.*$/d' | sudo tee -a /etc/cntlm.conf &> /dev/null;

  __remove_empty_lines_as_root '/etc/cntlm.conf'

  sudo systemctl restart cntlm &&  echo "source $HOME/.bashrc" | bash;
}

############################################################################################################################################

SMB_RESET_UCI_PASSWORD() {
  # Change the password in UCI domain
  __reset_password() { smbpasswd -r uci.cu -U $1; }

  if [ -z $1 ]; then
    local username && read -p 'Introduce your username: ' -i 'jctexidor' -e username;
    __reset_password $username
  else
    __reset_password $1
  fi
}

############################################################################################################################################

PROXY_SET() {
  local proxy && read -p 'Proxy: ' -i 'http://127.0.0.1:3128' -e proxy && echo;
  local noProxy && read -p 'No Proxy for: ' -i 'localhost,127.0.0.1,::1,uci.cu,edu.cu' -e noProxy && echo;

  __backup_file "$HOME/.bashrc"

  local regex='/^[[:space:]]*(unset|export)[[:space:]]+(http_proxy|https_proxy|ftp_proxy|all_proxy|no_proxy|HTTP_PROXY|HTTPS_PROXY|FTP_PROXY|ALL_PROXY|NO_PROXY).*$/'
  sed -i -E $regex'd' ~/.bashrc

  local cmd="
export http_proxy=$proxy                                  # http://user:password@10.0.0.1:8080
export https_proxy=$http_proxy
export ftp_proxy=$http_proxy
export all_proxy=$http_proxy
export no_proxy=$noProxy                                  # No wildcards. Complete ip address -> 10.36.32.222.

export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$https_proxy
export FTP_PROXY=$ftp_proxy
export ALL_PROXY=$all_proxy
export NO_PROXY=$no_proxy
"
  echo -e "$cmd" | tee -a ~/.bashrc | bash &> /dev/null && __remove_empty_lines $HOME'/.bashrc'
}

############################################################################################################################################

PROXY_UNSET() {
  __backup_file "$HOME/.bashrc"

  local regex='/^[[:space:]]*(unset|export)[[:space:]]+(http_proxy|https_proxy|ftp_proxy|all_proxy|no_proxy|HTTP_PROXY|HTTPS_PROXY|FTP_PROXY|ALL_PROXY|NO_PROXY).*$/';
  sed -i -E $regex'd' ~/.bashrc;

  local cmd="unset http_proxy https_proxy ftp_proxy all_proxy no_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY ALL_PROXY NO_PROXY";
  echo -e "$cmd" | tee -a ~/.bashrc | bash &> /dev/null && __remove_empty_lines $HOME'/.bashrc'
}
