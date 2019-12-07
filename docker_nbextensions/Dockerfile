FROM        jupyter/all-spark-notebook:latest

USER        root

RUN         pip install jupyter_contrib_nbextensions \
                && jupyter contrib nbextension install --system \
                && pip install jupyter_nbextensions_configurator \
                && jupyter nbextensions_configurator enable --system \
                && pip install yapf # for code pretty

USER        $NB_UID