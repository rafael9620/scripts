#### How  to know the ip address of a web-site.
```bash
ping gitlab.prod.uci.cu

# PING gitlab.prod.uci.cu (10.128.50.27) 56(84) bytes of data.
# 64 bytes from 10.128.50.27 (10.128.50.27): icmp_seq=1 ttl=60 time=1.11 ms
# 64 bytes from 10.128.50.27 (10.128.50.27): icmp_seq=2 ttl=60 time=1.63 ms
# ...
```


```bash
nslookup gitlab.prod.uci.cu

# Server:		127.0.0.53
# Address:	127.0.0.53#53
#
# Non-authoritative answer:
# Name:	gitlab.prod.uci.cu
# Address: 10.128.50.27
```

#### nmap
```bash
nmap -p80 10.0.0.1-253
nmap -p80 10.0.0.*

nmap -p80 10.0-255.0-255.0-255
nmap -p443 10.0-255.0-255.0-255
```

#### LDAP

```bash
dig uci.cu any
```
```bash
host -t srv _ldap._tcp.UCI.CU # Saber la dirección del LDAP
# _ldap._tcp.UCI.CU has SRV record 0 100 389 ucidc2.uci.cu.
# _ldap._tcp.UCI.CU has SRV record 0 100 389 ucidc1.uci.cu.
# _ldap._tcp.UCI.CU has SRV record 0 100 389 ucidc4.uci.cu.
# _ldap._tcp.UCI.CU has SRV record 0 100 389 ucidc3.uci.cu.

host -t srv _ldap._tcp.dc._msdcs.UCI.CU
# _ldap._tcp.dc._msdcs.UCI.CU has SRV record 0 100 389 ucidc4.uci.cu.
# _ldap._tcp.dc._msdcs.UCI.CU has SRV record 0 100 389 ucidc1.uci.cu.
# _ldap._tcp.dc._msdcs.UCI.CU has SRV record 0 100 389 ucidc3.uci.cu.
# _ldap._tcp.dc._msdcs.UCI.CU has SRV record 0 100 389 ucidc2.uci.cu.

# ldapsearch -x -H ucidc1.uci.cu -p 389 -D "jctexidor" -W -b "DC=uci, DC=cu" cn
ldbsearch -H ldap://ucidc1.uci.cu -U "jctexidor" -b "DC=uci, DC=cu" -s sub "(samaccountname)"


```
