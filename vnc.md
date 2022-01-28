VNC

```bash
export DISPLAY=:0
gsettings set org.gnome.Vino enabled true
gsettings set org.gnome.Vino prompt-enabled false
gsettings set org.gnome.Vino require-encryption false

gsettings set org.gnome.Vino alternative-port 5910
gsettings set org.gnome.Vino use-alternative-port true

gsettings set org.gnome.Vino authentication-methods "['vnc']"
gsettings set org.gnome.Vino vnc-password $(echo -n "mypassword"|base64)

gsettings set org.gnome.desktop.lockdown disable-user-switching true
gsettings set org.gnome.desktop.lockdown disable-log-out true
gsettings set org.gnome.desktop.interface enable-animations false

/usr/lib/vino/vino-server
```