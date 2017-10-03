#!/bin/bash
echo 'The following wget command allows you to download everything from 20150101 to 20171231'
echo 'Feel free to change the settings according to your needs: {starting_year..ending_year}{starting_month..ending_month}{starting_day..ending_day}'
mkdir gdelt_data

wget -P ./gdelt_data http://data.gdeltproject.org/events/20{13..17}{01..12}{01..31}.export.CSV.zip


container_name='gdelt_clickhouse'
host=$(docker inspect --format="{{ .NetworkSettings.IPAddress }}" $container_name)
cd ./gdelt_data
array=($(ls))

echo ls

for i in  "${array[@]}"
do
	echo "$i"
	unzip $i
	rm $i
        CSV="${i::-4}"
	echo "$CSV"
        cat $CSV | docker run  -i --rm --link $container_name:clickhouse-server yandex/clickhouse-client  clickhouse-client --host clickhouse-server --query='INSERT INTO gdelt FORMAT TSV'
	echo 'import successful!'
	rm $CSV
done
cd ../
rm -rf gdelt_data
