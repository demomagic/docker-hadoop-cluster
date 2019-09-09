#
# Building hue-build-env
#
FROM ubuntu:18.04
MAINTAINER demon 369587353@qq.com

ENV DEBIAN_FRONTEND noninteractive

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
RUN sed -i s:/archive.ubuntu.com:/mirrors.aliyun.com:g /etc/apt/sources.list
RUN apt-get clean

RUN apt-get update
RUN apt-get install -y gcc
RUN apt-get install -y g++
RUN apt-get install -y libkrb5-dev
RUN apt-get install -y libmysqlclient-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y libsasl2-dev
RUN apt-get install -y libsasl2-modules-gssapi-mit
RUN apt-get install -y libsqlite3-dev
RUN apt-get install -y libtidy-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libxslt-dev
RUN apt-get install -y make
RUN apt-get install -y maven
RUN apt-get install -y libldap2-dev
RUN apt-get install -y python-dev
RUN apt-get install -y python-setuptools
RUN apt-get install -y libgmp3-dev
RUN apt-get install -y git
RUN apt-get install -y libffi-dev
RUN apt-get install -y npm
RUN apt-get install -y nodejs