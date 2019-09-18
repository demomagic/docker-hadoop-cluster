#
# Building spark-base
#
FROM ubuntu:18.04
MAINTAINER demon 369587353@qq.com

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
RUN sed -i s:/archive.ubuntu.com:/mirrors.aliyun.com:g /etc/apt/sources.list
RUN apt-get clean

ENV ENABLE_INIT_DAEMON true
ENV INIT_DAEMON_BASE_URI http://identifier/init-daemon
ENV INIT_DAEMON_STEP spark_master_init

ENV SPARK_VERSION=2.4.4
ENV SCALA_VERSION=2.11.12
ENV HADOOP_VERSION=2.7

COPY wait-for-step.sh /
COPY execute-step.sh /
COPY finish-step.sh /

RUN apt-get update && apt-get install -y --no-install-recommends curl bash openjdk-8-jdk wget python3.6 python3-pip \
      && ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld-linux-x86-64.so.2 \
	  && chmod +x *.sh \
      && wget https://mirrors.aliyun.com/apache/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
      && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
	  && rm -rf /var/lib/apt/lists/* \
	  && cd /
	  
ENV SPARK_HOME=/spark
ENV PATH $SPARK_HOME/bin:$PATH
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

RUN wget https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz \
      && tar -xvzf scala-${SCALA_VERSION}.tgz  \
      && mv scala-${SCALA_VERSION} scala \
      && rm scala-${SCALA_VERSION}.tgz 

ENV SCALA_HOME=/scala
ENV PATH $SCALA_HOME/bin:$PATH

#Give permission to execute scripts
RUN chmod +x /wait-for-step.sh && chmod +x /execute-step.sh && chmod +x /finish-step.sh

# Fix the value of PYTHONHASHSEED
# Note: this is needed when you use Python 3.3 or greater
ENV PYTHONHASHSEED 1
