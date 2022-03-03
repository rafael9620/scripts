
# NPM <small>[Node Package Manager]</small>

```bash
# npm config set https-proxy http://<username>:<password>@<the.proxy.hostname>:<port>
# npm config set proxy http://<username>:<password>@<the.proxy.hostname>:<port>
# npm config set noproxy localhost,127.0.0.1,example.org`
```

```bash
# npm config set <key>=<value> [<key>=<value> ...]`
# npm config delete <key> [<key> ...]`
```
```bash
# npm cache clean --force                      # Force clean the cache
# npm config ls -l                             # List packages
# npm config rm -r noproxy proxy https-proxy   # Delete some configurations
```


#### Configure npm for the session user: ~/.npmrc

###### NPM » UCI.CU
```bash
npm config set editor=nano
npm config set strict-ssl=false
npm config set noproxy=uci.cu,edu.cu
npm config set registry=http://nexus.prod.uci.cu/repository/npm-all

proxy=http://localhost:3128 # For CNTLM
npm config set proxy=$proxy
npm config set https-proxy=$proxy
```


###### NPM » UCLV.CU
```bash
npm config set editor=nano
npm config set strict-ssl=false
npm config set noproxy=uci.cu,.edu.cu
npm config set registry=http://nexus.uclv.edu.cu/repository/npm

proxy=http://localhost:3128 # For CNTLM
npm config set proxy=$proxy
npm config set https-proxy=$proxy
```
> No todos los paquetes pueden ser encontrados en el repositorio intitucional de ahí la necesidad especificar la configuración de un proxy.

###### NPM » NPMJS.ORG
```bash
npm config set editor=nano
npm config set registry=https://registry.npmjs.org/

  proxy=http://localhost:3128
# proxy=http://127.0.0.1:3128
# proxy=http://10.36.32.218:3128

npm config set proxy=$proxy
npm config set https-proxy=$proxy
```


##### Avaliable repositories
```bash
npm config set registry=http://nexus.prod.uci.cu/repository/npm-all
npm config set registry=http://nexus.uclv.edu.cu/repository/npm
npm config set registry=https://registry.npmjs.org/
```

##### Global Applications
```bash
npm install --global @angular/cli
npm install --global @nestjs/cli
npm install --global @ionic/cli
npm install --global typeorm
```
```bash
npm install --global typescript
npm install --global coffeescript
npm install --global prettier eslint
npm install --global lodash rxjs jasmine karma
```

> This command is not recommended because npm is dependent on the nodejs version.  
~~`sudo npm install --global npm@latest`~~
