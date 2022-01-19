# PostgreSQL

##### Instalar PostgreSQL
```bash
sudo apt-get install postgresql
```

### Acceder a RELP de PostgreSQL luego de instalado
```bash
# Must be executed one by one
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres'"
sudo su
su postgres
psql
```

##### Configurar el usuario por defecto de postgresql
```bash
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres'"
sudo -u postgres psql -c "COMMENT ON ROLE postgres IS 'PostgreSQL default user.'"
```

##### Crear un rol para el usuarios de sesión
```bash
sudo -u postgres createuser -s $USER
```

##### o alternativamente
```bash
sudo -u postgres psql -c "CREATE USER $USER CREATEDB"
sudo -u postgres psql -c "COMMENT ON ROLE $USER IS 'Desktop user.'"
```

##### Ejecutar consultas en una DB desde un archivo.
`psql -h localhost -U postgres db_name < archivo.sql`

##### Recrear una DB.
```bash
psql -h localhost -U postgres pg_restore -d db_name db_name.dump
```

```bash
# dropuser [OPTION]... [ROLENAME] dropuser removes a PostgreSQL role.
# dropdb [OPTION]... DBNAME dropdb removes a PostgreSQL database.

# -i, --interactive prompt before deleting anything
# --if-exists don't report error if database doesn't exist

# createdb [OPTION]... [DBNAME] [DESCRIPTION] createdb creates a PostgreSQL database.

# -D, --tablespace=TABLESPACE   default tablespace for the database
# -O, --owner=OWNER             database user to own the new database

# createuser [OPTION]... [ROLENAME] createuser creates a new PostgreSQL role.

# -c, --connection-limit=N  connection limit for role (default: no limit)
# -d, --createdb            role can create new databases
# -D, --no-createdb         role cannot create databases (default)
# -e, --echo                show the commands being sent to the server
# -g, --role=ROLE           new role will be a member of this role
# -i, --inherit             role inherits privileges of roles it is a member of (default)
# -I, --no-inherit          role does not inherit privileges
# -l, --login               role can login (default)
# -L, --no-login            role cannot login
# -P, --pwprompt            assign a password to new role
# -r, --createrole          role can create new roles
# -R, --no-createrole       role cannot create roles (default)
# -s, --superuser           role will be superuser
# -S, --no-superuser        role will not be superuser (default)
# --interactive             prompt for missing role name and attributes rather than using defaults
# --replication             role can initiate replication
# --no-replication          role cannot initiate replication
```

##### Connection options
```bash
# -h, --host=HOSTNAME       database server host or socket directory (default: "/var/run/postgresql"). This is required for password prompt.
# -p, --port=PORT           database server port (default: "5432")
# -U, --username=USERNAME   database user name (default: "\$USER")
# -w, --no-password         never prompt for password
# -W, --password            force password prompt (should happen automatically)
```
##### General options
```bash
# -c, --command=COMMAND run only single command (SQL or internal) and exit
# -d, --dbname=DBNAME   database name to connect to (default: "\$USER")
# -f, --file=FILENAME   execute commands from file, then exit
# -l, --list            list available databases, then exit
```
