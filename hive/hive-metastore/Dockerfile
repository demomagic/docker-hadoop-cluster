#
# Building hadoop-hive
#
FROM demomagic/hadoop-base

MAINTAINER demon 369587353@qq.com

ENV HIVE_VERSION 3.1.2

ENV HIVE_HOME /opt/hive
ENV HIVE_CONF_DIR $HIVE_HOME/conf
ENV PATH $HIVE_HOME/bin:$PATH

WORKDIR /opt

RUN curl -O http://archive.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz && \
	tar -xzvf apache-hive-$HIVE_VERSION-bin.tar.gz && \
	mv apache-hive-$HIVE_VERSION-bin hive && \
	curl -o $HIVE_HOME/lib/postgresql-jdbc.jar https://jdbc.postgresql.org/download/postgresql-42.2.6.jar && \
	rm -rf /opt/hive/lib/postgresql-*.jre*.jar && \
	rm apache-hive-$HIVE_VERSION-bin.tar.gz 

ADD conf/hive-site.xml $HIVE_HOME/conf
ADD conf/beeline-log4j2.properties $HIVE_HOME/conf
ADD conf/hive-env.sh $HIVE_HOME/conf
ADD conf/hive-exec-log4j2.properties $HIVE_HOME/conf
ADD conf/hive-log4j2.properties $HIVE_HOME/conf
ADD conf/ivysettings.xml $HIVE_HOME/conf
ADD conf/llap-daemon-log4j2.properties $HIVE_HOME/conf

EXPOSE 9083
EXPOSE 10000

COPY startup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startup.sh

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD startup.sh
