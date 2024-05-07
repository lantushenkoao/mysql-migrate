# mysql-migrate
Testing MySQL 5.7 to 8 migration options

The task is to migrate MySQL 5.7 databases to MySQL 8 with minimal downtime using MySQL replication.

MySQL 5.7 is going to be master, MySQL 8 is going to be slave

Example database is (not included in this repository to save HDD space)
https://github.com/datacharmer/test_db/releases/tag/v1.0.7

Before running scripts:

1. Create .env file from .env.sample

2. Copy example database into /database/test_db folder 

To execute scripts, cd into ./scripts folder first

Read about how to setup replication here https://www.digitalocean.com/community/tutorials/how-to-set-up-replication-in-mysql
