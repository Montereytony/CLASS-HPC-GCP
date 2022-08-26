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

# update indices
RUN apt update -qq
# install two helper packages we need
RUN apt-get -y install --no-install-recommends software-properties-common dirmngr
# import the signing key (by Michael Rutter) for these repo
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

RUN apt-get -y install --no-install-recommends r-base


USER jovyan
