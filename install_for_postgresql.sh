#!/bin/bash
sudo ./docker/postgis-db/docker_cmd.sh
./gdelt_extract_scripts/gdelt_postgresql/gdelt_db_cmd.sh
./gdelt_extract_scripts/gdelt_postgresql/retrieve_gdelt_db_all.sh
