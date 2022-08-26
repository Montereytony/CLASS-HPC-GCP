# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/minimal-notebook
FROM $BASE_CONTAINER

#LABEL maintainer="Tony Monterey <MontereyTony@gmail.com>"

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
    pip install mamba && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN conda install mamba -n base -c conda-forge

# R packages including IRKernel which gets installed globally.
# r-e1071: dependency of the caret R package
RUN mamba install --quiet --yes \
    'r-base' \
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
    'r-units' 

RUN mamba install --quiet --yes \
    'r-jqr' \
    'r-geojson' \
    'r-sf' \
    'r-geojsonio' \
    'r-rgeos' \
    'r-gapminder' \
    'r-splitstackshape' \
    'r-rworldmap' \
    'r-gifski'  \
    'unixodbc' && \
    mamba clean --all -f -y && \
    Rscript -e "devtools::install_github('thomasp85/gganimate')"  && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# These packages are not easy to install under arm
RUN set -x && \
    arch=$(uname -m) && \
    if [ "${arch}" == "x86_64" ]; then \
        mamba install --quiet --yes \
            'r-rmarkdown' \
            'r-tidymodels' \
            'r-tidyverse' && \
            mamba clean --all -f -y && \
            fix-permissions "${CONDA_DIR}" && \
            fix-permissions "/home/${NB_USER}"; \
    fi;
RUN mamba install --quiet --yes \
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
     r-ks && \
     mamba clean --all -f -y && \
     fix-permissions "${CONDA_DIR}" && \
     fix-permissions "/home/${NB_USER}"

RUN mamba install --quiet --yes \
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
     'xlrd'



RUN R CMD javareconf && \
     mamba clean --all -f -y && \
     fix-permissions "${CONDA_DIR}" && \
     fix-permissions "/home/${NB_USER}"

RUN mamba install --quiet --yes \
      r-kableExtra \
      r-psych \
      r-arules \
      r-lightgbm \
      jupyterlab-spellchecker \
      nbgitpuller \
      r-qgraph && \
    Rscript -e 'devtools::install_github("mhahsler/arulesViz")'  &&  \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

#RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN mamba install -c conda-forge jupyter_contrib_nbextensions
RUN jupyter nbextension install --py widgetsnbextension --sys-prefix
RUN jupyter nbextension enable  --py widgetsnbextension --sys-prefix
RUN jupyter serverextension enable --py nbgitpuller --sys-prefix && \
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$JAVA_LD_LIBRARY_PATH

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
       dnsutils \
       git \
       iputils-ping \
    && rm -rf /var/lib/apt/lists/*


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


USER ${NB_UID}

RUN Rscript -e 'install.packages(c("ROSE"),repos = "https://cloud.r-project.org",dependencies = TRUE)' && \
    Rscript -e 'devtools::install_github(c("ramnathv/htmlwidgets", "smartinsightsfromdata/rpivotTable"))'



#RUN apt -y update ; apt-get -y install zlib1g  zlib1g-dev  cargo libpng-dev libmagick++-dev
#RUN Rscript -e 'install.packages(c("knitr","kableExtra"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
#RUN    apt-get  -y autoclean &&\
#       apt-get update -y && apt-get upgrade -y     && \
#       apt-get install -y libglu1-mesa-dev libx11-dev libcgal-dev   && \
#       apt-get install -y xorg   && \
#       apt-get install -y libatlas-base-dev   && \
#       apt-get install -y gfortran   && \
#       apt-get install -y libblas-dev liblapack-dev   && \
#       apt-get install -y libftgl2 libfreetype6-dev
#RUN    rm -r /var/cache/apt/archives/ &&\
#       apt-get autoclean &&\
#       apt-get install -y libudunits2-dev libgeos-dev

#      lsamitR\
#      rgraphviz\
#      rcampdf\
#      dencies\
#      dencies\
#      sirt\
#      miceadds\
#      tam\
#      cdm\
#      dt\
#      multiwayvcov\
#      polucor\
#      archive\
#      lavaan\
#      lavaan.survey\
#      zipcode\
