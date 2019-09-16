#
# Building spark-base
#
FROM demomagic/hadoop-base
MAINTAINER demon 369587353@qq.com

ENV ENABLE_INIT_DAEMON true
ENV INIT_DAEMON_BASE_URI http://identifier/init-daemon
ENV INIT_DAEMON_STEP spark_master_init

ENV SPARK_VERSION=2.3.4
ENV LIVY_VERSION=0.6.0

WORKDIR /opt

RUN apt-get update && apt-get install -y --no-install-recommends curl bash openjdk-8-jdk wget python3.6 python-pip libnss3 \
      && ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld-linux-x86-64.so.2 \
      && chmod +x *.sh \
      && wget https://mirrors.aliyun.com/apache/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-without-hadoop.tgz \
      && tar -xvzf spark-${SPARK_VERSION}-bin-without-hadoop.tgz \
      && mv spark-${SPARK_VERSION}-bin-without-hadoop spark \
      && rm spark-${SPARK_VERSION}-bin-without-hadoop.tgz \
	  && rm -rf /var/lib/apt/lists/* 
ENV SPARK_HOME=/opt/spark
ADD conf/spark-defaults.conf ${SPARK_HOME}/conf
ADD conf/spark-env.sh ${SPARK_HOME}/conf

ADD scala-2.12.10.tgz /opt/scala
ENV SCALA_HOME=/opt/scala
ENV PATH $SCALA_HOME/bin/:$PATH

RUN wget http://mirrors.tuna.tsinghua.edu.cn/apache/incubator/livy/0.6.0-incubating/apache-livy-${LIVY_VERSION}-incubating-bin.zip \
	&& unzip apache-livy-${LIVY_VERSION}-incubating-bin.zip \
	&& mv apache-livy-${LIVY_VERSION}-incubating-bin livy \
	&& rm apache-livy-${LIVY_VERSION}-incubating-bin.zip
ENV LIVY_HOME=/opt/livy

# Fix the value of PYTHONHASHSEED
# Note: this is needed when you use Python 3.3 or greater
ENV PYTHONHASHSEED 1

COPY startup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startup.sh
CMD startup.sh
