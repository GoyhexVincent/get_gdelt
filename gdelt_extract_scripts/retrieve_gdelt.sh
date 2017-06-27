#!/bin/bash

rm -rf /gdelt_data
mkdir gdelt_data

date=$(date -d "1 day ago" +%Y%m%d)
echo  $date
wget -P ./gdelt_data http://data.gdeltproject.org/events/$date.export.CSV.zip

cd ./gdelt_data

#bin/bash
container_name='gdelt_db'
host=$(docker inspect --format="{{ .NetworkSettings.IPAddress }}" $container_name)

psql -h $host -d gdelt_db -p 5432 -U oryx -c "CREATE EXTENSION hstore;"

