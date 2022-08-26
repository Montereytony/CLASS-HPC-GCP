FROM jupyter/r-notebook

USER root

RUN apt-get -y update &&  apt-get -y upgrade && pip install --upgrade pip && pip install wheel

RUN npm install -g npm@7.16.0   

# install rstudio-server
RUN apt-get  -y install gdebi-core lib32gcc-s1 lib32stdc++6 libapparmor1 \
     libc6-i386 libclang-10-dev libclang-common-10-dev libclang-dev libclang1-10 \
     libedit2 libllvm10 libobjc-9-dev libobjc4 libpq5 psmisc && \
     wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.4.1717-amd64.deb &&\
     apt-get -y install /home/jovyan/rstudio-server-1.4.1717-amd64.deb && \
     apt-get clean && sudo -H rm -rf /var/lib/apt/lists/* && rm -rf /home/jovyan/rstudio-server-1.4.1717-amd64.deb
EXPOSE 8787

ADD settings/Rprofile.site /usr/local/lib/R/etc/
# ADD userconf.sh /etc/cont-init.d/conf
# ADD rstudio /etc/services.d/
ADD scripts /scripts
RUN python -m pip install jupyter-rsession-proxy && apt-get clean
USER $NB_USER
ENV PATH=$PATH:/usr/lib/rstudio-server/bin
