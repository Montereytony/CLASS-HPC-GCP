# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=jupyter/minimal-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

USER root

# ffmpeg for matplotlib anim & dvipng+cm-super for latex labels
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends ffmpeg dvipng cm-super && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN  apt-get update && apt-get -y install software-properties-common 
RUN  add-apt-repository universe  && apt-get -y install libncurses5 && \
     add-apt-repository ppa:linuxuprising/libpng12  && \
     apt-get -y install libpng12-0

RUN  pip install stata_kernel &&  python -m stata_kernel.install --sys-prefix

RUN  ln -sf /lib/x86_64-linux-gnu/libncurses.so.6  /usr/lib/libncurses.so.5  && \
     ln -sf /lib/x86_64-linux-gnu/libncursesw.so.6  /usr/lib/libncursesw.so.5  && \
     ln -sf /lib/x86_64-linux-gnu/libtinfo.so.6    /usr/lib/libtinfo.so.5 && \
     ln -sf /usr/lib/x86_64-linux-gnu/libncurses.so.6     /usr/lib/x86_64-linux-gnu/libncurses.so.5   && \
     ln -sf /usr/lib/x86_64-linux-gnu/libncursesw.so.6 /usr/lib/x86_64-linux-gnu/libncursesw.so.5  && \
     ln -sf /usr/lib/x86_64-linux-gnu/libncursesw.so.6.2 /usr/lib/x86_64-linux-gnu/libncursesw.so.5
RUN  ldconfig -p
RUN  python -m pip install ipykernel && python -m ipykernel install --user
RUN  wget https://www.stata.com/python/pystata/misc/stata_setup-0.1.0.tar.gz &&  pip install stata_setup-0.1.0.tar.gz && rm -rf stata_setup-0.1.0.tar.gz

#USER $NB_UID

# Install Python 3 packages
RUN conda install --quiet --yes \
    'altair=4.1.*' \
    'beautifulsoup4=4.9.*' \
    'bokeh=2.3.*' \
    'bottleneck=1.3.*' \
    'cloudpickle=1.6.*' \
    'conda-forge::blas=*=openblas' \
    'cython=0.29.*' \
    'dask=2021.4.*' \
    'dill=0.3.*' \
    'h5py=3.2.*' \
    'ipympl=0.7.*'\
    'ipywidgets=7.6.*' \
    'matplotlib-base=3.4.*' \
    'numba=0.53.*' \
    'numexpr=2.7.*' \
    'pandas=1.2.*' \
    'patsy=0.5.*' \
    'protobuf=3.15.*' \
    'pytables=3.6.*' \
    'scikit-image=0.18.*' \
    'scikit-learn=0.24.*' \
    'scipy=1.6.*' \
    'seaborn=0.11.*' \
    'sqlalchemy=1.4.*' \
    'statsmodels=0.12.*' \
    'sympy=1.8.*' \
    'widgetsnbextension=3.5.*'\
    'xlrd=2.0.*' && \
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Install facets which does not have a pip or conda package at the moment
WORKDIR /tmp

RUN git clone https://github.com/PAIR-code/facets.git && \
    jupyter nbextension install facets/facets-dist/ --sys-prefix && \
    rm -rf /tmp/facets && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Import matplotlib the first time to build the font cache.
ENV XDG_CACHE_HOME="/home/${NB_USER}/.cache/"

RUN MPLBACKEND=Agg python -c "import matplotlib.pyplot" && \
    fix-permissions "/home/${NB_USER}"

USER $NB_UID
ENV PATH=$PATH:/home/jovyan/.local/bin:/bulk/apps/STATA/stata15
ENV STATA_SYSDIR=/bulk/apps/STATA/stata15
#RUN echo "/bulk/apps/STATA/stata15/stata" > /home/jovyan/.stata_kernel.conf
COPY stata_kernel.conf  /home/jovyan/.stata_kernel.conf
RUN pip install ipystata --upgrade --force-reinstall
WORKDIR $HOME
