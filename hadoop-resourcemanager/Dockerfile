#
# Building hadoop-resourcemanager
#
FROM demomagic/hadoop-base

MAINTAINER demon 369587353@qq.com

HEALTHCHECK CMD curl -f http://localhost:8088/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8088

CMD ["/run.sh"]
