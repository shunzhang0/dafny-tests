# FROM ubuntu:18.04 and python3.7
FROM holbertonschool/ubuntu-1804-python37

# install mono for ubuntu 18.04
RUN apt-get update
RUN apt install -qy gnupg ca-certificates
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN apt install -qy apt-transport-https ca-certificates
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" |  tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt-get update

RUN apt install -qy mono-complete

# install dafny
RUN apt install -qy curl unzip
RUN curl -L https://github.com/Microsoft/dafny/releases/download/v2.3.0/dafny-2.3.0.10506-x64-ubuntu-16.04.zip -o /opt/dafny.zip \
&& (cd /opt && unzip dafny.zip && rm dafny.zip)

# libgompl is needed to run z3
RUN apt update && apt install -qy libgomp1 

# add pytest
RUN pip3 install --upgrade pip
RUN pip3 install -U pytest


RUN pip3 install pipenv

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/dafny:/opt/dafny/z3/bin
