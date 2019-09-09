#
# Building spark-notebook
#
FROM demomagic/hadoop-base

MAINTAINER demon 369587353@qq.com

ENV APACHE_SPARK_VERSION 2.4.3
ENV APACHE_HADOOP_VERSION 3.1.2

RUN set -x \
    && curl -fSL "https://github.com/spark-notebook/spark-notebook/archive/v0.8.2.tar.gz" -o /tmp/spark-notebook.tgz \
    && tar -xzvf /tmp/spark-notebook.tgz -C /opt/ \
    && mv /opt/spark-notebook-* /opt/spark-notebook \
    && rm /tmp/spark-notebook.tgz

COPY run.sh /run.sh
RUN chmod a+x /run.sh

COPY application.conf /opt/spark-notebook/conf/
COPY clusters /opt/spark-notebook/conf/
COPY profiles /opt/spark-notebook/conf/
COPY jars /jars

RUN mkdir -p /data/resources

ENV NOTEBOOKS_DIR "/opt/spark-notebook/notebooks"
ENV RESOURCES_DIR "/data/resources"
ENV SPARK_MASTER "spark://spark-master:7077"
ENV SPARK_EXECUTOR_MEMORY "4G"
ENV EXTRA_CLASSPATH "/jars/*"

WORKDIR /opt/spark-notebook/

CMD ["/run.sh"]
