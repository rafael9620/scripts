# Gnome System Settings

```bash
gsettings list-recursively                        # Print all schemas keys and values.
gsettings list-recursively org.gnome.system.proxy # Print all schemas keys and values in org.gnome.system.proxy.
```

```bash
# host='127.0.0.1'
  host='10.36.32.218' # CNTLM
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
```
