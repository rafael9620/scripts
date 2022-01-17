# SNAP


Update the snap apps:
```bash
sudo snap refresh
```

### Visual Studio Code

```bash
sudo snap install code --classic            \
&& echo fs.inotify.max_user_watches=524288  \
|  sudo tee -a /etc/sysctl.conf             \
&& sudo sysctl -p
```

```bash
SNAP_INSTALL_VSCODE() {
  if ( command -v snap && snap debug connectivity ); then # Check that «snap» is installed and has internet access.
    sudo snap install code --classic;
    if command -v code &> /dev/null;  then # Check that «code» is installed.
      echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p; # re-read config
    fi
  fi
}
```

### Atom

```bash
sudo snap install atom --classic
```
```bash
# Set proxy for Atom
proxy='http://127.0.0.1:3128'

apm config set strict-ssl false;
apm config set proxy $proxy;
apm config set http-proxy $proxy;
apm config set https-proxy $proxy;
```
```bash
# Unset proxy for Atom
apm config delete strict-ssl;
apm config delete proxy;
apm config delete http-proxy;
apm config delete https-proxy;
```

### Sublime Text
```bash
sudo snap install sublime-text --classic
```

### Postman
```bash
sudo snap install postman
```

### Typora
```bash
sudo snap install typora
```


### Chromium
```bash
if command -v snap && snap debug connectivity; then # Check that «snap» is installed and has internet access.
  sudo snap install chromium;
fi
```

```bash
export alias chromium="/snap/bin/chromium \
--proxy-server='https=$http_proxy;http=$http_proxy' \
--proxy-bypass-list='*.uci.cu,*.edu.cu,10.0.0.0/8,192.168.0.0/16,169.254.0.0/16'"
```

```bash
CREATE_CHROMIUM_LAUNCHER () {
  # Set chromium proxy.
  local proxy_server=$([ -n "$http_proxy" ] && echo "--proxy-server='https=$https_proxy;http=$http_proxy'" || echo '')
  local proxy_bypass_list=$([ -n "$no_proxy" ] && echo "--proxy-bypass-list='*.uci.cu,*.edu.cu,10.0.0.0/8,192.168.0.0/16,169.254.0.0/16'" || echo '')

  local chromium="/snap/bin/chromium $proxy_server $proxy_bypass_list";
  local chromium_launcher="/var/lib/snapd/desktop/applications/proxied_chromium.desktop";

  echo -e "
  [Desktop Entry]
  X-SnapInstanceName=chromium
  Version=1.0
  Name=Chromium Web Browser
  GenericName=Web Browser
  Keywords=Internet;WWW;Browser;Web;Explorer
  Comment=Chromium Web Browser
  Exec=env BAMF_DESKTOP_FILE_HINT=$chromium_launcher $chromium %U
  Terminal=false
  Type=Application
  Icon=/snap/chromium/current/chromium.png
  Categories=Network;WebBrowser;
  MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
  StartupNotify=true
  StartupWMClass=chromium
  Actions=NewWindow;Incognito;TempProfile;

  [Desktop Action NewWindow]
  Name=Open a New Window
  Exec=env BAMF_DESKTOP_FILE_HINT=$chromium_launcher $chromium

  [Desktop Action Incognito]
  Name=Open a New Window in incognito mode
  Exec=env BAMF_DESKTOP_FILE_HINT=$chromium_launcher $chromium --incognito

  [Desktop Action TempProfile]
  Name=Open a New Window with a temporary profile
  Exec=env BAMF_DESKTOP_FILE_HINT=$chromium_launcher $chromium --temp-profile

  " > "$chromium_launcher"
}
```



---

```bash
# snap changes
# snap abort <activity ID>
# snap install <package name>

# sudo snap unset system proxy.https
```

```bash
SNAP_SET_PROXY() {
  local proxy;
  read -p 'Proxy for Snap: ' -i $([ -n "$http_proxy" ] && echo $http_proxy || echo 'http://127.0.0.1:3128') -e proxy;
  sudo snap set system proxy.http="$proxy";
  sudo snap set system proxy.https="$proxy";
}
```

```bash
  sudo snap set system proxy.http=http://127.0.0.1:3128;
  sudo snap set system proxy.https=http://127.0.0.1:3128;
  
  sudo snap set system proxy.http=$http_proxy;
  sudo snap set system proxy.https=$https_proxy;
```
