#!/bin/bash

HUE_HOME="/opt/hue"
HUE_CONFIG_FILE="$HUE_HOME/desktop/conf/hue.ini"
APP_BLACKLIST="search,oozie,pig,zookeeper,impala,rdbms,metastore,hbase,security,sqoop,about"

RESOURCEMANAGER_HOST="resourcemanager"
RESOURCEMANAGER_PORT="8032"
RESOURCEMANAGER_API_URL="http://resourcemanager:8088"
PROXY_API_URL="http://resourcemanager:8030"
HISTORY_SERVER_API_URL="http://historyserver:8188"

HIVE_SERVER_HOST="hive-metastore"
HIVE_SERVER_PORT="10000"

LIVY_SERVER_URL="http://spark-livy:8998"
LIVY_SERVER_SESSION_KIND="yarn"

sed -i "s#.*blacklist.*#  app_blacklist=$APP_BLACKLIST#g" $HUE_CONFIG_FILE

sed -i "s#.*webhdfs_url.*#  webhdfs_url=http://$NAMENODE_HOST:9870/webhdfs/v1#g" $HUE_CONFIG_FILE
sed -i "s#.*fs_defaultfs.*#  fs_defaultfs=hdfs://$NAMENODE_HOST:9000#g" $HUE_CONFIG_FILE

#hadoop
sed -i "s#.*resourcemanager_host.*#  resourcemanager_host=$RESOURCEMANAGER_HOST#g" $HUE_CONFIG_FILE
sed -i "s#.*resourcemanager_port.*#  resourcemanager_port=$RESOURCEMANAGER_PORT#g" $HUE_CONFIG_FILE
sed -i "1107s#.*resourcemanager_api_url.*#  resourcemanager_api_url=$RESOURCEMANAGER_API_URL#" $HUE_CONFIG_FILE
sed -i "s#.*proxy_api_url.*#  proxy_api_url=$PROXY_API_URL#g" $HUE_CONFIG_FILE
sed -i "s#.*history_server_api_url.*#  history_server_api_url=$HISTORY_SERVER_API_URL#g" $HUE_CONFIG_FILE

#hive
sed -i "s#.*hive_server_host.*#  hive_server_host=$HIVE_SERVER_HOST#g" $HUE_CONFIG_FILE
sed -i "s#.*hive_server_port.*#  hive_server_port=$HIVE_SERVER_PORT#g" $HUE_CONFIG_FILE

#spark
sed -i "s#.*livy_server_url.*#  livy_server_url=$LIVY_SERVER_URL#g" $HUE_CONFIG_FILE
sed -i "s#.*livy_server_session_kind.*#  livy_server_session_kind=$LIVY_SERVER_SESSION_KIND#g" $HUE_CONFIG_FILE

$HUE_HOME/build/env/bin/hue syncdb --noinput 
$HUE_HOME/build/env/bin/hue migrate

exec $@
