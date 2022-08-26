# Build: docker build --rm --tag ds-test .
# Push: docker tag my_image $DOCKER_ID_USER/my_image
# git status
# git commit -m "comments Ubuntu and R to 3.4.2 "
# git push

FROM montereytony/ugba147:ugba147-Spring-2021-8
USER root
RUN sudo -H /opt/conda/bin/pip install nb2pdf && conda install -c conda-forge r-corrplot && conda install r-dplyr 
USER jovyan
