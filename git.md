# GIT

### GITHUB.COM

```bash
git config user.name 'José Carlos Rodríguez Texidor'
git config user.email 'jcrtexidor@gmail.com'
git config credential.helper 'cache --timeout=2592000'

git config http.proxy 'http://127.0.0.1:3128'             # CNTLM
git config https.proxy 'http://127.0.0.1:3128'
```

> GITHUB tiene como política no permitir la autenticación a través de HTTP usando la contraseña, sino a través de un TOKEN (40 caracteres).
>
> Example:  
*USERNAME:* jcrtexidor@gmail.com  
*PASSWORD:* ghp_1234567890abcdfeghijklmnopqrstuvexyz

### GITLAB.PROD.UCI.CU

```bash
git config user.name 'José Carlos Rodríguez Texidor'
git config user.email 'jctexidor@uci.cu'
git config http.sslVerify false # Omitir la verificación del certificado de seguridad.
git config https.sslVerify false

# git config credential.helper 'cache --timeout=60'       # Un minuto (60 segundos)
# git config credential.helper 'cache --timeout=3600'     # Una hora
# git config credential.helper 'cache --timeout=86400'    # Un día
# git config credential.helper 'cache --timeout=604800'   # Una semana
git config credential.helper 'cache --timeout=2592000'    # Un mes

git config http.proxy 'http://127.0.0.1:3128'             # CNTLM
git config https.proxy 'http://127.0.0.1:3128'
```

o en una línea

```bash
git clone https://gitlab.prod.uci.cu/fortes/ak-mined-arch-test.git \
  --config user.name='José Carlos Rodríguez Texidor'               \
  --config user.email='jctexidor@uci.cu'                           \
  --config credential.helper='cache --timeout=2592000'             \
  --config http.proxy='http://127.0.0.1:3128'                      \
  --config http.sslVerify=false                                    \
  --config https.proxy='http://127.0.0.1:3128'                     \
  --config https.sslVerify=false
```

Another way is to set the configuration globally.

```bash
git config --global user.name 'José Carlos Rodríguez Texidor'
git config --global user.email 'jctexidor@uci.cu'
git config --global http.sslVerify false
git config --global http.proxy 'http://127.0.0.1:3128'
git config --global https.sslVerify false
git config --global https.proxy 'http://127.0.0.1:3128'
git config --global credential.helper 'cache --timeout=2592000'
```
to produce a file **.gitconfig**

```config
[user]
	name = José Carlos Rodríguez Texidor
	email = jctexidor@uci.cu
[http]
	sslVerify = false
	proxy = http://127.0.0.1:3128
[https]
	sslVerify = false
	proxy = http://127.0.0.1:3128
[credential]
	helper = cache --timeout=2592000
```
> Es recomendable que las configuraciones sean locales para que no ofusquen las configuraciones de otros repostorios a los que quisieramos conectarnos, por ejemplo https://gitlab.com o https://github.com. Para cualquier repositorio git siempre es requerido configurar un nombre de usuario y correo  electrónico, en el caso de la UCI no es necesario configurar un proxy para git ya que este es un servidor que pertenece a la red interna. https://gitlab.prod.uci.cu solo permite la autenticación por ldap (con el usuario y contraseña del dominio) como consecuencia no puede usarse ssh para realizar operaciones con los repositorios (entre ellas ~`git clone git@gitlab.prod.uci.cu:fortes/ak-mined-arch-test.git`~) debido a que ssh requiere credenciales propias de git (y estas credenciales no pueden ser establecidas en https://gitlab.prod.uci.cu). También es necesario omitir la verificación del certificado de seguridad ya que a pesar de establecer una conexión https el sitio no emite ningún certificado. Para que git guarde las credenciales en cache y no las requiera en cada operación debe confgurarse la variable `credential.helper`.
Tener en cuenta que https://gitlab.prod.uci.cu ha boqueado la subred de residencia `10.8.0.0/16` por lo que no se puede hacer `git clone ...` de ningún reporsitorio. Además se necesitan privilegios para crear proyectos incluso si son privados (al parecer este git es para proyectos de producción aprobados por la universidad). Como alternativa puede usarse ***https://codecomunidades.prod.uci.cu*** que tiene la misma configuración que https://gitlab.prod.uci.cu pero no ha bloqueado la subred de residencia y los usuarios no necesitan privilegios para crear sus proyectos.  
Para trabajar remotamente desde la subred de residencia, clonar el proyecto en una computadora conectada a la red de producción, mantenerla encendida como servidor. Usar el módulo de **Visual Studio Code: Remote - SSH** .

---
> ###### Connect https://github.com trough a proxy:
> Set `http_proxy` and `https_proxy` environment variables.
No `http.proxy`, `https.proxy`, `http.sslVerify`, `https.sslVerify` flags are required.  
> Or  
> Set `http.proxy`, `https.proxy`, `http.sslVerify`, `https.sslVerify` flags. No `http_proxy` and `https_proxy` environment variables are required.

> ###### Connect https://gitlab.prod.uci.cu trough a proxy:
> Unset `http_proxy` and `https_proxy` environment variables.
No `http.proxy`, `https.proxy`, `http.sslVerify`, `https.sslVerify` flags are required.  
> Or  
> Set `http.proxy`, `https.proxy`, `http.sslVerify`, `https.sslVerify` flags. No `http_proxy` and `https_proxy` environment variables are required.

---
##### Unset git variables
```bash
# by default --local is used
git config unset http.proxy
git config unset http.sslVerify
git config unset https.proxy
git config unset https.sslVerify

# flags: --local, --global or --system
```

---

```bash
GIT_SET_PROXY () {
  local proxy
  read -p 'Introduce your proxy: ' -i 'http://127.0.0.1:3128' -e proxy

  git config http.proxy "$proxy"
  git config https.proxy "$proxy"
}
```

```bash
GIT_SET_USER () {
  local name email proxy
  read -p 'Introduce your full name: ' -i 'José Carlos Rodríguez Texidor' -e name
  read -p 'Introduce your email: ' -i 'jcrtexidor@gmail.com' -e email

  git config user.name "$name"
  git config user.email "$email"
}
```
