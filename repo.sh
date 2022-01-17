#!/bin/bash

sudo apt-get update
sudo apt-get -y install cntlm
sudo apt-get -y install caja-share
sudo apt-get -y install dia
sudo apt-get -y install dictd
sudo apt-get -y install git
sudo apt-get -y install gnome-sudoku
sudo apt-get -y install '^goldendict(-wordnet)?$' '^apertium(-spa|-en-es)?$' '^dict-(moby-thesaurus|vera|foldoc|gcide)$' vera '^dict-freedict-(spa-eng|spa-por|eng-spa|eng-por|por-eng|eng-rus)$'
sudo apt-get -y install gparted
sudo apt-get -y install inkscape
sudo apt-get -y install kazam
sudo apt-get -y install kid3-qt
sudo apt-get -y install '^p7zip(-full|-rar)?$'
sudo apt-get -y install postgresql
sudo apt-get -y install texstudio texlive
sudo apt-get -y install meld
sudo apt-get -y install pandoc
sudo apt-get -y install samba
sudo apt-get -y install sqlite3 sqlitebrowser
sudo apt-get -y install usb-creator-gtk
sudo apt-get -y install variety
sudo apt-get -y install vlc
sudo apt-get -y install flameshot
sudo apt-get -y install wget
sudo apt-get -y install wine-stable
sudo apt-get -y install synaptic
sudo apt-get -y install audacious
sudo apt-get -y install materia-gtk-theme
sudo apt-get -y install deepin-icon-theme

sudo apt-get upgrade
sudo apt-get autoremove

exit 0;
