# FROM ubuntu:18.04 and python3.7
FROM holbertonschool/ubuntu-1804-python37

# update package list to include microsoft dotnet
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get update

# install donet-sdk-5.0
RUN apt-get update; \
  apt-get install -y apt-transport-https && \
  apt-get update && \
  apt-get install -qy dotnet-sdk-5.0

# install dafny3.0.0
RUN apt install -qy curl unzip
RUN curl -L https://github.com/Microsoft/dafny/releases/download/v3.0.0/dafny-3.0.0-x64-ubuntu-16.04.zip -o /opt/dafny.zip \
&& (cd /opt && unzip dafny.zip && rm dafny.zip)

# libgompl is needed to run z3
RUN apt update && apt install -qy libgomp1 

# add pytest (optional, and used for CI only)
RUN pip3 install --upgrade pip
RUN pip3 install -U pytest

RUN pip3 install pipenv

# Define paths to executubles
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/dafny:/opt/dafny/z3/bin
