# Build: docker build --rm --tag ds-test .
# Push: docker tag my_image $DOCKER_ID_USER/my_image
# git status
# git commit -m "comments Ubuntu and R to 3.4.2 "
# git push

FROM jupyter/r-notebook
USER root

ENV NB_USER jovyan
ENV NB_UID 2001
RUN /usr/bin/perl -pi -e 's/:1000:100:/:2001:1003:/' /etc/passwd
LABEL maintainer="Tony Cricelli <montereytony@gmail.com"


RUN python3 -m pip install jupyter-rsession-proxy
RUN cd /tmp/ && \
    git clone --depth 1 https://github.com/jupyterhub/jupyter-server-proxy && \
    cd jupyter-server-proxy/jupyterlab-server-proxy && \
    npm install && npm run build && jupyter labextension link . && \
    npm run build && jupyter lab build


# install rstudio-server
RUN ln -s /lib/x86_64-linux-gnu/libssl3.so /lib/x86_64-linux-gnu/libssl1.0.0  &&\
    apt-get update -y && apt-get install -y --no-install-recommends  &&\
    curl --silent -L --fail https://download2.rstudio.org/rstudio-server-1.1.419-amd64.deb > /tmp/rstudio.deb && \
    echo '24cd11f0405d8372b4168fc9956e0386 /tmp/rstudio.deb' | md5sum -c - && \
    apt-get install -y /tmp/rstudio.deb && \
    rm /tmp/rstudio.deb && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
ENV PATH=$PATH:/usr/lib/rstudio-server/bin
USER $NB_USER
