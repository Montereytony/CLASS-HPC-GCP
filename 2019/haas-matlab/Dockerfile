# to do a test build by hand (instead of the automated hub.docker.com build) you
# can do this:
#
#    docker build --rm --tag haas-matlab .

FROM montereytony/jupyter
USER root
RUN mkdir /bulk 
RUN apt-get install libnuma1
ADD matlab /usr/local/bin
RUN conda update -n base conda
RUN /opt/conda/bin/pip install --upgrade pip
RUN /opt/conda/bin/conda install pandas
RUN /opt/conda/bin/pip install  pandas-datareader matlab_kernel
RUN wget http://security.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1_amd64.deb  && \
    apt install ./libpng12-0_1.2.54-1ubuntu1.1_amd64.deb
#This is because I installed sas in /bulk, not where the sascfg.py looks for it.
RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN jupyter nbextension install --py widgetsnbextension --sys-prefix
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension 
USER jovyan
###
### This should allow users to turn off extension if they do not want them.
###
#RUN jupyter nbextension enable   --py widgetsnbextension --sys-prefix
#RUN jupyter nbextensions_configurator enable
