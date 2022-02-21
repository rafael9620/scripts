# VNC

## List all settings.
```bash
gsettings list-recursively org.gnome.Vino
```

## Configuration example.
```bash
export DISPLAY=:0
gsettings set org.gnome.Vino enabled true
gsettings set org.gnome.Vino prompt-enabled false
gsettings set org.gnome.Vino require-encryption false

gsettings set org.gnome.Vino alternative-port 5910
gsettings set org.gnome.Vino use-alternative-port true

gsettings set org.gnome.Vino authentication-methods "['vnc']"
gsettings set org.gnome.Vino vnc-password $(echo -n "1qaz"|base64)

# gsettings set org.gnome.desktop.lockdown disable-user-switching true
# gsettings set org.gnome.desktop.lockdown disable-log-out true
# gsettings set org.gnome.desktop.interface enable-animations false
```


Para usar esta configuración de «vino» remotamente:
1. Instalar «remmina» `sudo apt-get install remmina`
1. Crear una jnueva conexión de escritorio remoto.
    * **Protocol**: ***Remmina VNC PLugin***
    * **Server**: ***10.36.32.218:5910***
    * **Password**: ***1qaz***
    * Dejar el resto de las configuraciones por defecto.



## Init the server
```bash
/usr/lib/vino/vino-server
```


## Reset all configurations.
```bash
gsettings reset-recursively org.gnome.Vino
```

## Reset configurations one by one.

```bash
gsettings reset org.gnome.Vino prompt-enabled
gsettings reset org.gnome.Vino require-encryption
gsettings reset org.gnome.Vino use-alternative-port
gsettings reset org.gnome.Vino disable-background
gsettings reset org.gnome.Vino disable-xdamage
gsettings reset org.gnome.Vino alternative-port
gsettings reset org.gnome.Vino icon-visibility
gsettings reset org.gnome.Vino authentication-methods
gsettings reset org.gnome.Vino network-interface
gsettings reset org.gnome.Vino notify-on-connect
gsettings reset org.gnome.Vino mailto
gsettings reset org.gnome.Vino lock-screen-on-disconnect
gsettings reset org.gnome.Vino use-upnp
gsettings reset org.gnome.Vino vnc-password
gsettings reset org.gnome.Vino view-only
```

## Default configuration.
```
org.gnome.Vino prompt-enabled true
org.gnome.Vino require-encryption true
org.gnome.Vino use-alternative-port false
org.gnome.Vino disable-background false
org.gnome.Vino disable-xdamage false
org.gnome.Vino alternative-port uint16 5900
org.gnome.Vino icon-visibility 'client'
org.gnome.Vino authentication-methods ['none']
org.gnome.Vino network-interface ''
org.gnome.Vino notify-on-connect true
org.gnome.Vino mailto ''
org.gnome.Vino lock-screen-on-disconnect false
org.gnome.Vino use-upnp false
org.gnome.Vino vnc-password 'keyring'
org.gnome.Vino view-only false
```
