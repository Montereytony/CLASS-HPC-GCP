# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER
USER root

ENV NB_USER jovyan
ENV NB_UID 1001
RUN /usr/bin/perl -pi -e 's/:1000:100:/:1001:1003:/' /etc/passwd
LABEL maintainer="Tony Cricelli <montereytony@gmail.com"

# Set ENV for all programs...
ENV PATH ${CONDA_DIR}/bin:$PATH
# And set ENV for R! It doesn't read from the environment...
RUN echo "PATH=${PATH}" >> /usr/local/lib/R/etc/Renviron

# The `rsession` binary that is called by jupyter-rsession-proxy to start R
# doesn't seem to start without this being explicitly set
ENV LD_LIBRARY_PATH /usr/local/lib/R/lib

ENV HOME /home/${NB_USER}
WORKDIR ${HOME}

# Install packages needed by nbpdfexport
# Default fonts seem ok, we just install an emoji font
# Can't use fonts-noto-color-emoji since this is based
# on debian stretch
# tcl/tk needed by vioplot/sm (rocker #316)
RUN apt-get update && \
    apt-get install --yes \
            libx11-xcb1 \
            libxtst6 \
            libxrandr2 \
            libasound2 \
            libpangocairo-1.0-0 \
            libatk1.0-0 \
            libatk-bridge2.0-0 \
            libgtk-3-0 \
            libnss3 \
            libxss1 \
            fonts-symbola \
            tcl8.6-dev \
            tk8.6-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY install-miniconda.bash /tmp/install-miniconda.bash
RUN /tmp/install-miniconda.bash

USER ${NB_USER}

RUN pip install --no-cache-dir \
                jupyter-rsession-proxy==1.0b6 \
                jupyterhub==1.0.0 \
                jupyterlab==0.35.6 \
                notebook==5.7.8 \
                nbpdfexport==0.2.1

# Set up nbpdf dependencies
ENV PYPPETEER_HOME /srv/conda
RUN pyppeteer-install
RUN jupyter bundlerextension enable nbpdfexport.bundler --sys-prefix --py

# Install IRKernel
RUN R --quiet -e "install.packages('IRkernel', quiet = TRUE)" && \
    R --quiet -e "IRkernel::installspec(prefix='${CONDA_DIR}')"

# Install some R libraries that aren't in the base image
COPY class-libs.R /tmp/class-libs.R
#COPY --chown=rstudio extras.d /tmp/extras.d
#RUN find /tmp/extras.d -type f | xargs -L1 Rscript

RUN Rscript -e 'install.packages(c("alluvial","latticeExtra","DAAG", "faraway","fdrtool","gpairs","gplots","hexbin","leaps","leaps","NMF","randomForest","RColorBrewer","rjson","rpart.plot","scatterplot3d","shape","sm","pheatmap","vioplot" ),repos = "https://cloud.r-project.org",dependencies = TRUE)'
RUN Rscript -e 'install.packages(c("car","summarytools","rdd", "stargazer","lm.beta","multcomp","fGarch","SASxport","googlesheets","googledrive","lfe","ggrepel","infer","janitor","latex2exp","cowplot","measurements","dagitty","here" ),repos = "https://cloud.r-project.org",dependencies = TRUE)'
RUN Rscript -e 'install.packages(c("rlist","jsonlite","checkr","assertthat","dplyr","ggplot2","tidyr","reticulate"),repos = "https://cloud.r-project.org",dependencies = TRUE)'

#COPY --chown=rstudio:rstudio . ${REPO_DIR}

RUN pip install --no-cache-dir -r ${REPO_DIR}/requirements.txt
RUN conda install rstudio

RUN pip install rsconnect_jupyter

# Install `rsconnect-jupyter` as a jupyter extension
#RUN jupyter-nbextension install --sys-prefix --py rsconnect_jupyter
# Enable JavaScript extension
#RUN jupyter-nbextension enable --sys-prefix --py rsconnect_jupyter
# Enable Python extension
#RUN jupyter-serverextension enable --sys-prefix --py rsconnect_jupyter
# Install Proxy
#RUN pip install jupyter-server-proxy
#
#RUN jupyter serverextension enable --sys-prefix jupyter_server_proxy

# Execute PostBuild if it exists
RUN [ -f ${REPO_DIR}/postBuild ] && chmod +x ${REPO_DIR}/postBuild && ${REPO_DIR}/postBuild
USER jovyan
