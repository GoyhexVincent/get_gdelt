#!/bin/bash
./docker/clickhouse/docker_cmd.sh
./gdelt_extract_scripts/gdelt_clickhouse/gdelt_clickhouse_cmd.sh
./gdelt_extract_scripts/gdelt_clickhouse/retrieve_gdelt_clickhouse_all.sh

container_name='gdelt_clickhouse'

docker run -it --rm --link $container_name:clickhouse-server yandex/clickhouse-client --host clickhouse-server
