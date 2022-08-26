# Build: docker build --rm --tag ds-test .
# Push: docker tag my_image $DOCKER_ID_USER/my_image
# git status
# git commit -m "comments Ubuntu and R to 3.4.2 "
# git push

FROM montereytony/ugba147:ugba147-Spring-2021-8
USER root
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install openssh-client --fix-missing
RUN rm -rf /tmp/*
ADD custom.css    /tmp/custom.css
ADD common.json   /tmp/common.json
ADD tree.json     /tmp/tree.json
ADD notebook.json /tmp/notebook.json
ADD id_ed25519    /tmp/id_ed25519
ADD id_rsa        /tmp/id_rsa
ADD known_hosts   /tmp/known_hosts
ADD add_files.sh  /tmp/add_files.sh
USER jovyan
