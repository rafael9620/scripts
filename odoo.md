# ODOO

> Requisitos de Odoo: **python3**, **python-pip**, **python-virtualenv**, **postgresql**, **postgresql-client**

```bash
__install_odoo_dependencies() {
  sudo apt install python3-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev \
                   libtiff5-dev libjpeg8-dev libopenjp2-7-dev zlib1g-dev libfreetype6-dev \
                   liblcms2-dev libwebp-dev libharfbuzz-dev libfribidi-dev libxcb1-dev libpq-dev
  sudo apt install wkhtmltopdf
}
```
```bash
git clone https://github.com/odoo/odoo.git
```
```bash
cd ./odoo-14.0
```
```bash
python3 -m virtualenv env
source ./env/bin/activate
pip install setuptools wheel
pip install -r requirements.txt
```
```bash
sudo -u postgres createuser -s odoo
createdb odoo14
```
```bash
python3 odoo-bin                        \
                  --save                \
                  --init=base           \
                  --config=./.odoorc    \
                  --addons-path=addons  \
                  --db_host=localhost   \
                  --db_port=5432        \
                  --database=odoo14     \
                  --db_user=odoo        \
                  --db_password=odoo    \

# -p PORT, --http-port=PORT                   listen port for the main HTTP service
# -c CONFIG, --config=CONFIG                  specify alternate config file
# -s, --save                                  save configuration to **_~/.odoorc_** (or to **_~/.openerp_serverrc_** if it exists)
# -i INIT, --init=INIT                        install one or more modules (comma-separated list, use "all" for all modules), requires -d, use --init=base for init odoo with basics.
# -u UPDATE, --update=UPDATE                  update one or more modules (comma-separated list, use "all" for all modules). Requires -d.
# --without-demo=WITHOUT_DEMO                 disable loading demo data for modules to be installed (comma-separated, use "all" for all modules). Requires -d and -i. Default is none
# --stop-after-init                           stop the server after its initialization
# -d DB_NAME, --database=DB_NAME              specify the database name
# -r DB_USER, --db_user=DB_USER               specify the database user name
# -w DB_PASSWORD, --db_password=DB_PASSWORD		specify the database password
# --test-file=TEST_FILE                       Launch a python test file.
# --test-enable                               Enable unit tests.
```
