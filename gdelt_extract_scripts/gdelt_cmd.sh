#bin/bash
container_name='gdelt_db'
host=$(docker inspect --format="{{ .NetworkSettings.IPAddress }}" $container_name)

psql -h $host -d gdelt_db -p 5432 -U oryx -c "CREATE EXTENSION IF NOT EXISTS postgis;"

psql -h $host -d gdelt_db -p 5432 -U oryx -c "CREATE EXTENSION IF NOT EXISTS hstore;"

psql -h $host -d gdelt_db -p 5432 -U oryx -c "CREATE SCHEMA gdelt;"

psql -h $host -d gdelt_db -p 5432 -U oryx -c "CREATE TABLE data (id bigserial PRIMARY KEY NOT NULL, goldsteinscale integer NOT NULL, date_added timestamp default NULL);"

