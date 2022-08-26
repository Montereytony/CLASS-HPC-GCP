#
#
# Build: docker build --rm --tag ds-test .
# Push: docker tag my_image $DOCKER_ID_USER/my_image
#
# git status
# git commit -m "comments Ubuntu and R to 3.4.2 "
# git push
#

FROM jupyter/datascience-notebook:latest
USER root
ENV DEBIAN_FRONTEND noninteractive
# Install.
#RUN \
#  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
#  apt-get update && \
#  apt-get -y upgrade && \
#  apt-get install -y build-essential  && \
# apt-get install -y software-properties-common && \
# apt-get install -y apt-utils && \
#  apt-get install -y byobu curl git htop man unzip vim wget && \
#  rm -rf /var/lib/apt/lists/*

# Let's do updates first and install some needed libraries and utilites
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get update -y  && apt-get dist-upgrade -y
RUN apt -y install build-essential libssl-dev libffi-dev python-dev  lib32ncurses5-dev zip  unzip 
# gtar was used by pandoc so we need this
RUN ln -s /bin/tar /bin/gtar
RUN apt-get remove r-base-core -y && apt-get install r-base-core -y
RUN /usr/bin/wget https://github.com/jgm/pandoc/releases/download/2.1/pandoc-2.1-1-amd64.deb \
    &&  /usr/bin/dpkg -i pandoc-2.1-1-amd64.deb \
    && rm pandoc-2.1-1-amd64.deb

RUN conda update -n base conda
RUN conda install gcc_linux-64 gfortran_linux-64 
RUN conda install -c r r-igraph 

RUN conda install \
        ipython \
        numpy \
        pandas \
    	plotnine \
    	matplotlib \
    	seaborn \
    	phantomjs  \
    	statsmodels \
    	python-utils

RUN conda install -c https://conda.anaconda.org/amueller wordcloud

#
# NB extensions is not working when running it in jupyterhub kubernetes so adding this next line
#
RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN jupyter nbextension install --py widgetsnbextension --sys-prefix
RUN jupyter nbextension enable  --py widgetsnbextension --sys-prefix



RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt-get clean \
    apt autoremove

RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$JAVA_LD_LIBRARY_PATH
RUN R CMD javareconf

ADD install_libraries.R /tmp
RUN R -f /tmp/install_libraries.R
RUN conda install -c conda-forge sfepy
#
# This should allow users to turn off extension if they do not want them.
#
USER jovyan

