# Build: docker build --rm --tag ds-test .
# Push: docker tag my_image $DOCKER_ID_USER/my_image
# git status
# git commit -m "comments Ubuntu and R to 3.4.2 "
# git push

FROM jupyter/datascience-notebook:latest
USER root
RUN ln -s /bin/tar /bin/gtar   && apt-get -y update && apt-get -y upgrade &&  rm -rf /var/cache/apt/archives/*
RUN apt-get -y install libmpfr-dev zlib1g  zlib1g-dev  cargo libpng-dev libmagick++-dev && \
       apt-get  -y autoclean &&\
       apt-get update -y && apt-get upgrade -y     && \
       apt-get install -y libglu1-mesa-dev libx11-dev libcgal-dev   && \
       apt-get install -y xorg   && \
       apt-get install -y libatlas-base-dev   && \
       apt-get install -y gfortran   && \
       apt-get install -y libblas-dev liblapack-dev   && \
       apt-get install -y libftgl2 libfreetype6-dev  libudunits2-dev libgeos-dev && \
       rm -r /var/cache/apt/archives/ && apt-get autoclean 
RUN conda install \
        gcc_linux-64 \
        gfortran_linux-64 \
        ipython \
        numpy \
        pandas \
    	plotnine \
    	matplotlib \
    	seaborn \
    	phantomjs  \
    	statsmodels \
    	python-utils \
        proj4  \
        nltk \
        spaCy \
        Gensim \
        TextBlob 
RUN conda install -c kabaka0 stanford-corenlp-python

#
## NB extensions is not working when running it in jupyterhub kubernetes so adding this next line
RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN jupyter nbextension install --py widgetsnbextension --sys-prefix
RUN jupyter nbextension enable  --py widgetsnbextension --sys-prefix
RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$JAVA_LD_LIBRARY_PATH
RUN R CMD javareconf
#
##
## This should allow users to turn off extension if they do not want them.
##
ADD custom.css /opt/conda/pkgs/notebook-5.7.5-py37_0/lib/python3.7/site-packages/notebook/static/custom/
ADD custom.css home/jovyan/.jupyter/custom.css
ADD custom.css home/jovyan/.jupyter/custom/custom.css
ADD custom.css /opt/conda/pkgs/notebook-5.7.5-py37_0/lib/python3.7/site-packages/notebook/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/notebook-6.0.1-py37_0/lib/python3.7/site-packages/notebook/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/jupyter_core-4.4.0-py_0/site-packages/jupyter_core/tests/dotipython/profile_default/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/jupyter_core-4.4.0-py_0/site-packages/jupyter_core/tests/dotipython_empty/profile_default/static/custom/custom.css
ADD custom.css /opt/conda/lib/python3.7/site-packages/jupyter_core/tests/dotipython/profile_default/static/custom/custom.css
ADD custom.css /opt/conda/lib/python3.7/site-packages/jupyter_core/tests/dotipython_empty/profile_default/static/custom/custom.css
ADD custom.css /opt/conda/lib/python3.7/site-packages/notebook/static/custom/custom.css
RUN jupyter nbextensions_configurator enable
RUN pip install --upgrade datascience

RUN jupyter nbextension enable zenmode/main
RUN jupyter nbextension enable table_beautifier/main
RUN jupyter nbextensions_configurator enable
RUN jupyter nbextension enable  --py widgetsnbextension --sys-prefix
RUN jupyter nbextension list

USER jovyan
ADD custom.css    /tmp/custom.css
ADD common.json   /tmp/common.json
ADD tree.json     /tmp/tree.json
ADD notebook.json /tmp/notebook.json
ADD add_files.sh /tmp/add_files.sh
USER root
RUN conda install -c conda-forge r-devtools
RUN conda install -c conda-forge r-entropy 
RUN conda install -c genomedk r-qgraph
#RUN conda install -c bioconda r-ggplot2
RUN Rscript -e 'install.packages(c("https://cran.r-project.org/src/contrib/Archive/ggplot2/ggplot2_3.2.0.tar.gz"),dependencies = TRUE)'
RUN Rscript -e 'install.packages(c("https://cran.r-project.org/src/contrib/Archive/repr/repr_0.19.2.tar.gz"),dependencies = TRUE)'


USER jovyan
