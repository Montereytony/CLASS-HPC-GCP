# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/minimal-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

USER root

# R pre-requisites
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    fonts-dejavu \
    unixodbc \
    unixodbc-dev \
    r-cran-rodbc \
    gfortran \
    gcc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
RUN sudo -H /opt/conda/bin/pip install pymysql python-sql mysql-connector-python 

USER ${NB_UID}

RUN conda install mamba -c conda-forge && mamba update mamba -c  conda-forge
RUN mamba install --quiet --yes \
    'r-base'  \
    'r-caret' \
    'r-crayon' \
    'r-devtools' \
    'r-e1071' \
    'r-forecast' \
    'r-hexbin' \
    'r-htmltools' \
    'r-htmlwidgets' \
    'r-irkernel' \
    'r-nycflights13' \
    'r-randomforest' \
    'r-rcurl' \
    'r-rodbc' \
    'r-rsqlite' \
    'r-shiny' \
    'r-units' \
    'r-jqr' \
    'r-geojson' \
    'r-sf' \
    'r-geojsonio' \
    'r-rgeos' \
    'r-gapminder' \
    'r-splitstackshape' \
    'r-rworldmap' \
    'r-gifski'  \
            'r-rmarkdown' \
            'r-tidymodels' \
            'r-tidyverse' \
    'unixodbc'  \
    'r-png'  \
     gcc_linux-64         gfortran_linux-64         r-essentials \
     r-htmlwidgets \
     r-gridExtra \
     r-e1071  \
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
     r-truncnorm\
     r-Rsolnp\
     r-rsample\
     r-proxy\
     r-vgam\
     r-checkmate\
     r-latticeExtra\
     r-acepack\
     r-htmlTable\
     r-viridis\
     r-brew\
     r-RColorBrewer\
     r-desc\
     r-commonmark\
     r-Hmisc\
     r-roxygen2\
     r-mice\
     r-mitools\
     r-mockery\
     r-praise\
     r-rex\
     r-fontBitstreamVera\
     r-fontLiberation\
     r-testthat\
     r-covr\
     r-fontquiver\
     r-svglite\
     r-drr\
     r-webshot\
     r-mclust\
     r-ggdendro\
     r-reshape\
     r-reshape2\
     r-prettyunits\
     r-progress\
     r-ggally\
     r-wordcloud2\
     r-openxlsx\
     r-rio\
     r-survey\
     r-coda\
     r-sfsmisc\
     r-pbivnorm\
     r-numDeriv\
     r-RcppRoll\
     r-DEoptimR\
     r-robustbase\
     r-gower\
     r-kernlab\
     r-cvst\
     r-SQUAREM\
     r-ddalpha\
     r-dimRed\
     r-ipred\
     r-recipes\
     r-neuralnet\
     r-irlba\
     r-kknn\
     r-gtools\
     r-gdata\
     r-caTools\
     r-gplots\
     r-ROCR\
     r-MLmetrics\
     r-dummies\
     r-clipr\
     r-ks\
      r-truncnorm\
      r-pdftools\
      r-Rsolnp\
      r-rsample\
      r-proxy\
      r-slam\
      r-VGAM\
      r-truncnorm\
      r-mclust\
      r-pracma\
      r-reshape\
      r-prettyunits\
      r-progress\
      r-GGally\
      r-wordcloud2\
      r-openxlsx\
      r-rio\
      r-survey\
      r-coda\
      r-mvtnorm\
      r-sfsmisc\
      r-mitools\
      r-pbivnorm\
      r-numDeriv\
      r-RcppRoll\
      r-DEoptimR\
      r-robustbase\
      r-gower\
      r-kernlab\
      r-CVST\
      r-DRR\
      r-SQUAREM\
      r-lava\
      r-ddalpha\
      r-dimRed\
      r-ipred\
      r-recipes\
      r-withr\
      r-caret\
      r-neuralnet\
      r-irlba\
      r-kknn\
      r-gtools\
      r-gdata\
      r-caTools\
      r-gplots\
      r-ROCR\
      r-MLmetrics\
      r-dummies\
      r-slam\
      r-NLP\
      r-tm\
      r-clipr\
      r-truncnorm\
      r-ggrepel\
      r-truncnorm\
      r-ggwordcloud\
      r-polyclip\
      r-entropy\
      r-tree\
      r-rjson\
      r-pbapply\
      r-glasso\
      r-huge\
      r-fdrtool\
      r-d3Network\
      r-ggm\
      r-BDgraph\
      r-igraph\
      r-proto\
      r-colorspace\
      r-RWekajars\
      r-rpart.plot\
      r-zip\
      r-gbm\
      r-R.methodsS3\
      r-R.oo\
      r-R.utils\
      r-officer\
      r-caret \
      ipympl\
     'ipywidgets' \
     'matplotlib-base'  \
    'sqlalchemy' \
    'statsmodels' \
    'sympy' \
    'widgetsnbextension'\
    'xlrd' \
     r-kableExtra \
     r-psych \
     r-lightgbm \
      r-dbi  r-rmariadb \
      r-qgraph && \
      mamba clean --all -f -y && \
      fix-permissions "${CONDA_DIR}" && \
      fix-permissions "/home/${NB_USER}"

RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN jupyter nbextension install --py widgetsnbextension --sys-prefix
RUN jupyter nbextension enable  --py widgetsnbextension --sys-prefix
RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$JAVA_LD_LIBRARY_PATH

RUN R CMD javareconf && \
     mamba clean --all -f -y && \
     fix-permissions "${CONDA_DIR}" && \
     fix-permissions "/home/${NB_USER}"

#RUN mamba install --quiet --yes \
#      r-kableExtra \
#      r-psych \
#      r-lightgbm \
#      r-qgraph && \
#      mamba clean --all -f -y && \
#      fix-permissions "${CONDA_DIR}" && \
#      fix-permissions "/home/${NB_USER}"
#RUN     mamba install --yes  r-dbi  r-rmariadb &&\
#    fix-permissions "${CONDA_DIR}" && \
#    fix-permissions "/home/${NB_USER}"

ADD custom.css /opt/conda/lib/python3.7/site-packages/notebook/static/custom/custom.css
ADD custom.css /opt/conda/lib/python3.7/site-packages/jupyter_core/tests/dotipython/profile_default/static/custom/custom.css
ADD custom.css /opt/conda/lib/python3.7/site-packages/jupyter_core/tests/dotipython_empty/profile_default/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/notebook-5.7.5-py37_0/lib/python3.7/site-packages/notebook/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/jupyter_core-4.6.1-py37_0/lib/python3.7/site-packages/jupyter_core/tests/dotipython/profile_default/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/jupyter_core-4.6.1-py37_0/lib/python3.7/site-packages/jupyter_core/tests/dotipython_empty/profile_default/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/notebook-6.0.1-py37_0/lib/python3.7/site-packages/notebook/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/jupyter_core-4.4.0-py_0/site-packages/jupyter_core/tests/dotipython/profile_default/static/custom/custom.css
ADD custom.css /opt/conda/pkgs/jupyter_core-4.4.0-py_0/site-packages/jupyter_core/tests/dotipython_empty/profile_default/static/custom/custom.css

ADD custom.css 		/tmp
ADD common.json  	/tmp
ADD tree.json  		/tmp
ADD notebook.json 	/tmp
ADD common.json   	/tmp
ADD tree.json     	/tmp
ADD notebook.json  	/tmp
ADD add_files.sh  	/tmp

USER root
RUN sudo -H /opt/conda/bin/pip install pymysql python-sql mysql-connector-python 
USER ${NB_UID}
