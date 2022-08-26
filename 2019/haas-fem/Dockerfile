#
# Build: docker build --rm --tag ds-test .
# Push: docker tag my_image $DOCKER_ID_USER/my_image
#
# git status
# git commit -m "comments Ubuntu and R to 3.4.2 "
# git push


FROM jupyter/datascience-notebook:latest
USER root
ENV DEBIAN_FRONTEND noninteractive

# Let's do updates first and install some needed libraries and utilites
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils software-properties-common
RUN apt-get update -y  && apt-get dist-upgrade -y
RUN apt -y install build-essential libssl-dev libffi-dev python-dev  lib32ncurses5-dev zip  unzip libsuitesparse-dev 
# gtar was used by pandoc so we need this
RUN ln -s /bin/tar /bin/gtar
RUN apt-get remove r-base-core -y && apt-get install r-base-core -y
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:fenics-packages/fenics
RUN apt-get update -y
RUN apt-get install --no-install-recommends fenics -y
RUN conda update -n base conda
RUN conda install \
    gcc_linux-64 \
    gfortran_linux-64 \
    r-essentials \
    numpy \
    mshr \
    pandas \
    plotnine \
    matplotlib 
RUN conda install -c conda-forge suitesparse
RUN conda install -c conda-forge fenics==2018.1.0 
RUN conda install libgcc-ng  rpy2 nodejs jupyterhub configurable-http-proxy
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update
RUN apt-get install gcc-6 g++-6 -y
RUN add-apt-repository ppa:fenics-packages/fenics
RUN apt-get update
RUN apt-get install fenics
RUN apt-get -y dist-upgrade
RUN conda install libgcc
RUN cd /opt/conda/lib; rm libstdc++.so.6 && ln -s libstdc++.so.6.0.24 libstdc++.so.6
RUN pip install fenics-ffc --upgrade
RUN pip install fenics-dijitso
RUN apt-get -y  install python-dijitso
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils \
    software-properties-common byobu curl git htop man unzip vim wget libcairo2-dev libxt-dev  \
    libjpeg-dev libpango1.0-dev libgif-dev build-essential g++ pandoc automake pkg-config  \
    libtool software-properties-common gsl-bin libgsl-dev  unixodbc   r-cran-rmpi  libwebp-dev &&\
    add-apt-repository ppa:webupd8team/java -y && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    wget https://github.com/jgm/pandoc/releases/download/2.1/pandoc-2.1-1-amd64.deb && \
    /usr/bin/dpkg -i pandoc-2.1-1-amd64.deb && \
    rm pandoc-2.1-1-amd64.deb && \
    apt -y autoremove &&\
    apt-get clean
RUN apt-get -y install git \
                     gcc g++ gfortran \
                     cmake \
                     openmpi-bin libopenmpi-dev \
                     flex \
                     libblas-dev \
                     liblapack-dev \
                     python \
                     python-numpy \
                     python-scipy \
                     python-matplotlib \
                     python-ply \
                     python-sympy \
                     python-pytest \
                     python-setuptools \
                     swig3.0 \
                     libeigen3-dev \
                     libboost-dev \
                     libboost-filesystem-dev \
                     libboost-program-options-dev \
                     libboost-iostreams-dev \
                     libboost-timer-dev \
                     libboost-chrono-dev \
                     python3-dijitso \
                     gmsh
RUN apt-get -y install mpich
USER root
