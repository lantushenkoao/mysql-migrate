DB_FILE_FOLDER="../database/test_db/"
DB_FILE_NAME="employees.sql"
ENV_FILE_PATH="../.env"
echo "Creating test database testdb from"
if [ ! -f $ENV_FILE_PATH ]; then
  echo "Env file does not exist. Please copy .env.sample to .env before using this script"
  exit 1
fi
echo "Loading env variables from ../.env file. Make sure that file exists and setup correctly"
export $(grep -v '^#' $ENV_FILE_PATH | xargs)

if [ ! -d $DB_FILE_FOLDER ]; then
  echo "Test database does not exist. Please copy database to $DB_FILE_FOLDER folder"
  exit 1
fi
cd $DB_FILE_FOLDER

read -p "Where do you want to create database? On (m)aster or on (s)lave?" destination
if [[ "$destination" == "m" ]]; then
  echo "Restoring database on master"
  mysql -u root -p${MYSQL_ROOT_PASS} --port ${MYSQL57_PORT} < ${DB_FILE_NAME}
else
  echo "Restoring database on slave"
  mysql -u root -p${MYSQL_ROOT_PASS} --port ${MYSQL8_PORT} < ${DB_FILE_NAME}
fi

cd ../../scripts
echo "All done"
