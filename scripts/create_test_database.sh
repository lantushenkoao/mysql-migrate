DB_FILE_FOLDER="../database/test_db/"
DB_FILE_NAME="employees.sql"
echo "Creating test database testdb from"
echo "Loading env variables from ../.env file. Make sure that file exists and setup correctly"
export $(grep -v '^#' ../.env | xargs)
cd $DB_FILE_FOLDER
mysql -u root -p${MYSQL_ROOT_PASS} --port ${MYSQL57_PORT} < ${DB_FILE_NAME}
cd ../../scripts
echo "All done"