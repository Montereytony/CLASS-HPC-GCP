FROM jupyter/r-notebook

RUN python3 -m pip install jupyter-rsession-proxy jupyter-server-proxy

RUN cd /tmp/ && \
    git clone --depth 1 https://github.com/jupyterhub/jupyter-server-proxy && \
    cd jupyter-server-proxy/jupyterlab-server-proxy && \
    npm install && npm run build && jupyter labextension link . && \
    npm run build && jupyter lab build

# install rstudio-server
USER root
RUN apt-get -y update && \
    apt-get  -y install gdebi-core lib32gcc-s1 lib32stdc++6 libapparmor1 libc6-i386 libclang-10-dev libclang-common-10-dev libclang-dev libclang1-10 libedit2 libllvm10 libobjc-9-dev libobjc4 libpq5 psmisc && \
    wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.4.1717-amd64.deb 
RUN apt-get -y install /home/jovyan/rstudio-server-1.4.1717-amd64.deb && \ 
    apt-get clean && rm -rf /var/lib/apt/lists/* && rm -rf /home/jovyan/rstudio-server-1.4.1717-amd64.deb
ENV PATH=$PATH:/usr/lib/rstudio-server/bin:/bulk/apps/STATA/stata15
RUN  pip install --upgrade --user numpy pandas ipython matplotlib
RUN  apt-get update && apt-get -y install software-properties-common && add-apt-repository universe  && apt-get -y install libncurses5 && \
     add-apt-repository ppa:linuxuprising/libpng12  && \
     apt-get -y install libpng12-0
RUN  ln -sf /lib/x86_64-linux-gnu/libncurses.so.6  /usr/lib/libncurses.so.5  && \
     ln -sf /lib/x86_64-linux-gnu/libncursesw.so.6  /usr/lib/libncursesw.so.5  && \
     ln -sf /lib/x86_64-linux-gnu/libtinfo.so.6    /usr/lib/libtinfo.so.5 && \
     ln -sf /usr/lib/x86_64-linux-gnu/libncurses.so.6     /usr/lib/x86_64-linux-gnu/libncurses.so.5   && \
     ln -sf /usr/lib/x86_64-linux-gnu/libncursesw.so.6 /usr/lib/x86_64-linux-gnu/libncursesw.so.5  && \
     ln -sf /usr/lib/x86_64-linux-gnu/libncursesw.so.6.2 /usr/lib/x86_64-linux-gnu/libncursesw.so.5
RUN  ldconfig -p
RUN  python -m pip install ipykernel && python -m ipykernel install --user 
RUN  wget https://www.stata.com/python/pystata/misc/stata_setup-0.1.0.tar.gz &&  pip install stata_setup-0.1.0.tar.gz
RUN  pip install git+https://github.com/jrfiedler/stata-kernel
RUN   python -m stata_kernel.install
#RUN pip install stata_kernel
#RUN python -m stata_kernel install
RUN conda install nodejs -y 
RUN jupyter labextension install jupyterlab-stata-highlight
RUN python -m stata_kernel.install
ENV PATH=$PATH:/home/jovyan/.local/bin:/usr/lib/rstudio-server/bin;  STATA_SYSDIR=/bulk/apps/STATA/stata15
RUN  pip install stata_kernel --user  --ignore-install pexpect
USER $NB_USER
ENV PATH=$PATH:/home/jovyan/.local/bin:/usr/lib/rstudio-server/bin;  
ENV STATA_SYSDIR=/bulk/apps/STATA/stata15
