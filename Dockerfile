FROM kalilinux/kali-linux-docker:latest

MAINTAINER Ravi Singh <ravikantsingh.here@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color
ENV HOME /root

RUN apt-get update -y && apt-get clean all
RUN apt-get install -y software-properties-common && apt-get update -y && apt-get clean all
RUN apt-get install -y git colordiff colortail unzip vim tmux xterm zsh curl tree pciutils && apt-get clean all
RUN apt-get install -y kali-linux-all && apt-get clean all

COPY bash_aliases ${HOME}/.bash_aliases
RUN printf "export DOCKER_VM=docker-kali" >> ${HOME}/.bash_aliases

CMD ["/bin/bash"]

