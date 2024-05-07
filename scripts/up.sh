cd ../
echo "Starting MySQL containers"
docker-compose -p mysql-migration-tests -f mysql57/docker-compose.yml --env-file .env  -f mysql8/docker-compose.yml up -d
echo "Containers started"
cd scripts