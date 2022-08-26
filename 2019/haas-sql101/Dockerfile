#
#
# Build: docker build --rm --tag montereytony/ugba147:ming .
# Push: docker tag my_image $DOCKER_ID_USER/my_image
#
# git status
# git commit -m "comments Ubuntu and R to 3.4.2 "
# git push
#

FROM montereytony/ugba147-2
USER root
RUN ln -s /usr/lib/git-core/* /usr/local/bin
#RUN conda update -n base conda 
#RUN conda update conda 
RUN conda install python=3.6.3 
RUN /opt/conda/bin/pip install --upgrade pip
RUN pip3 install --upgrade oauthenticator nbgitpuller nbinteract nbconvert
RUN pip3 install pymysql pandas isort autopep8 glove-python nltk numpy gensim pathos spacy flashtext ipython-sql mysql-connector-python
RUN conda install -c conda-forge jupyter_contrib_nbextensions jupyter_nbextensions_configurator
RUN jupyter nbextension install --py widgetsnbextension --sys-prefix
RUN jupyter nbextension enable  --py widgetsnbextension --sys-prefix
RUN jupyter serverextension enable --sys-prefix      nbgitpuller nbinteract nbconvert
RUN jupyter nbextensions_configurator enable
RUN jupyter nbextension enable --py jupyter_contrib_nbextensions --sys-prefix
ADD glove /tmp/glove
RUN cd /tmp/glove; make && make install
RUN rm -r -f /tmp/glove;
RUN perl -pi -e 's/:1000:100:/:1001:1003:/' /etc/passwd

#RUN apt-get update && apt-get -y install --no-install-recommends --no-install-suggests \
#        ca-certificates software-properties-common gnupg2 gnupg1 \
#      && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 \
#      && add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' \
#      && apt-get install r-base 
#
# update indices
#RUN apt update -qq
# install two helper packages we need
#RUN apt install --no-install-recommends software-properties-common dirmngr
# import the signing key (by Michael Rutter) for these repo
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran35/"

RUN apt-get -y install openssh-client

USER jovyan
