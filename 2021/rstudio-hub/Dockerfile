FROM jupyter/r-notebook

RUN python3 -m pip install jupyter-rsession-proxy nbrsessionproxy
RUN cd /tmp/ && \
    git clone --depth 1 https://github.com/jupyterhub/jupyter-server-proxy && \
    cd jupyter-server-proxy/jupyterlab-server-proxy && \
    npm install && npm run build && jupyter labextension link . && \
    npm run build && jupyter lab build && npm audit fix
# install rstudio-server
USER root
RUN apt-get -y update && \
     apt-get  -y install gdebi-core lib32gcc-s1 lib32stdc++6 libapparmor1 \
     libc6-i386 libclang-10-dev libclang-common-10-dev libclang-dev libclang1-10 \
     libedit2 libllvm10 libobjc-9-dev libobjc4 libpq5 psmisc && \
     wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.4.1717-amd64.deb &&\
     apt-get -y install /home/jovyan/rstudio-server-1.4.1717-amd64.deb && \
     apt-get clean && rm -rf /var/lib/apt/lists/* && rm -rf /home/jovyan/rstudio-server-1.4.1717-amd64.deb
ENV PATH=$PATH:/usr/lib/rstudio-server/bin
USER $NB_USER
ENV PATH="${PATH}:/usr/lib/rstudio-server/bin"
ENV LD_LIBRARY_PATH="/usr/lib/R/lib:/lib:/usr/lib/x86_64-linux-gnu:/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/server:/opt/conda/lib/R/lib"
CMD /usr/lib/rstudio-server/bin/rserver && jupyterhub --no-ssl -f jupyterhub_config.py
