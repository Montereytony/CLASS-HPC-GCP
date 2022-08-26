# Build: docker build --rm --tag ds-test .
# Push: docker tag my_image $DOCKER_ID_USER/my_image
# git status
# git commit -m "comments Ubuntu and R to 3.4.2 "
# git push
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

# Set when building on Travis so that certain long-running build steps can
# be skipped to shorten build time.
ARG TEST_ONLY_BUILD

USER root

# R pre-requisites
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fonts-dejavu \
    gfortran \
    gcc && \
    rm -rf /var/lib/apt/lists/*


# R packages including IRKernel which gets installed globally.
RUN conda install --quiet --yes \
    'r-base=3.6.2' \
    'r-caret=6.0*' \
    'r-crayon=1.3*' \
    'r-devtools=2.2*' \
    'r-forecast=8.10*' \
    'r-hexbin=1.28*' \
    'r-htmltools=0.4*' \
    'r-htmlwidgets=1.5*' \
    'r-irkernel=1.1*' \
    'r-nycflights13=1.0*' \
    'r-plyr=1.8*' \
    'r-randomforest=4.6*' \
    'r-rcurl=1.98*' \
    'r-reshape2=1.4*' \
    'r-rmarkdown=2.1*' \
    'r-rsqlite=2.1*' \
    'r-shiny=1.3*' \
    'r-tidyverse=1.3*' \
    'rpy2=3.1*' \
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
    r-ks \
    && \
    conda clean --all -f -y && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN Rscript -e 'install.packages(c("truncnorm","pdftools","Rsolnp","LSAmitR", "Rgraphviz", "graph", "rsample", "proxy", "slam", "Rcampdf", "tm.lexicon.GeneralInquirer", "VGAM", "impute", "truncnorm","truncnorm","checkmate", "latticeExtra", "acepack", "htmlTable", "viridis", "brew", "desc", "commonmark", "Hmisc", "roxygen2", "DT","dencies", "mice", "CDM", "mitools", "sirt", "TAM","miceadds","mockery", "praise", "rex", "fontBitstreamVera", "fontLiberation", "testthat", "covr", "fontquiver", "svglite", "pbdZQM","DRR", "webshot","mclust","pracma","reshape","prettyunits","progress","GGally","multiwayvcov","wordcloud2","openxlsx","rio","survey","coda","mvtnorm","sfsmisc","polucor","CDM","TAM","mitools","pbivnorm","numDeriv","Archive","lavaan","lavaan.survey","sirt","RcppRoll","DEoptimR","robustbase","gower","kernlab","CVST","DRR","SQUAREM","lava","ddalpha","dimRed","ipred","recipes","withr","caret","neuralnet","irlba","kknn","gtools","gdata","caTools","gplots","ROCR","MLmetrics","dummies","slam","NLP","tm","clipr","truncnorm","zipcode"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
#
## NB extensions is not working when running it in jupyterhub kubernetes so adding this next line
RUN apt -y install default-jre
RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN jupyter nbextension install --py widgetsnbextension --sys-prefix
RUN jupyter nbextension enable  --py widgetsnbextension --sys-prefix
RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$JAVA_LD_LIBRARY_PATH
RUN R CMD javareconf
RUN Rscript -e 'install.packages(c("RWekajars","rpart.plot","zip","gbm","R.methodsS3","R.oo","R.utils","officer","githubinstall","caret"),repos = "https://cloud.r-project.org",dependencies = TRUE)' && \
    Rscript -e 'install.packages(c("knitr","kableExtra"),repos = "https://cloud.r-project.org",dependencies = TRUE)' &&\
    Rscript -e 'install.packages(c("ggrepel","truncnorm","ggwordcloud","polyclip","entropy","tree","rjson","pbapply","igraphdata","glasso", "huge", "fdrtool", "d3Network", "ggm", "BDgraph", "pbappla", "ggdendro","igraph","proto","colorspace"),repos = "https://cloud.r-project.org",dependencies = TRUE)'

RUN Rscript -e 'install.packages("https://cran.r-project.org/src/contrib/Archive/repr/repr_0.19.2.tar.gz", repos=NULL, type="source")'  && \
    Rscript -e 'install.packages("https://cran.r-project.org/src/contrib/Archive/qgraph/qgraph_1.6.3.tar.gz", repos=NULL, type="source")'  && \
    Rscript -e 'install.packages("https://cran.r-project.org/src/contrib/Archive/ggplot2/ggplot2_3.2.0.tar.gz", repos=NULL, type="source")'  && \
    Rscript -e 'install.packages(c("knitr","kableExtra"),repos = "https://cloud.r-project.org",dependencies = TRUE)' && \
    Rscript -e 'install.packages("http://cran.r-project.org/src/contrib/psych_1.9.12.31.tar.gz", repos=NULL, type="source")'

RUN /opt/conda/bin/pip install tqdm datascience
RUN conda update -n base conda
RUN conda install -c conda-forge jupyter_contrib_nbextensions jupyter_nbextensions_configurator tensorflow  keras
RUN conda clean --all -f -y &&  fix-permissions $CONDA_DIR &&    fix-permissions /home/$NB_USER
RUN conda install --quiet --yes tqdm

ADD custom.css /opt/conda/lib/python3.7/site-packages/notebook/static/custom/custom.css
ADD custom.css /opt/conda/lib/python3.7/site-packages/jupyter_core/tests/dotipython/profile_default/static/custom/custom.css
ADD custom.css /opt/conda/lib/python3.7/site-packages/jupyter_core/tests/dotipython_empty/profile_default/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/notebook-5.7.5-py37_0/lib/python3.7/site-packages/notebook/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/jupyter_core-4.6.1-py37_0/lib/python3.7/site-packages/jupyter_core/tests/dotipython/profile_default/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/jupyter_core-4.6.1-py37_0/lib/python3.7/site-packages/jupyter_core/tests/dotipython_empty/profile_default/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/notebook-6.0.1-py37_0/lib/python3.7/site-packages/notebook/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/jupyter_core-4.4.0-py_0/site-packages/jupyter_core/tests/dotipython/profile_default/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/jupyter_core-4.4.0-py_0/site-packages/jupyter_core/tests/dotipython_empty/profile_default/static/custom/custom.css


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
USER jovyan
