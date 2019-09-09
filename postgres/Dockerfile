#
# Building hadoop-hive
#
FROM postgres:12

MAINTAINER demon 369587353@qq.com

ADD hive-schema-3.1.2.postgres12.sql /hive/hive-schema-3.1.2.postgres12.sql

ADD init-hive-db.sh /docker-entrypoint-initdb.d/init-user-db.sh
