FROM ubuntu:18.04 as base
MAINTAINER montereytony@gmail.com

RUN echo 'APT::Install-Recommends 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && echo 'APT::Install-Suggests 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y vim.tiny wget sudo net-tools ca-certificates unzip apt-transport-https  curl nginx python-certbot-nginx \
 && rm -rf /var/lib/apt/lists/*
ADD *.yaml   /etc/nginx/site-enabled/
#RUN certbot certonly --noninteractive --agree-tos --cert-name  \
#    jupyterhub.hasstech.org  \ 
#    -d  mba217.haastech.org \
#    -d  ewmba217.haastech.org \
#    -d  ugba147.haastech.org \
#    -d  ugba88.haastech.org \
#    -d  mfe23o.haastech.org \
#    -d  mba267-11.haastech.org \
#    -d  mba290t-12.haastech.org \
#    -d  ewmba290t-12.haastech.org \
#    -d  ewmba267-11.haastech.org \
#    --webroot -w /var/www/html/ -m montereytony@gmail.com
