#!/bin/bash
set +e

mkdir /var/lib/postgresql/data/dockerinfo
touch /var/lib/postgresql/data/dockerinfo/init-db-world-has-run

echo "SELECT 'Ok' AS result FROM pg_database WHERE datname='gdelt_db'" | psql --username "$POSTGRES_USER" | grep Ok
if [ $? = 1 ] 
then
    touch /var/lib/postgresql/data/dockerinfo/db-world-created
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -c "CREATE DATABASE gdelt_db;"
fi

echo "SELECT 'Ok' AS result FROM pg_roles WHERE rolname='postgres'" | psql --username "$POSTGRES_USER" | grep Ok
if [ $? = 1 ] 
then
    touch /var/lib/postgresql/data/dockerinfo/user-redpig-created
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
        CREATE ROLE postgres LOGIN
          ENCRYPTED PASSWORD 'postgres'
          SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION;
EOSQL
fi
