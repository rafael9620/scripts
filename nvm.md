# NVM <small>[Node Version Manager]</small>

```bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
. ~/.nvm/nvm.sh
```

```bash
nvm install node        #  Install the latest available version
nvm use node            #  Use the latest version
```

```bash
nvm install --lts       #  Install the latest LTS version
nvm use --lts           #  Use the latest LTS version
```

```bash
nvm install 14
nvm use 14
```

> If NVM is not installed you must download and install nodejs, configure npm for sudo user: */root/.npmrc* and install packages as sudo user.  
>
> Download and extract all files in */usr/*
> ```bash
  wget https://nodejs.org/dist/v14.18.0/node-v14.18.0-linux-x64.tar.xz    \
    | tar -xf                                                             \
  && sudo cp -r node-v14.18.0-linux-x64/*  /usr/
  ```
