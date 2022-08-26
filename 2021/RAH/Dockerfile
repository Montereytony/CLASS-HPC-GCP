# Build: docker build --rm --tag ds-test .
# Push: docker tag my_image $DOCKER_ID_USER/my_image
# git status
# git commit -m "comments Ubuntu and R to 3.4.2 "
# git push
FROM jupyter/datascience-notebook:latest
USER root
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
    apt-get -y upgrade  && \
    apt-get -y  install openjdk-8-jdk 

RUN wget https://github.com/jgm/pandoc/releases/download/2.1/pandoc-2.1-1-amd64.deb && \
    /usr/bin/dpkg -i pandoc-2.1-1-amd64.deb && \
    rm pandoc-2.1-1-amd64.deb && \
    apt -y autoremove &&\
    apt-get  -y clean   &&  rm -rf /var/cache/apt/archives/*
RUN Rscript -e 'install.packages(c("RcppEigen","StanHeaders","rpfo","OpenMx"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
#RUN conda update -n base conda && add-apt-repository -y ppa:opencpu/poppler && apt-get update && apt-get install -y libpoppler-cpp-dev 
RUN apt-get install -y poppler-utils
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
        r-aer  \
        r-png \
        r-rJava \
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
        r-rcpp \
        r-repr \
        r-stringi\
        r-stringr\
        r-processx\
        r-tidyverse\
        r-readr  \
        ipython \
        numpy \
        pandas \
    	plotnine \
    	matplotlib \
    	seaborn \
    	phantomjs  \
    	statsmodels \
    	python-utils \
        proj4 \
        r-prodlim \
        r-class \ 
        r-timeDate \
        r-lava \
        r-pracma \
        r-mvtnorm \
        r-knitr \  
        r-htmltools \
        r-plyr \
        r-NLP \
        r-rpart.plot \
        r-SnowballC \
        r-tm \
        r-RODBC  \
        r-gdtools \
        r-rsvg   \
    r-slam \
    r-GPArotation \
    r-permute \
    r-vegan \
    r-ggalt \
    r-igraph \
    r-wordcloud \
    r-cairo \
    r-pdftools  \
    r-ks

RUN Rscript -e 'install.packages(c("truncnorm","pdftools","Rsolnp","LSAmitR", "Rgraphviz", "graph", "rsample", "proxy", "slam", "Rcampdf", "tm.lexicon.GeneralInquirer", "VGAM", "impute", "truncnorm","truncnorm","checkmate", "latticeExtra", "acepack", "htmlTable", "viridis", "brew", "desc", "commonmark", "Hmisc", "roxygen2", "DT","dencies", "mice", "CDM", "mitools", "sirt", "TAM","miceadds","mockery", "praise", "rex", "fontBitstreamVera", "fontLiberation", "testthat", "covr", "fontquiver", "svglite", "pbdZQM","DRR", "webshot","mclust","pracma","reshape","prettyunits","progress","GGally","multiwayvcov","wordcloud2","openxlsx","rio","survey","coda","mvtnorm","sfsmisc","polucor","CDM","TAM","mitools","pbivnorm","numDeriv","Archive","lavaan","lavaan.survey","sirt","RcppRoll","DEoptimR","robustbase","gower","kernlab","CVST","DRR","SQUAREM","lava","ddalpha","dimRed","ipred","recipes","withr","caret","neuralnet","irlba","kknn","gtools","gdata","caTools","gplots","ROCR","MLmetrics","dummies","slam","NLP","tm","clipr","truncnorm","zipcode"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
#
## NB extensions is not working when running it in jupyterhub kubernetes so adding this next line
RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN jupyter nbextension install --py widgetsnbextension --sys-prefix
RUN jupyter nbextension enable  --py widgetsnbextension --sys-prefix
RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$JAVA_LD_LIBRARY_PATH
RUN R CMD javareconf
#RUN Rscript -e 'install.packages(c("RWekajars","rpart.plot","zip","gbm","R.methodsS3"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
RUN Rscript -e 'install.packages(c("RWekajars","rpart.plot","zip","gbm","R.methodsS3","R.oo","R.utils","officer","githubinstall","caret"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
#RUN Rscript -e 'install.packages(c("R.oo","R.utils","officer","githubinstall","caret"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
#RUN Rscript -e 'install.packages(c("caret"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
RUN apt -y update ; apt-get -y install zlib1g  zlib1g-dev  cargo libpng-dev libmagick++-dev
RUN Rscript -e 'install.packages(c("knitr","kableExtra"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
RUN    apt-get  -y autoclean &&\
       apt-get update -y && apt-get upgrade -y     && \
       apt-get install -y libglu1-mesa-dev libx11-dev libcgal-dev   && \
       apt-get install -y xorg   && \
       apt-get install -y libatlas-base-dev   && \
       apt-get install -y gfortran   && \
       apt-get install -y libblas-dev liblapack-dev   && \
       apt-get install -y libftgl2 libfreetype6-dev  
RUN    rm -r /var/cache/apt/archives/ &&\
       apt-get autoclean &&\
       apt-get install -y libudunits2-dev libgeos-dev
RUN Rscript -e 'install.packages(c("ggrepel","truncnorm","ggwordcloud","polyclip","entropy","tree","rjson","pbapply","igraphdata","glasso", "huge", "fdrtool", "d3Network", "ggm", "BDgraph", "pbappla", "ggdendro","igraph","proto","colorspace"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
#
RUN Rscript -e 'install.packages("https://cran.r-project.org/src/contrib/Archive/repr/repr_0.19.2.tar.gz", repos=NULL, type="source")'
RUN Rscript -e 'install.packages("https://cran.r-project.org/src/contrib/Archive/qgraph/qgraph_1.6.3.tar.gz", repos=NULL, type="source")'
RUN Rscript -e 'install.packages("https://cran.r-project.org/src/contrib/Archive/ggplot2/ggplot2_3.2.0.tar.gz", repos=NULL, type="source")'
#
##
## This should allow users to turn off extension if they do not want them.
##

RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN conda install -c conda-forge jupyter_nbextensions_configurator

ADD custom.css /opt/conda/lib/python3.7/site-packages/notebook/static/custom/custom.css
ADD custom.css /opt/conda/lib/python3.7/site-packages/jupyter_core/tests/dotipython/profile_default/static/custom/custom.css
ADD custom.css /opt/conda/lib/python3.7/site-packages/jupyter_core/tests/dotipython_empty/profile_default/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/notebook-5.7.5-py37_0/lib/python3.7/site-packages/notebook/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/jupyter_core-4.6.1-py37_0/lib/python3.7/site-packages/jupyter_core/tests/dotipython/profile_default/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/jupyter_core-4.6.1-py37_0/lib/python3.7/site-packages/jupyter_core/tests/dotipython_empty/profile_default/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/notebook-6.0.1-py37_0/lib/python3.7/site-packages/notebook/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/jupyter_core-4.4.0-py_0/site-packages/jupyter_core/tests/dotipython/profile_default/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/jupyter_core-4.4.0-py_0/site-packages/jupyter_core/tests/dotipython_empty/profile_default/static/custom/custom.css

RUN jupyter nbextensions_configurator enable
RUN jupyter nbextension enable  --py widgetsnbextension --sys-prefix

#ADD custom.css /home/jovyan/.jupyter/custom.css
#ADD custom.css /home/jovyan/.jupyter/custom/custom.css
#ADD common.json   /home/jovyan/.jupyter/common.json
#ADD tree.json     /home/jovyan/.jupyter/tree.json
#ADD notebook.json /home/jovyan/.jupyter/notebook.json
#ADD common.json   /home/jovyan/.jupyter/custom/common.json
#ADD tree.json     /home/jovyan/.jupyter/custom/tree.json
#ADD notebook.json /home/jovyan/.jupyter/custom/notebook.json
ADD custom.css /tmp
ADD common.json  /tmp
ADD tree.json  /tmp
ADD notebook.json /tmp
ADD common.json   /tmp
ADD tree.json     /tmp
ADD notebook.json  /tmp

USER jovyan
