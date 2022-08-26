#
#
#
#  manual build   docker build --rm --tag haas-gitauth .
#
FROM jupyter/datascience-notebook
USER root
#
#
RUN ln -s /bin/tar /bin/gtar
RUN /usr/bin/apt-get install unzip
RUN ln -s /usr/lib/git-core/* /usr/local/bin
RUN conda update -n base conda && /opt/conda/bin/pip install --upgrade pip
RUN sudo -H /opt/conda/bin/pip install --upgrade datascience okpy autopep8 isort nbgitpuller oauthenticator pandas matplotlib okpy  numpy scipy nbinteract datascience
#RUN conda install -c conda-forge jupyter_contrib_nbextensions jupyter_nbextensions_configurator
#RUN jupyter nbextension enable --py jupyter_contrib_nbextensions --sys-prefix
#RUN jupyter nbextension install --py widgetsnbextension --sys-prefix
#RUN jupyter serverextension enable --sys-prefix nbgitpuller
RUN pip install git+https://github.com/data-8/nbpuller.git
Run jupyter nbextension install --py nbpuller
RUN jupyter serverextension enable --py nbpuller
RUN jupyter serverextension enable --py nbgitpuller --sys-prefix
RUN sudo -H /opt/conda/bin/pip install --upgrade graphviz
RUN sudo -H /opt/conda/bin/pip install --upgrade datascience okpy autopep8 isort nbgitpuller oauthenticator pandas matplotlib okpy  numpy scipy nbinteract
RUN sudo -H /opt/conda/bin/pip install --upgrade gofer-grader
USER jovyan

#
#
#RUN pip3 install git+https://github.com/data-8/nbinteract.git
#
#
#
#RUN jupyter nbextensions_configurator enable
