```bash
#!/bin/bash

sudo apt-get update


sudo apt-get install --assume-yes '^goldendict(-wordnet)?$' \
                        '^apertium(-spa|-en-es)?$' \
                        '^dict-(moby-thesaurus|vera|foldoc|gcide)$' \
                        '^dict-freedict-(spa-eng|spa-por|eng-spa|eng-por|por-eng|eng-rus)$' \
                        vera
sudo apt-get install --assume-yes dictd


sudo apt-get install --assume-yes '^caja(-share)?$'
sudo apt-get install --assume-yes '^p7zip(-full|-rar)?$'
sudo apt-get install --assume-yes audacious
sudo apt-get install --assume-yes cntlm
sudo apt-get install --assume-yes deepin-icon-theme
sudo apt-get install --assume-yes dia
sudo apt-get install --assume-yes flameshot
sudo apt-get install --assume-yes git
sudo apt-get install --assume-yes gnome-sudoku
sudo apt-get install --assume-yes gparted
sudo apt-get install --assume-yes inkscape
sudo apt-get install --assume-yes kazam
sudo apt-get install --assume-yes kid3-qt
sudo apt-get install --assume-yes materia-gtk-theme
sudo apt-get install --assume-yes meld
sudo apt-get install --assume-yes pandoc
sudo apt-get install --assume-yes samba
sudo apt-get install --assume-yes synaptic
sudo apt-get install --assume-yes texstudio texlive
sudo apt-get install --assume-yes usb-creator-gtk
sudo apt-get install --assume-yes variety
sudo apt-get install --assume-yes vlc
sudo apt-get install --assume-yes wget
sudo apt-get install --assume-yes wine-stable

sudo apt-get install --assume-yes nodejs
sudo apt-get install --assume-yes postgresql
sudo apt-get install --assume-yes mongodb mongoose 
sudo apt-get install --assume-yes sqlite3 sqlitebrowser


 
# --install-recommends 
# --autoremove
# --allow-insecure-repositories
# --allow-unauthenticated
 
sudo apt-get upgrade
sudo apt-get autoremove

exit 0;
```

### Databases

#### PostgreSQL

```bash

```
