#
# Building zookeeper-base
#
FROM ubuntu:18.04
MAINTAINER demon 369587353@qq.com

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
RUN sed -i s:/archive.ubuntu.com:/mirrors.aliyun.com:g /etc/apt/sources.list
RUN apt-get clean

RUN apt-get update && apt-get install -y --no-install-recommends \
      openjdk-8-jdk \
      net-tools \
      curl \
      netcat \
      gnupg \
	  openssh-client \
	  openssh-server \
	  zip \
	  unzip \
	  less \
    && rm -rf /var/lib/apt/lists/*
      
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

ADD apache-zookeeper-3.5.5-bin.tar.gz /usr/local/apache-zookeeper/

RUN ln -s /usr/local/apache-zookeeper/apache-zookeeper-3.5.5-bin /usr/local/apache-zookeeper/current

RUN rm -f /tmp/apache-zookeeper-3.5.5-bin.tar.gz

RUN ln -s /usr/local/apache-zookeeper/apache-zookeeper-3.5.5-bin /app
RUN ln -s /usr/local/apache-zookeeper/apache-zookeeper-3.5.5-bin/conf /config

COPY zk-config /app/bin
COPY startup /
