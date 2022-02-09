# MINED

---

### SSH
###### Private Server connection

```bash
ssh jc@10.36.32.218
```

---

### Django

```bash
source venv/bin/activate
python manage.py makemigrations
python manage.py migrate
python manage.py runserver 10.36.32.218:8000
coverage run  --source='.' manage.py test --settings base.settings_dev --failfast --verbosity=2
```


###### Activate the virtual environment
```bash
cd ~/Projects/Akademos && source venv/bin/activate
```

###### Run Django in localhost
```bash
cd ~/Projects/Akademos/MINED/ak-mined-arch-test/server && \
python manage.py runserver
```

###### Run Django in remote
```bash
cd ~/Projects/Akademos/MINED/ak-mined-arch-test/server && \
python manage.py runserver 10.36.32.218:8000
```

---

### Angular

```bash
chmod -R -x+X ./client
./node_modules/.bin/ng build --configuration staging --aot --outputHashing=all
./node_modules/.bin/ng serve --port 4200 --host 10.36.32.218 --open
```
###### Run in localhost
```bash
cd ~/Projects/Akademos/MINED/ak-mined-arch-test/client && \
./node_modules/.bin/ng serve
```

###### Run in remote
```bash
cd ~/Projects/Akademos/MINED/ak-mined-arch-test/client && \
./node_modules/.bin/ng serve --port 4200 --host 10.36.32.218 --open
```

---

### PostgreSQL

```bash
psql -h localhost -U postgres -c "DROP DATABASE arch_test;"
psql -h localhost -U postgres -c "CREATE DATABASE arch_test;"
psql -h localhost -U postgres arch_test < ~/Downloads/default-ak-c
```

---

### Git

###### Switch to branch
```bash
cd ~/Projects/Akademos/MINED/ak-mined-arch-test/ && \
git checkout 222  
```

###### Update branch
```bash
git pull --tags origin development && \
git pull --tags origin 222
```

###### Push changes

```bash
git add '*'                   && \
git commit -m "Up"            && \
git push origin 222:222
```


```bash
nvm use 14
npm i -g @angular/cli@12
ng new helloWorld
cd helloWorld/

# packages that support schematic
ng add @angular/cdk @ng-bootstrap/ng-bootstrap ng-zorro-antd

# packages that do not support schematic
npm i @asymmetrik/ngx-leaflet @ngx-translate/core @ngx-translate/http-loader @sentry/browser @swimlane/ngx-charts chart.js font-awesome hammerjs jwt-decode leaflet leaflet-extra-markers leaflet-legend leaflet-navbar leaflet.fullscreen leaflet.markercluster ngx-color-picker ngx-mask ngx-permissions

# An unhandled exception occurred: Package subpath './package.json' is not defined by "exports" in /home/jc/Desktop/helloWorld/node_modules/d3-.../package.json
npm i d3 d3-array d3-brush d3-color d3-force d3-format d3-hierarchy d3-interpolate d3-scale d3-selection d3-shape d3-time-format

npm i -D @angular/language-service @types/jasminewd2 @typescript-eslint/eslint-plugin @typescript-eslint/parser codelyzer eslint jasmine-spec-reporter protractor
# No instalados en devDependencies: karma-coverage-istanbul-reporter ts-node tslint

# "ng4-loading-spinner": "^1.0.27", requiere de @angular/core@^6, este paquete se ha quedado muy desactualizado
# Ha sido reeplazado por ngx-spinner

npm i ngx-spinner

ng add @angular-eslint/schematics

eslint --fix --fix-type layout,suggestion,problem src/app/

prettier --config .prettierrc 'src/**/*.ts' --write
```
