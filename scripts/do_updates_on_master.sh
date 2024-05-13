ENV_FILE_PATH=../.env
export $(grep -v '^#' $ENV_FILE_PATH | xargs)
SQL_QUERY=""
