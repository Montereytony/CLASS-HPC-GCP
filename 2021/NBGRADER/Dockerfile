ARG BASE_CONTAINER=jupyter/base-notebook
FROM $BASE_CONTAINER
USER root
LABEL maintainer="Tony Cricelli <tony@haas.berkeley.edu>"

ENV CONDA_DIR /opt/conda
#ENV NB_UID 2001
#ENV NB_GID 1003
#RUN /usr/bin/perl -pi -e 's/:1000:100:/:2001:1003:/' /etc/passwd
#RUN /usr/bin/perl -pi -e 's/:100:/:1003:/' /etc/group
#RUN chown -R 2001:1003 /opt/conda
#RUN chown -R 2001:1003 /home/jovyan

# Install all OS dependencies for fully functional notebook server
RUN apt-get update --fix-missing && apt-get install -yq --no-install-recommends \
     software-properties-common \
    build-essential \
    emacs \
    git \
    inkscape \
    jed \
    libsm6 \
    libxext-dev \
    libxrender1 \
    lmodern \
    netcat \
    python-dev \
    # ---- nbconvert dependencies ----
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    # Optional dependency
    texlive-fonts-extra \
    # ----
    tzdata \
    unzip \
    nano \
    curl \
    git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

#Install imagemagic
RUN cd /tmp/ ; wget https://www.imagemagick.org/download/ImageMagick.tar.gz && \
    tar xf ImageMagick.tar.gz
RUN cd /tmp/ImageMagick-7*; ./configure  && make install && ldconfig /usr/local/lib 
RUN apt-get -y install  zlib1g 

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs    | sh -s -- --default-toolchain=nightly -y

# Switch back to jovyan to avoid accidental container runs as root
USER jovyan

#Install R
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
        r-ggplot2 \
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
RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN pip install widgetsnbextension
RUN jupyter nbextension install --py widgetsnbextension --sys-prefix
RUN jupyter nbextension enable  --py widgetsnbextension --sys-prefix
RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$JAVA_LD_LIBRARY_PATH
RUN R CMD javareconf
RUN Rscript -e 'install.packages(c("RWekajars","rpart.plot","zip","gbm","R.methodsS3"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
RUN Rscript -e 'install.packages(c("R.oo","R.utils","officer","githubinstall","caret"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
#RUN Rscript -e 'install.packages(c("caret"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
RUN Rscript -e 'install.packages(c("knitr","kableExtra"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
RUN conda install \
	r-knitr \
	r-officer \
	r-zip \
	r-gbm \
	r-caret \
	r-kableExtra  \
        r-gplots \
        r-flextable \
        r-lavaan \
	r-OpenMx \
 	r-lava \
 	r-ROCR \
	r-semTools  \
        r-withr \
	r-gargle \
	r-Rcpp \
	r-hunspell \
	r-knitr \
	r-pinp  \
	r-rex \
	r-covr \
	r-brew \
	r-commonmark \
	r-desc \
	r-knitr\
	r-praise \
	r-Rcpp \
	r-roxygen2  \
	r-desc \
	r-testthat \
	r-pkgdown \
	r-prettyunits \
	r-cyclocomp \
	r-lintr \
	r-mockery  \
	r-spelling \
	r-DT  \
        r-rex\
        r-withr 

RUN pip install  \
	statistics \
	arch \
	johansen \
	pykalman \
	pymc3 \
	quantecon \
	data sources \
	pandas-datareader \
	pybea \
	quandl \
	wrds \
	yahoofinancials \
	yfinance \
	pixiedust \
	python-dotenv \
	requests \
	sympy \
	sqlalchemy \
        python-utilities \
	urllib3 

RUN Rscript -e 'IRkernel::installspec()'
RUN Rscript -e 'remove.packages("devtools")'
RUN rm -r   /opt/conda/lib/R/library/devtools/help/figures 
RUN rm -r   /opt/conda/lib/R/library/devtools/help  
RUN ls -lad /opt/conda/lib/R/library/devtools/*
RUN mv /opt/conda/lib/R/library/devtools/rstudio /tmp
RUN mv /opt/conda/lib/R/library/devtools/R       /tmp
RUN mv /opt/conda/lib/R/library/devtools/Meta    /tmp
RUN mv /opt/conda/lib/R/library/devtools/html    /tmp
RUN mv /opt/conda/lib/R/library/devtools/doc     /tmp
RUN mv /opt/conda/lib/R/library/devtools         /tmp
RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/devtools_2.2.2.tar.gz',repos=NULL,dependencies = TRUE)"
RUN Rscript -e 'library(devtools)'
#RUN Rscript -e 'install_github(c("susanathey/causalTree"), force=T,repos = "https://cloud.r-project.org",dependencies = TRUE)'
RUN jupyter nbextension install --py widgetsnbextension --sys-prefix
RUN jupyter nbextension enable  --py widgetsnbextension --sys-prefix
ADD custom.css    /tmp/custom.css
ADD common.json   /tmp/common.json
ADD tree.json     /tmp/tree.json
ADD notebook.json /tmp/notebook.json
ADD add_files.sh /tmp/add_files.sh
#RUN chown -R jovyan:1003 /home/jovyan
#RUN chown -R jovyan:1003 /opt/conda
USER root
ADD fix-permissions /usr/local/bin/fix-permissions
RUN chmod a+rx /usr/local/bin/fix-permissions /tmp/add_files.sh && fix-permissions /opt/conda &&  fix-permissions /home/$NB_USER 
USER root
RUN echo  jovyan:x:1000: >>/etc/group
USER jovyan
RUN pip install ipy_table==1.12
RUN pip install nbgrader
RUN jupyter nbextension install --system --py nbgrader --overwrite
RUN jupyter nbextension enable --system --py nbgrader
RUN jupyter serverextension enable --system --py nbgrader

