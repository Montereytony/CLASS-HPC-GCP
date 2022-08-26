FROM ubuntu:19.04
MAINTAINER montereytony@gmail.com
RUN apt-get update
RUN apt-get -y install wget
RUN apt-get -y install openssh-server
RUN apt -y install wine64

RUN apt-get clean

RUN useradd -m winbox
RUN echo "winbox:winbox" | chpasswd

RUN wget -q -O /winbox.exe https://download.mikrotik.com/winbox/3.20/winbox64.exe

RUN mkdir /var/run/sshd

EXPOSE 22
VOLUME ["/home/winbox"]

CMD ["/usr/sbin/sshd", "-D"]
