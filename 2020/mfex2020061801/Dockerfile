# Build: docker build --rm --tag ds-test .
# Push: docker tag my_image $DOCKER_ID_USER/my_image
# git status
# git commit -m "comments Ubuntu and R to 3.4.2 "
# git push
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM  montereytony/mba263:mfex2020061801

USER root
RUN conda install -c conda-forge jupyter_contrib_nbextensions jupyter_nbextensions_configurator 
RUN pip install tensorflow  keras nltk
RUN conda clean --all -f -y &&  fix-permissions $CONDA_DIR &&    fix-permissions /home/$NB_USER
RUN conda install --quiet --yes tqdm
RUN pip install --ignore-installed --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.10.0-cp35-cp35m-linux_x86_64.whl
USER jovyan
