FROM montereytony/rstudio:haas
######
#  now let's add the desktop
#

USER root

#RUN apt-get -y update \
# && 
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update --fix-missing  && apt-get install -y dbus-x11    firefox  xfce4   \
   xfce4-panel \
   xfce4-session \
   xfce4-settings \
   xorg \
   xubuntu-icon-theme

# Remove light-locker to prevent screen lock
RUN wget 'https://sourceforge.net/projects/turbovnc/files/2.2.5/turbovnc_2.2.5_amd64.deb/download' -O turbovnc_2.2.5_amd64.deb && \
   apt-get install -y -q ./turbovnc_2.2.5_amd64.deb && \
   apt-get remove -y -q light-locker && \
   rm ./turbovnc_2.2.5_amd64.deb && \
   ln -s /opt/TurboVNC/bin/* /usr/local/bin/

# apt-get may result in root-owned directories/files under $HOME
#RUN chown -R $NB_USER:$NB_USER $HOME

ADD . /opt/install

#RUN grep rstudio /etc/passwd

RUN cd /opt/install && \
   conda env update -n base --file environment.yml

#
# Desktop End
#########




RUN chown -R ${NB_USER}:${NB_USER}  /home/${NB_USER} && chmod 755 /usr/local/bin/sas
#COPY fix-permissions /tmp/fix-permissions
USER ${NB_USER}
ENV PATH=$PATH:/bulk/apps/STATA/stata15
EXPOSE 8888

#RUN /tmp/fix-permissions /opt/install
RUN ${REPO_DIR}/postBuild
