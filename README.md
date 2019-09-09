# docker-hadoop-cluster
    docker-compose -f docker-compose.yml up -d namenode datanode hive-metastore-postgresql
    docker-compose -f docker-compose.yml up -d hive-metastore
    docker-compose -f docker-compose.yml up -d resourcemanager nodemanager historyserver
    docker-compose -f docker-compose.yml up -d hive-server
    docker-compose -f docker-compose.yml up -d spark-master spark-worker hue
