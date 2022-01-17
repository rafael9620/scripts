# PIP



### Install python3 and virtualenv
```bash
sudo apt-get install --yes python3-pip python3-virtualenv
python -m virtualenv venv -p python3
source ./venv/bin/activate
python -m pip install -r requirements.txt
deactivate # Desactiva el entorno virtual.
```

### Unset Environment Variables
```bash
unset PIP_TIMEOUT PIP_INDEX PIP_INDEX_URL PIP_TRUSTED_HOST
```

```bash
PIP_UNSET_ENV() {
  __backup_file "$HOME/.bashrc"

  local regex='/^[[:space:]]*(unset|export)[[:space:]]+PIP_(TIMEOUT|INDEX|INDEX_URL|TRUSTED_HOST).*$/';
  sed -i $regex'd' "~/.bashrc";

  local cmd="unset PIP_TIMEOUT PIP_INDEX PIP_INDEX_URL PIP_TRUSTED_HOST";
  echo -e $cmd | tee -a "~/.bashrc" | bash &> /dev/null;
}
```

### UCI Environment Configuration
```bash
export PIP_INDEX=http://nexus.prod.uci.cu/repository/pypi-all/pypi
export PIP_INDEX_URL=http://nexus.prod.uci.cu/repository/pypi-all/simple
export PIP_TRUSTED_HOST=nexus.prod.uci.cu
export PIP_TIMEOUT=120
```

```bash
PIP_SET_ENV_UCI() {
  __backup_file "$HOME/.bashrc"

  local regex='/^[[:space:]]*(unset|export)[[:space:]]+PIP_(TIMEOUT|INDEX|INDEX_URL|TRUSTED_HOST).*$/';
  sed -i $regex'd' "~/.bashrc";

  local cmd="
export PIP_TIMEOUT=120
export PIP_INDEX=http://nexus.prod.uci.cu/repository/pypi-all/pypi
export PIP_INDEX_URL=http://nexus.prod.uci.cu/repository/pypi-all/simple
export PIP_TRUSTED_HOST=nexus.prod.uci.cu
"
  echo -e $cmd | tee -a "~/.bashrc" | bash &> /dev/null;
}
```

### UCLV Environment Configuration
```bash
export PIP_INDEX=http://nexus.uclv.edu.cu/repository/pypi
export PIP_INDEX_URL=http://nexus.uclv.edu.cu/repository/pypi/simple
export PIP_TRUSTED_HOST=nexus.uclv.edu.cu
export PIP_TIMEOUT=120
```

```bash
PIP_SET_ENV_UCLV() {
  __backup_file "$HOME/.bashrc"

  local regex='/^[[:space:]]*(unset|export)[[:space:]]+PIP_(TIMEOUT|INDEX|INDEX_URL|TRUSTED_HOST).*$/';
  sed -i $regex'd' "~/.bashrc";

  local cmd="
export PIP_TIMEOUT=120
export PIP_INDEX=http://nexus.prod.uci.cu/repository/pypi-all/pypi
export PIP_INDEX_URL=http://nexus.prod.uci.cu/repository/pypi-all/simple
export PIP_TRUSTED_HOST=nexus.prod.uci.cu
"
  echo -e $cmd | tee -a "~/.bashrc" | bash &> /dev/null;
}
```
