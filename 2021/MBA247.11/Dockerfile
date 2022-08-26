# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/minimal-notebook
FROM $BASE_CONTAINER


LABEL maintainer="Tony Cricelli <tony_cricelli@berkeley.edu>"

USER root

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
    'r-rodbc' \
    'r-rsqlite' \
    'r-shiny' \
    'unixodbc' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"


USER root
# Set CRAN mirror to rspm before we install anything
COPY Rprofile.site /usr/lib/R/etc/Rprofile.site
COPY rsession.conf /etc/rstudio/rsession.conf
COPY shiny-server.conf /etc/init/shiny-server.conf

# These packages are not easy to install under arm
RUN set -x && \
    arch=$(uname -m) && \
    if [ "${arch}" == "x86_64" ]; then \
        mamba install --quiet --yes \
            'r-rmarkdown' \
            'r-tidymodels' \
            'r-tidyverse' && \
            mamba clean --all -f -y && \
            fix-permissions "${CONDA_DIR}" && \
            fix-permissions "/home/${NB_USER}"; \
    fi;

#
#
# apt packages needed for R packages
RUN apt-get update --yes > /dev/null && \
    apt-get install --no-install-recommends --yes \
    # R package qpdf
    libpoppler-cpp-dev \
    # R package imager
    libx11-dev libglpk-dev libgmp3-dev libxml2-dev \
    # R package units
    libudunits2-dev \
    # R package sf
    libgdal-dev libproj-dev gdal-bin  libedit2     libclang-dev  libclang-6.0-dev   \
    psmisc sudo libapparmor1 lsb-release  \
    # R package magick
    libmagick++-dev imagemagick > /dev/null
RUN apt-get install -y libxkbcommon-x11-0
# 1.3.959 is latest version that works with jupyter-rsession-proxy
# See https://github.com/jupyterhub/jupyter-rsession-proxy/issues/93#issuecomment-725874693
ENV RSTUDIO_URL https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.3.959-amd64.deb
#ENV RSTUDIO_URL https://download1.rstudio.org/desktop/debian9/x86_64/rstudio-1.4.1717-amd64.deb
RUN curl --silent --location --fail ${RSTUDIO_URL} > /tmp/rstudio.deb && \
    dpkg -i /tmp/rstudio.deb && \
    rm /tmp/rstudio.deb

ENV SHINY_SERVER_URL https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.15.953-amd64.deb
RUN curl --silent --location --fail ${SHINY_SERVER_URL} > /tmp/shiny-server.deb && \
    dpkg -i /tmp/shiny-server.deb && \
    rm /tmp/shiny-server.deb


USER ${NB_UID}
