#bin/bash
container_name='gdelt_clickhouse'
host=$(docker inspect --format="{{ .NetworkSettings.IPAddress }}" $container_name)

docker run -it --rm --link some-clickhouse-server:$gdelt_clickhouse yandex/clickhouse-client --host clickhouse-server -q ""


