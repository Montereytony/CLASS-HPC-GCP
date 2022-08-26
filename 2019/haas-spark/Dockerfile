# to do a test build by hand (instead of the automated hub.docker.com build) you
# can do this:
#
#    docker build --rm --tag haas-sas .

#FROM jupyter/datascience-notebook
#FROM montereytony/ugba147-2
FROM montereytony/jupyter
USER root
RUN apt-get -y update 
RUN apt-get -y upgrade
RUN apt-get -y install libnuma1
RUN apt-get -y install gcc 
RUN apt-get -y install build-essential
RUN apt-get -y install default-jdk
RUN apt-get -y install scala
RUN apt-get -y install git
RUN mkdir /usr/local/spark
RUN cd /tmp
RUN apt-get -y install wget
RUN wget https://www-eu.apache.org/dist/spark/spark-2.4.0/spark-2.4.0-bin-hadoop2.7.tgz 
RUN tar xvf spark-2.4.0-bin-hadoop2.7.tgz -C /usr/local/
RUN SPARK_HOME=/usr/local/spark-2.4.0-bin-hadoop2.7
RUN export PATH=$SPARK_HOME/bin:$PATH
RUN conda update -n base conda
RUN /opt/conda/bin/pip install --upgrade pip
RUN /opt/conda/bin/pip install ipython ipywidgets numpy ipykernel notebook requests-kerberos requests \ 
    autovizwidget hdijupyterutils mock tornado pandas nose pandas-datareader  sparkmagic
RUN wget http://security.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1_amd64.deb  && \
    apt install ./libpng12-0_1.2.54-1ubuntu1.1_amd64.deb
RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN jupyter nbextension install --py widgetsnbextension --sys-prefix
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension 
RUN cd  /opt/conda/lib/python3.7/site-packages
RUN jupyter-kernelspec install sparkmagic/kernels/sparkkernel
RUN jupyter-kernelspec install sparkmagic/kernels/pysparkkernel
RUN jupyter-kernelspec install sparkmagic/kernels/pyspark3kernel
RUN jupyter-kernelspec install sparkmagic/kernels/sparkrkernel
USER jovyan
###
### This should allow users to turn off extension if they do not want them.
###
#RUN jupyter nbextension enable   --py widgetsnbextension --sys-prefix
#RUN jupyter nbextensions_configurator enable
