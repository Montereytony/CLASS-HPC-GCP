# Build: docker build --rm --tag ds-test .
# Push: docker tag my_image $DOCKER_ID_USER/my_image
# git status
# git commit -m "comments Ubuntu and R to 3.4.2 "
# git push

FROM montereytony/ugba199-fall-2021:test1
USER root
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install openssh-client --fix-missing
RUN rm -rf /tmp/*
USER jovyan
ADD custom.css    /tmp/custom.css
ADD common.json   /tmp/common.json
ADD tree.json     /tmp/tree.json
ADD notebook.json /tmp/notebook.json
ADD id_ed25519    /tmp/id_ed25519
ADD id_rsa        /tmp/id_rsa
ADD known_hosts   /tmp/known_hosts
ADD add_files.sh  /tmp/add_files.sh
RUN Rscript -e 'install.packages(c("https://cran.r-project.org/src/contrib/mongolite_2.3.1.tar.gz"),dependencies = TRUE)'
RUN Rscript -e 'install.packages(c("https://cran.r-project.org/src/contrib/jsonlite_1.7.2.tar.gz"),dependencies = TRUE)'
#RUN Rscript -e 'install.packages(c("https://cran.r-project.org/src/contrib/gapminder_0.3.0.tar.gz","https://cran.r-project.org/src/contrib/splitstackshape_1.4.8.tar.gz"),dependencies = TRUE)'
RUN Rscript -e 'install.packages(c("devtools","methods"), dependencies=TRUE,repos = "https://cloud.r-project.org")'
RUN Rscript -e 'install.packages(c("units","jqr","geojson","sf","geojsonio"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
RUN Rscript -e 'install.packages(c("rgdal"), repos = "http://cran.us.r-project.org",type="source",dependencies = TRUE)'
#devtools::install_github('thomasp85/gganimate')
RUN Rscript -e "devtools::install_github('thomasp85/gganimate')"
RUN Rscript -e 'install.packages(c("gapminder","splitstackshape","rworldmap","rgeos","geojsonio"), repos = "http://cran.us.r-project.org",type="source",dependencies = TRUE)'
#RUN Rscript -e 'install.packages(c("gapminder","splitstackshape","rworldmap","rgeos","geojsonio"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
RUN Rscript -e 'install.packages(c("https://cran.r-project.org/src/contrib/rgeos_0.5-8.tar.gz"),dependencies = TRUE)'
RUN Rscript -e 'install.packages(c("ROSE"),repos = "https://cloud.r-project.org",dependencies = TRUE)'
