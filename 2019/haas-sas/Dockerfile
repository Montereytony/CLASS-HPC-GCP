# 
#    docker build --rm --tag ds-test .
#

FROM centos
MAINTAINER  Tony Cricelli Tony@haas.berkeley.edu
USER root

## install necessary libraries
RUN yum makecache && yum -y install epel-release && yum -y update  && yum -y groupinstall 'Development Tools'
RUN yum -y install sudo numactl-libs.x86_64 libXp passwd install libpng12 install libXmu.x86_64 nodejs zlib-devel   bzip2-devel   openssl-devel   ncurses-devel   sqlite-devel readline-devel   tk-devel   gdbm-devel   db4-devel   libpcap-devel   xz-devel  wget expat expat-devel krb5-devel curl yum-utils

RUN curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo && yum -y install yarn
#Install Python3
RUN yum install -y python36 python36-devel  python36-setuptools
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN /usr/bin/python36 get-pip.py

RUN wget http://repo.continuum.io/archive/Anaconda2-5.2.0-Linux-x86_64.sh
RUN chmod u+x ./Anaconda2-5.2.0-Linux-x86_64.sh
RUN ./Anaconda2-5.2.0-Linux-x86_64.sh -b -p /opt/anaconda3
RUN export PATH=/opt/anaconda3/bin:$PATH
RUN curl --silent --location https://rpm.nodesource.com/setup_10.x | bash -
RUN npm install -g configurable-http-proxy
RUN pip install jupyterhub
RUN jupyterhub --generate-config
#RUN jupyterhub -f jupyterhub_config.py

#RUN pip install jupyter
#RUN jupyterhub





#Anaconda2-5.2.0-Linux-x86_64.sh
#
## example adding staff group
#RUN useradd -m sas
#RUN groupadd -g 1001 sasstaff
##### example adding sas user
#RUN usermod -a -G sasstaff sas
## set default password for this example only
### another technique - point to /etc/passwd
#RUN pip install sas_kernel
#
#RUN echo -e "foobar" | /usr/bin/passwd --stdin sas
### make SASHome directory
#RUN mkdir -p /usr/local/SASHome
#ADD SASHome.tar /
#RUN chown -R sas:sasstaff /usr/local/SASHome
#EXPOSE 38080
### An optional startup script can be added (more details below)
#ADD startup.sh /
#ENTRYPOINT ["/startup.sh"]
