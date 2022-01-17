

## Set Proxy

```bash
unset http_proxy https_proxy ftp_proxy all_proxy no_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY ALL_PROXY NO_PROXY
```

```bash
proxy='http://127.0.0.1:3128'
noProxy='10.36.32.218,10.8.120.202'

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
```


```bash
PROXY_UNSET() {
  __backup_file "$HOME/.bashrc"

  local regex='/^[[:space:]]*(unset|export)[[:space:]]+(http_proxy|https_proxy|ftp_proxy|all_proxy|no_proxy|HTTP_PROXY|HTTPS_PROXY|FTP_PROXY|ALL_PROXY|NO_PROXY).*$/';
  sed -i -E $regex'd' ~/.bashrc;

  local cmd="unset http_proxy https_proxy ftp_proxy all_proxy no_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY ALL_PROXY NO_PROXY";
  echo -e "$cmd" | tee -a ~/.bashrc | bash &> /dev/null && __remove_empty_lines $HOME'/.bashrc'
}
```

```bash
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
```
