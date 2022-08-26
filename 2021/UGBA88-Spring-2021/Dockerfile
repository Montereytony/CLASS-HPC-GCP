# Build: docker build --rm --tag ds-test .
# Push: docker tag my_image $DOCKER_ID_USER/my_image
# git status
# git commit -m "comments Ubuntu and R to 3.4.2 "
# git push

FROM montereytony/ugba147:ugba88-Spring-2021-15
USER root
ADD custom.css    /tmp/custom.css
ADD common.json   /tmp/common.json
ADD tree.json     /tmp/tree.json
ADD add_files.sh  /tmp/add_files.sh
ADD notebook.json /tmp/notebook.json
RUN jupyter nbextension install --py widgetsnbextension --sys-prefix && \
    jupyter nbextension enable codefolding/main && \
    jupyter nbextension enable zenmode/main && \
    jupyter nbextension enable table_beautifier/main &&\
    jupyter nbextensions_configurator enable 
USER jovyan
RUN jupyter nbextension enable  --py widgetsnbextension --sys-prefix
