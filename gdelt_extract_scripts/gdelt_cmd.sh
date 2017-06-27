#bin/bash
container_name='gdelt_db'
host=$(docker inspect --format="{{ .NetworkSettings.IPAddress }}" $container_name)


docker pull alpine
docker run --rm  -v $PWD:/mnt/scripts --link $container_name:gdelt_db alpine retrieve_gdelt.sh 

