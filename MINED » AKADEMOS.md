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
