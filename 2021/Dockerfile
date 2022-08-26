#
# These are just reminders/examples:
#
# Build: docker build --rm --tag ds-test .
# Push: docker tag my_image $DOCKER_ID_USER/my_image
# git status
# git commit -m "comments Ubuntu and R to 3.4.2 "
# git push
FROM jupyter/datascience-notebook:latest
USER root
RUN ln -s /bin/tar /bin/gtar   && apt-get -y update && apt-get -y upgrade && rm -rf /var/cache/*
RUN  apt-get -y install software-properties-common  && apt-get -y install default-jdk  && \
    apt-get -y update 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apt-utils \
    byobu curl git htop man unzip vim wget libcairo2-dev libxt-dev  \
    libjpeg-dev libpango1.0-dev libgif-dev build-essential g++ pandoc automake pkg-config  \
    libtool software-properties-common gsl-bin libgsl-dev  unixodbc   r-cran-rmpi  libwebp-dev &&\
    wget https://github.com/jgm/pandoc/releases/download/2.1/pandoc-2.1-1-amd64.deb && \
    /usr/bin/dpkg -i pandoc-2.1-1-amd64.deb && \
    rm pandoc-2.1-1-amd64.deb && \
    apt -y autoremove &&\
    apt-get clean 
RUN cd /tmp  &&  \
    mv /opt/conda /opt/conda.old  &&  \
    curl -O https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh 
RUN  bash /tmp/Anaconda3-2019.07-Linux-x86_64.sh -b -p /opt/conda

#Removed
# xls
# OpenMx
# r-xlsxjars \
# r-xlsx \

RUN conda config --append channels conda-forge
RUN pip install --upgrade pip
RUN pip install numpy tensorflow 
RUN conda install -c r r-ggplot2 r-RcppEigen
#
RUN Rscript -e 'install.packages(c("RcppEigen", "StanHeaders", "rpf","nycflights13"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
RUN conda install  \
        gcc_linux-64 \
        gfortran_linux-64 \
        r-essentials \
        r-htmlwidgets \
        r-gridExtra \
        r-e1071 \
        r-rgl \
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
        pandas \
    	matplotlib \
    	seaborn \
    	statsmodels \
    	statsmodels \
    	python-utils \
        proj4
    	#plotnine \
    	#phantomjs  \

RUN Rscript -e 'install.packages(c("https://cran.r-project.org/src/contrib/Cairo_1.5-9.tar.gz"),dependencies = TRUE)'
RUN Rscript -e 'install.packages(c("https://cran.r-project.org/src/contrib/gdtools_0.1.7.tar.gz"),dependencies = TRUE)'
RUN Rscript -e 'install.packages(c("https://cran.r-project.org/src/contrib/Archive/truncnorm/truncnorm_1.0.0.tar.gz"),dependencies = TRUE)'
RUN Rscript -e 'install.packages(c("pdftools","Rsolnp","LSAmitR", "Rgraphviz", "graph", "rsample", "proxy", "slam", "Rcampdf", "tm.lexicon.GeneralInquirer", "VGAM", "impute", "truncnorm","truncnorm","checkmate", "latticeExtra", "acepack", "htmlTable", "viridis", "brew", "desc", "commonmark", "Hmisc", "roxygen2", "DT","dencies", "mice", "CDM", "mitools", "sirt", "TAM"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
RUN Rscript -e 'install.packages(c("https://cran.r-project.org/src/contrib/miceadds_2.12-24.tar.gz"),dependencies = TRUE)'
RUN Rscript -e 'install.packages(c("mockery", "praise", "rex", "fontBitstreamVera", "fontLiberation", "testthat", "covr", "fontquiver", "svglite", "pbdZQM","r-igraph","wordcould","DRR", "webshot","mclust","pracma","ggdendro","reshape","prettyunits","progress","GGally","multiwayvcov","wordcloud2","openxlsx","rio","survey","coda","mvtnorm","sfsmisc","polucor","CDM","TAM","mitools"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
#
RUN Rscript -e 'install.packages(c("slam","GPArotation","permute","vegan","pbivnorm","numDeriv","Archive","lavaan","lavaan.survey","sirt","RcppRoll","DEoptimR","robustbase","gower","kernlab","CVST","DRR","SQUAREM","lava","prodlim","ddalpha","dimRed","ipred","recipes","withr","caret","neuralnet","irlba","kknn","gtools","gdata","caTools","gplots","ROCR","MLmetrics","dummies","slam","NLP","tm","clipr","ggalt","truncnorm"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
#
## NB extensions is not working when running it in jupyterhub kubernetes so adding this next line
RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN jupyter nbextension install --py widgetsnbextension --sys-prefix
RUN jupyter nbextension enable  --py widgetsnbextension --sys-prefix
RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$JAVA_LD_LIBRARY_PATH
RUN R CMD javareconf
RUN conda install -c r r-rpart.plot r-zip r-gbm r-R.methodsS3 r-R.oo r-R.utils r-officer r-praise
#RUN Rscript -e 'install.packages(c("RWekajars","rpart.plot","zip","gbm","R.methodsS3","R.oo","R.utils","officer","praise","testthat","mockery","githubinstall"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
##
## This should allow users to turn off extension if they do not want them.
##
USER jovyan
RUN jupyter nbextensions_configurator enable
