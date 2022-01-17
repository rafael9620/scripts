#!/bin/bash

# | Angular | Node | NG-Zorro |
# | ------# | ---# | -------# |
# | 8       | 10   | 8        |
# | 11      | 12   | 11       |
# | 12      | 14   | 12       |


# Assumptions:
#   - nvm (Node Version Manager) is installed
#   - .npmrc is correctly configurated
#   - node 14.x.x is installed


if command -v nvm &> /dev/null
  then echo 'nvm is installed'
else
  echo 'nvm is not installed' && exit 1; fi

. ~/.nvm/nvm.sh     # . is the equivalent to «source»
nvm use 14

if node --version | grep -q 'v14'
  then echo 'node '$(node --version)' is installed';
else
  echo 'node is not installed' && exit 1; fi




read -p "Enter the project name: " -i helloWorld -e PROJECT_NAME

npm install @angular/cli@12                          # Instalar angular cli en un ambiente virtual
node_modules/.bin/ng new --defaults $PROJECT_NAME    # Crear un nuevo proyecto ($PROJECT_NAME) con parámetros por defecto.
cd $PROJECT_NAME && npm install                      # Entrar a la carpeta del proyecto e instalar todas las dependencias.
node_modules/.bin/ng add ng-zorro-antd               # Agregar la librería NG-Zorro de diseño ANT.

npx cross-env ELECTRON_GET_USE_PROXY=true \
GLOBAL_AGENT_HTTPS_PROXY=$http_proxy \
npm install electron --unsafe-perm=true              # Instalar Electron

npm install sqlite3                                  # Instalar SQLite3
npm install graphql                                  # Instalar GraphQL

exit 0;
