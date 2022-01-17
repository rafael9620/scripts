# OpenVPN


1. Donwload the file https://freevpn4you.net/files/Canada-tcp.ovpn.
```bash
wget -qO- https://freevpn4you.net/files/Canada-tcp.ovpn > Canada-tcp.ovpn
```

1. Open your network settings and create a new vpn connection choosing that file.

1. Set the username and password from https://freevpn4you.net
  > Username\*: freevpn4you  
  > Password*: 1234567

1. In **Advanced Settings** choose **Proxies** and select **Proxy Type** as **SOCKS**, in **Server Address** and **Port** set the server address and port where you are running *CNTLM* with socks. This is equivalent to putting in the downloaded file the lines:
```conf
socks-proxy '10.36.32.218' 8010
socks-proxy-retry
```

> **Linux**:  It is important to remember that   **CNTLM** and **VPN Client** can not run in the same machine.


##### CNTLM Configuration example:

*/etc/cntlm.conf*
```conf
Username        jctexidor
Domain          UCI.CU
Password        12345678
Proxy           10.0.0.1:8080
NoProxy         uci.cu, edu.cu, localhost, 127.*, 10.*, 192.168.*
Listen          3128
SOCKS5Proxy     8010
Gateway         yes
Allow           127.0.0.1
Allow           10.8.120.0/24
Deny            0/0
```
