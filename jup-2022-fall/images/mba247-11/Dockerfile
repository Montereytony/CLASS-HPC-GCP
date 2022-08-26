#
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/minimal-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

# Fix: https://github.com/hadolint/hadolint/wiki/DL4006
# Fix: https://github.com/koalaman/shellcheck/wiki/SC3014
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root
RUN apt-get -y update -qq
RUN apt-get -y upgrade
# update indices
# install two helper packages we need
RUN  apt-get -y install --no-install-recommends software-properties-common dirmngr
# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
RUN apt-get -y install --no-install-recommends r-base
RUN add-apt-repository --enable-source --yes "ppa:c2d4u.team/c2d4u4.0+"




# R pre-requisites
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    fonts-dejavu \
    unixodbc \
    unixodbc-dev \
    r-cran-rodbc \
    gfortran \
    gcc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER ${NB_UID}

# R packages including IRKernel which gets installed globally.
# r-e1071: dependency of the caret R package
RUN mamba install --quiet --yes \
    'r-base' \
    'r-caret' \
    'r-crayon' \
    'r-devtools' \
    'r-e1071' \
    'r-forecast' \
    'r-hexbin' \
    'r-htmltools' \
    'r-htmlwidgets' \
    'r-irkernel' \
    'r-nycflights13' \
    'r-randomforest' \
    'r-rcurl' \
    'r-rmarkdown' \
    'r-rodbc' \
    'r-rsqlite' \
    'r-shiny' \
    'r-tidyverse' \
    'r-reticulate ' \
    'r-mvtnorm' \
    'r-gdata' \
    'r-matrixcalc' \
    'r-gtools' \
    'r-mpoly' \
    'r-moments'\
    'r-tm' \
    'r-SnowballC' \
    'r-wordcloud' \
    'r-pROC' \
    'r-rpart.plot' \
    'r-arules'  \
    'r-ROSE'  \
    'r-imager' \
    'unixodbc' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"




# `r-tidymodels` is not easy to install under arm
RUN set -x && \
    arch=$(uname -m) && \
    if [ "${arch}" == "x86_64" ]; then \
        mamba install --quiet --yes \
            'r-tidymodels' && \
            mamba clean --all -f -y && \
            fix-permissions "${CONDA_DIR}" && \
            fix-permissions "/home/${NB_USER}"; \
    fi;

RUN mamba install --yes 'r-arules' 

RUN python -m pip install jupyterthemes  && \
    python -m pip install --upgrade jupyterthemes  && \
    python -m pip install jupyter_contrib_nbextensions  && \
    pip install RISE  && \
    jupyter-nbextension install rise --py --sys-prefix  && \
    jupyter-nbextension enable  rise --py --sys-prefix

