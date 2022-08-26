# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
#ARG BASE_CONTAINER=jupyter/scipy-notebook
ARG BASE_CONTAINER=jupyter/datascience-notebook:latest
FROM $BASE_CONTAINER
USER root

ENV NB_USER jovyan
ENV NB_UID 1001
RUN /usr/bin/perl -pi -e 's/:1000:100:/:2001:1003:/' /etc/passwd
LABEL maintainer="Tony Cricelli <montereytony@gmail.com"

#initialize this nbextension in the browser every time the notebook (or other app) loads:
RUN sudo -H /opt/conda/bin/pip install --upgrade coverage==3.7.1 datascience okpy autopep8 isort nbgitpuller oauthenticator pandas matplotlib okpy  numpy scipy nbinteract graphviz plotly  queuelib xgboost
RUN apt-get update && apt-get -y  install g++ openmpi-bin openmpi-doc libopenmpi-dev make  python-tk

# Install Tensorflow
RUN conda install --quiet --yes \
    'tensorflow' \
    'keras' && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER 

RUN conda install --quiet --yes \
    'beautifulsoup4=4.9.*' \
    'conda-forge::blas=*=openblas' \
    'bokeh=2.2.*' \
    'bottleneck=1.3.*' \
    'cloudpickle=1.6.*' \
    'cython=0.29.*' \
    'dask=2.30.*' \
    'dill=0.3.*' \
    'h5py=3.1.*' \
    'ipywidgets=7.5.*' \
    'ipympl=0.5.*'\
    'matplotlib-base=3.3.*' \
    'numba=0.51.*' \
    'numexpr=2.7.*' \
    'pandas=1.1.*' \
    'patsy=0.5.*' \
    'protobuf=3.13.*' \
    'pytables=3.6.*' \
    'scikit-image=0.17.*' \
    'scikit-learn=0.23.*' \
    'scipy=1.5.*' \
    'seaborn=0.11.*' \
    'sqlalchemy=1.3.*' \
    'statsmodels=0.12.*' \
    'sympy=1.7.*' \
    'vincent=0.4.*' \
    'widgetsnbextension=3.5.*'\
    'xlrd=1.2.*'

RUN sudo -H /opt/conda/bin/pip install tqdm
ADD glove /tmp/glove
RUN cd /tmp/glove; python setup.py install
RUN apt-get update --fix-missing
RUN sudo -H apt-get -y install --upgrade python-wheel
RUN conda install numpy


RUN conda install -c conda-forge jupyter_contrib_nbextensions jupyter_nbextensions_configurator
RUN sudo -H /opt/conda/bin/pip install git+https://github.com/data-8/nbpuller.git
RUN jupyter nbextension install --py nbpuller
RUN jupyter nbextension enable nbpuller --py
RUN jupyter serverextension enable --py nbpuller
RUN jupyter nbextension install --py widgetsnbextension --sys-prefix
RUN jupyter nbextension enable  --py widgetsnbextension --sys-prefix
RUN jupyter nbextensions_configurator enable

ADD common.json   /home/jovyan/.jupyter/common.json
ADD tree.json     /home/jovyan/.jupyter/tree.json
ADD notebook.json /home/jovyan/.jupyter/notebook.json
ADD custom.css /home/jovyan/.jupyter/custom.css
ADD custom.css /home/jovyan/.jupyter/custom/custom.css
ADD common.json   /home/jovyan/.jupyter/nbconfig/common.json
ADD tree.json     /home/jovyan/.jupyter/nbconfig/tree.json
ADD notebook.json /home/jovyan/.jupyter/nbconfig/notebook.json
RUN jupyter nbextension enable zenmode/main
RUN jupyter nbextension enable table_beautifier/main
RUN jupyter nbextension list
RUN sudo -H /opt/conda/bin/pip install --upgrade xgboost nltk

USER jovyan
