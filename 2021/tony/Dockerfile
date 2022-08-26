FROM jupyter/tensorflow-notebook
USER root

RUN apt update && apt install --yes git

USER jovyan

RUN pip install nbgitpuller && \
jupyter serverextension enable --py nbgitpuller --sys-prefix && \
jupyter labextension install @jupyterlab/git && \
pip install jupyterlab-git && \
jupyter serverextension enable --py jupyterlab_git

ENV NBGITPULLER_APP lab

WORKDIR /home/jovyan/work
CMD [“start.sh”, “jupyter”, “lab”,"–notebook-dir=/home/jovyan/work"]
