#### Update linux
```bash
sudo apt update
sudo apt upgrade
sudo apt autoremove
```

#### Install packages
```bash
sudo apt install -y deepin-icon-theme
sudo apt install -y materia-gtk-theme

# OFFICE
sudo apt install -y '^mythes-(en-us|es)$'                           # thesaurus
sudo apt install -y '^hyphen-(en-us|es)$'                           # hyphenation patterns
sudo apt install -y '^hunspell-(en-us|es)$'                         # spellcheckers
sudo apt install -y '^libreoffice-style-(breeze|yaru)$'             # styles
sudo apt install -y '^libreoffice-(calc|draw|impress|math|writer)$' # suits

# DICTIONARY
sudo apt install -y '^goldendict(-wordnet)?$' \
                    '^dict-(vera|foldoc|gcide)$' \
                    '^dict-freedict-(spa-eng|eng-spa)$' \
sudo apt install -y dictd

sudo apt install -y '^caja(-share)?$'
sudo apt install -y '^p7zip(-full|-rar)?$'
sudo apt install -y audacious
sudo apt install -y cntlm
sudo apt install -y dia
sudo apt install -y flameshot
sudo apt install -y gnome-sudoku
sudo apt install -y gparted
sudo apt install -y inkscape
sudo apt install -y kazam
sudo apt install -y kid3-qt
sudo apt install -y pandoc
sudo apt install -y samba
sudo apt install -y synaptic
sudo apt install -y texstudio texlive
sudo apt install -y usb-creator-gtk
sudo apt install -y variety
sudo apt install -y vlc
sudo apt install -y curl wget
sudo apt install -y wine-stable

# DEVELOPMENT
sudo apt install -y git
sudo apt install -y meld
sudo apt install -y nodejs
sudo apt install -y postgresql
sudo apt install -y mongodb mongoose
sudo apt install -y sqlite3 sqlitebrowser
sudo apt install -y docker docker-compose
```

#### APT
```bash
sudo apt install \
  --install-recommends \
  --autoremove \
  --allow-insecure-repositories \
  --allow-unauthenticated \
  --asume-yes \
  --only-upgrade \

# --asume-yes, --yes or -y
```

###### Update from internet trhough a proxy.
```bash
sudo http_proxy="http://localhost:3128/" no_proxy=".uci.cu,edu.cu" apt update
```

```bash
echo 'Acquire::http::Proxy "http://127.0.0.1:3128"' | \
tee -a /etc/apt/apt.conf                            & \
sudo apt update
```

###### Update only one application
```bash
sudo apt --only-upgrade install firefox
```

* `list` - list packages based on package names.
* `search` - search in package descriptions
* `show` - show package details
* `install` - install packages  
* `reinstall` - reinstall packages
* `remove` - remove packages
* `autoremove` - Remove automatically all unused packages
* `update` - update list of available packages
* `upgrade` - upgrade the system by installing/upgrading packages
* `full-upgrade` - upgrade the system by removing/installing/upgrading packages
* `edit-sources` - edit the source information file
* `satisfy` - satisfy dependency strings
