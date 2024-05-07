cd ../
echo "Stopping MySQL containers"
docker-compose -p mysql-migration-tests -f mysql57/docker-compose.yml -f mysql8/docker-compose.yml --env-file .env down
echo "Containers stopped"
cd scripts