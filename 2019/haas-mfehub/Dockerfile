#
#
# Custom Image for MFE  --tony
#
FROM jupyter/datascience-notebook:latest
USER root
ENV DEBIAN_FRONTEND noninteractive
ENV PATH=/opt/conda/bin:$PATH
ENV export PREFIX=/opt/conda

# Updating Ubuntu packages
RUN apt-get update --fix-missing && yes|apt-get upgrade

#Update again
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils software-properties-common
RUN apt-get update -y  && apt-get dist-upgrade -y
RUN apt-get update -y  && apt-get upgrade -y
RUN apt -y install build-essential libssl-dev libffi-dev lib32ncurses5-dev zip  unzip libsuitesparse-dev python3-dev python3-pip
RUN /opt/conda/bin/pip install --upgrade pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && /opt/conda/bin/python get-pip.py

# gtar was used by pandoc so we need this
RUN ln -s /bin/tar /bin/gtar

# Adding wget and bzip2
RUN apt-get install -y wget bzip2


# Anaconda installing
#RUN cd /opt/ && \
#    wget https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh    &&\
#    bash Anaconda3-5.3.1-Linux-x86_64.sh -u -b -p /opt/conda  && \
#    rm Anaconda3-5.3.1-Linux-x86_64.sh
#
RUN /opt/conda/bin/pip install PyHamcrest
RUN /opt/conda/bin/pip install -U pip six numpy wheel mock
RUN /opt/conda/bin/pip install -U keras_applications==1.0.6 --no-deps
RUN /opt/conda/bin/pip install -U keras_preprocessing==1.0.5 --no-deps

# Updating Anaconda packages
RUN /opt/conda/bin/conda update conda && \
    /opt/conda/bin/conda update -n base conda && \
    /opt/conda/bin/conda update --all  
ENV export PATH=/opt/conda/bin:/usr/local/bin:$PATH

#Install R
RUN /opt/conda/bin/conda install -c r r-essentials r-irkernel 

#Install dijitso
RUN /opt/conda/bin/conda install -c conda-forge suitesparse
RUN apt-get -y  install gcc g++ gfortran
#RUN /opt/conda/bin/pip install --upgrade datascience okpy autopep8 isort nbgitpuller oauthenticator pandas matplotlib okpy  numpy scipy nbinteract pandas

RUN /opt/conda/bin/conda install -c conda-forge/label/gcc7 mshr  git

#RUN /opt/conda/bin/pip install --upgrade tensorflow
RUN /opt/conda/bin/pip install --upgrade https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-0.10.0-py3-none-any.whl

#RUN /opt/conda/bin/conda create -n tensorflow_env tensorflow
RUN apt-get -y install libcgal-dev
RUN apt-get -y install libcgal-demo
RUN /opt/conda/bin/conda install -c salilab cgal
RUN /opt/conda/bin/pip install -U arch pybea pykalman pymc python-dotenv  quantecon tabulate wrds quantecon tabulate wrds quandl 
RUN /opt/conda/bin/pip install -U alpha_vantage pandas-datareader pymc3 python-dotenv quantecon
RUN /opt/conda/bin/pip install -U numpy scipy matplotlib johansen pixiedust sympy

USER jovyan
