
############################################################################################################################################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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
