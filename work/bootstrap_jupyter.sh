#!/bin/bash

set -ex

# update/upgrade and install htop
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install htop

# install required python packages
python3 -m pip install --user --upgrade pip
python3 -m pip install -r requirements.txt --upgrade

# download latest postgres driver jar
POSTGRES_JAR="postgresql-42.2.10.jar"
if [ -f "$POSTGRES_JAR" ]; then
    echo "$POSTGRES_JAR exist"
else
    wget -nv "https://jdbc.postgresql.org/download/${POSTGRES_JAR}"
fi

# spark-submit logging level from INFO to WARN
sudo cp log4j.properties /usr/local/spark/conf/log4j.properties
