#
#
# Build: docker build --rm --tag montereytony/jupyernettes .
# Push: docker tag my_image $DOCKER_ID_USER/my_image
#
# git status
# git commit -m "comments Ubuntu and R to 3.4.2 "
# git push
#

FROM montereytony/ugba147:squashed
USER root

RUN apt -y autoremove
RUN apt -y install oracle-java8-set-default 
RUN export LD_LIBRARY_PATH=/usr/lib/jvm/java-8-oracle/jre/lib/amd64/server
RUN rm /usr/bin/iconv \
  && curl -SL http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.14.tar.gz | tar -xz -C . \
  && cd libiconv-1.14 \
  && ./configure --prefix=/usr/local \
  && curl -SL https://raw.githubusercontent.com/mxe/mxe/7e231efd245996b886b501dad780761205ecf376/src/libiconv-1-fixes.patch \
  | patch -p1 -u  \
  && make \
  && make install \
  && cd .. \
  && rm -rf libiconv-1.14

ENV LD_PRELOAD /usr/local/lib/preloadable_libiconv.so

RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/rJava_0.9-10.tar.gz',repos=NULL)"


RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/clipr_0.4.0.tar.gz',repos=NULL)"
RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$JAVA_LD_LIBRARY_PATH
RUN R CMD javareconf
RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/RWekajars_3.9.2-1.tar.gz',repos=NULL)"
#RUN conda install -c glaxosmithkline r-rwekajars 
#
RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/RWeka_0.4-38.tar.gz',repos=NULL)"
RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/rpart.plot_2.2.0.tar.gz',repos=NULL)"
#
#
#RUN Rscript -e "install.packages('http://cran.us.r-project.org/src/contrib/Archive/R.methodsS3/R.methodsS3_1.7.1.tar.gz',repos=NULL)"
RUN Rscript -e "install.packages('http://cran.us.r-project.org/src/contrib/R.methodsS3_1.7.1.tar.gz',repos=NULL)"
RUN Rscript -e "install.packages('http://cran.us.r-project.org/src/contrib/Archive/R.oo/R.oo_1.21.0.tar.gz',repos=NULL)"
RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/R.utils_2.6.0.tar.gz',repos=NULL)"
RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/officer_0.3.0.tar.gz',repos=NULL)"
RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/praise_1.0.0.tar.gz',repos=NULL)"
RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/testthat_2.0.0.tar.gz',repos=NULL)"
RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/mockery_0.4.1.tar.gz',repos=NULL)"
RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/magic_1.5-8.tar.gz',repos=NULL)"
RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/wand_0.2.0.tar.gz',repos=NULL)"
##
## This should allow users to turn off extension if they do not want them.
##
USER jovyan
RUN jupyter nbextensions_configurator enable
