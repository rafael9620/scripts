# Docker

```bash
__install_docker() {
  read -p 'Introduce your proxy: ' -i 'http://127.0.0.1:3128' -e proxy

  # Install Docker
  echo "deb [arch=$(dpkg --print-architecture) trusted=yes] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo http_proxy=$proxy apt-get --allow-insecure-repositories update
  sudo http_proxy=$proxy apt-get --allow-unauthenticated install docker-ce docker-ce-cli containerd.io
}
```

```bash
__delete_docker() {  
  # Delete Docker
  sudo rm -rf /var/lib/docker
  sudo apt-get purge docker-ce docker-ce-cli containerd.io
  sudo rm -rf /var/lib/containerd
}
```

```bash
__install_docker_compose() {
  # Install Docker-Compose
  sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
}
```

```bash
__delete_docker_compose() {
  # Delete Docker-Compose
  sudo rm /usr/local/bin/docker-compose
}
```
