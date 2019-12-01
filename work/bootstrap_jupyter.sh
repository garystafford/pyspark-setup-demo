#!/bin/bash

set -x

# install required python packages
python3 -m pip install --user --upgrade pip
python3 -m pip install -r requirements.txt

# download latest postgres driver jar
POSTGRES_JAR="postgresql-42.2.8.jar"
if [ -f "$POSTGRES_JAR" ]; then
    echo "$POSTGRES_JAR exist"
else
    wget -nv "https://jdbc.postgresql.org/download/${POSTGRES_JAR}"
    sudo chown -R ${USER}:users ${POSTGRES_JAR}
fi