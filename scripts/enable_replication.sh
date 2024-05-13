ENV_FILE_PATH=../.env
echo "Loading env variables from $ENV_FILE_PATH"
export $(grep -v '^#' $ENV_FILE_PATH | xargs)
read -p "Please enter log file position (you can find it running SHOW MASTER STATUS; command on Master)" LOG_POSITION
SQL_QUERY="CHANGE REPLICATION SOURCE TO
          SOURCE_HOST='mysql57',
          SOURCE_USER='${REPLICA_USER_NAME}',
          SOURCE_PASSWORD='${REPLICA_USER_PASSWORD}',
          SOURCE_LOG_FILE='mysql-bin.000001',
          SOURCE_LOG_POS=${LOG_POSITION}; "
echo $SQL_QUERY
mysql -u root -p${MYSQL_ROOT_PASS} --port ${MYSQL8_PORT} -e "${SQL_QUERY}"
mysql -u root -p${MYSQL_ROOT_PASS} --port ${MYSQL8_PORT} -e "START REPLICA;"


