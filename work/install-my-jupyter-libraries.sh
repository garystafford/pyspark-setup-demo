#!/bin/bash

set -x
# https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-jupyterhub-install-kernels-libs.html#emr-jupyterhub-install-libs

python3 --version
which python3

sudo python3 -m pip install --user --upgrade pip
sudo python3 -m pip --version

sudo python3 -m pip install psycopg2-binary bokeh plotly chart_studio numpy scipy pandas
