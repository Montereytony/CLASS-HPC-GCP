#
#
# Build: docker build --rm --tag montereytony/ugba147:ming .
# Push: docker tag my_image $DOCKER_ID_USER/my_image
#
# git status
# git commit -m "comments Ubuntu and R to 3.4.2 "
# git push
#

FROM montereytony/sql101:latest
USER root

RUN apt-get -y update --fix-missing &&  apt-get -y install openssh-client

USER jovyan
