#
# to do a test build by hand (instead of the automated hub.docker.com build) you
# can do this:
#
#    docker build --rm --tag montereytony/mba263 .
#
# git status
# git commit -m "blah blah "
# git push

FROM jupyter/datascience-notebook:latest
USER root
ENV DEBIAN_FRONTEND noninteractive
RUN ln -s /bin/tar /bin/gtar   && apt-get -y update && apt-get -y upgrade &&  rm -rf /var/cache/apt/archives/*
RUN apt-get -y  update && apt-get  -y upgrade && apt-get  -y dist-upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils \
    software-properties-common byobu curl git htop man unzip vim wget libcairo2-dev libxt-dev  \
    libjpeg-dev libpango1.0-dev libgif-dev build-essential g++ pandoc automake pkg-config  \
    libtool software-properties-common gsl-bin libgsl-dev  unixodbc   r-cran-rmpi  libwebp-dev \
    webp coinor-clp xorg  && \
    apt-get  -y autoclean &&  rm -rf /var/cache/apt/archives/*  && \
    conda update --all  && \
    apt-get -y update && \
    apt-get upgrade -y && \
    apt-get install -y  software-properties-common && \
    add-apt-repository ppa:linuxuprising/java && \
    apt-get -y update && \
    apt-get -y upgrade  

RUN /usr/bin/wget https://github.com/jgm/pandoc/releases/download/2.1/pandoc-2.1-1-amd64.deb
RUN /usr/bin/dpkg -i pandoc-2.1-1-amd64.deb
RUN rm pandoc-2.1-1-amd64.deb

#
# Upgrade R 3.4.2 now
#

RUN conda update -c r r-base
# Updating Anaconda packages
RUN /opt/conda/bin/conda update conda && \
    /opt/conda/bin/conda update -n base conda && \
    /opt/conda/bin/conda update --all

RUN conda install \
	gcc_linux-64 \
	gfortran_linux-64 \
	r-essentials \
	r-htmlwidgets \
	r-gridExtra \
	r-e1071 \
	r-rgl \
	r-xlsxjars \
	r-xlsx \
	r-rJava \
	r-aer  \
	r-png \
	r-devtools \
	r-digest \
	r-evaluate \ 
	r-memoise  \
	r-withr  \
	r-irdisplay \
	r-r6  \
	r-irkernel \
	r-jsonlite\
	r-lubridate\
	r-magrittr\
	r-pbdzmq \
	r-rcpp \
	r-repr \
	r-stringi\
	r-stringr  \
	r-processx  \
    r-reshape \
    r-progress  \
    r-tidyverse \
    r-readr \
    r-mice 

RUN conda install \
    r-kernlab \
    r-cvst \
    r-webshot \
    r-mclust \
    r-pracma \
    r-ggdendro \
    r-ggally 

RUN conda install \
    r-lmertest \
     r-ez  \
     r-mcmcpack  \
     r-gganimate  \
     r-animation  \
     r-readxl  \
     r-pbapply  \
     r-bayesfactor 


RUN conda install \
	ipython \
    numpy \
    pandas \
    plotnine \
    matplotlib \
    seaborn \
    phantomjs  \
    statsmodels \
    statsmodels \
    python-utils 

RUN conda install -c conda-forge csvkit

RUN conda install -c https://conda.anaconda.org/amueller wordcloud

# The following would not do a conda install so we compile from source

RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/miceadds_3.6-21.tar.gz',repos=NULL)"
RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/multiwayvcov_1.2.3.tar.gz',repos=NULL)"


#
# NB extensions is not working when running it in jupyterhub kubernetes so adding this next line
#
RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN jupyter nbextension install --py widgetsnbextension --sys-prefix
RUN jupyter nbextension enable  --py widgetsnbextension --sys-prefix

#
# This should allow users to turn off extension if they do not want them.
#

RUN conda install  r-devtools
RUN pip install scikit-neuralnetwork
RUN conda install pyflux sklearn
USER jovyan
RUN jupyter nbextensions_configurator enable
