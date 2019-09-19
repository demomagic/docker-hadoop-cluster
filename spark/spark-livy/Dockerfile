#
# Building spark-base
#
FROM demomagic/spark-base
MAINTAINER demon 369587353@qq.com

ENV LIVY_VERSION=0.6.0

WORKDIR /opt

RUN apt-get update && apt-get install -y --no-install-recommends unzip \
	&& wget http://mirrors.tuna.tsinghua.edu.cn/apache/incubator/livy/${LIVY_VERSION}-incubating/apache-livy-${LIVY_VERSION}-incubating-bin.zip \
	&& unzip apache-livy-${LIVY_VERSION}-incubating-bin.zip \
	&& mv apache-livy-${LIVY_VERSION}-incubating-bin livy \
	&& rm apache-livy-${LIVY_VERSION}-incubating-bin.zip
ENV LIVY_HOME=/opt/livy
ENV PATH $LIVY_HOME/bin:$PATH

RUN mkdir $LIVY_HOME/logs

ADD livy.conf ${LIVY_HOME}/conf

EXPOSE 8998

COPY startup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startup.sh
CMD startup.sh
