#
# Building hue-build-env
#
FROM demomagic/hue-build-env:4.5.0
MAINTAINER demon 369587353@qq.com

WORKDIR /opt/hue

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

COPY common_header.mako /opt/hue/desktop/core/src/desktop/templates/common_header.mako

EXPOSE 8088

ENTRYPOINT ["/entrypoint.sh"]
CMD ["build/env/bin/hue", "runserver_plus", "0.0.0.0:8088"]
