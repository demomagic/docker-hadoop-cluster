#!/bin/bash

hadoop fs -mkdir -p    /user/spark/jars
hadoop fs -chmod g+w  /user/spark/jars
hdfs fs -put $SPARK_HOME/jars/* /user/spark/jars

cd $LIVY_HOME/bin
./bin/livy-server