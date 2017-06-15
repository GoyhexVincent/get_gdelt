#bin/bash
container_name='gdelt_db'
host=$(docker inspect --format="{{ .NetworkSettings.IPAddress }}" $container_name)


docker pull alpine
docker run --rm -e PGPORT=5432 -e PGUSER=oryx -e PGPASSWORD=crake -e PGDATABASE=gdelt_db -e PGHOST=$host -v  $PWD:/mnt/scripts --link \"${container_name}\":gdelt_db alpine $execute_retrieve ; $execute_load

