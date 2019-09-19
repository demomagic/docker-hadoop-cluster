#
# Building hue
#
FROM demomagic/hue-build-env:4.5.0
MAINTAINER demon 369587353@qq.com

WORKDIR /opt/hue

ADD entrypoint.sh /entrypoint.sh
ADD hue.ini /opt/hue/desktop/conf
RUN chmod a+x /entrypoint.sh

EXPOSE 8088

ENTRYPOINT ["/entrypoint.sh"]
CMD ["build/env/bin/hue", "runserver", "0.0.0.0:8088"]
