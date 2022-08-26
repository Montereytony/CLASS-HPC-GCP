#
#
# Build: docker build --rm --tag ds-test .
# Push: docker tag my_image $DOCKER_ID_USER/my_image
#
# git status
# git commit -m "comments Ubuntu and R to 3.4.2 "
# git push
#

FROM montereytony/fem2
USER root
ADD install_libraries2.R /tmp
RUN R -f /tmp/install_libraries2.R
RUN conda update -n base conda
RUN conda config --add channels conda-forge
RUN conda install -c conda-forge mshr ipython numpy sfepy
RUN apt-get install software-properties-common -y
RUN apt-get -y install libsuitesparse-dev 
RUN add-apt-repository ppa:fenics-packages/fenics -y
RUN apt-get update -y
RUN apt-get install --no-install-recommends fenics -y
#RUN conda install -c conda-forge/label/prerelease fenics
RUN conda install -c conda-forge fenics
RUN pip install git+https://bitbucket.org/dolfin-adjoint/pyadjoint.git@2018.1.0
RUN ln -s /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25 /lib64
RUN ln -s /usr/lib/x86_64-linux-gnu/libstdc++.so.6 /lib64
RUN rm /opt/conda/lib/libstdc++.so        && ln -s /opt/conda/lib/libstdc++.so.6.0.25 /opt/conda/lib/libstdc++.so
RUN rm /opt/conda/lib/libstdc++.so.6      && ln -s /opt/conda/lib/libstdc++.so.6.0.25 /opt/conda/lib/libstdc++.so.6
RUN rm /opt/conda/lib/libstdc++.so.6.0.21 && ln -s /opt/conda/lib/libstdc++.so.6.0.25 /opt/conda/lib/libstdc++.so.6.0.21
#COPY error.html /usr/local/share/jupyter/hub/templates/error.html
#COPY my-logo.png /usr/local/share/jupyter/hub/static/images/my-logo.png
USER jovyan
