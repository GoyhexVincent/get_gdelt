#!/bin/bash
echo 'The following wget command allows you to download everything from 20150101 to 20171231'
echo 'Feel free to change the settings according to your needs: {starting_year..ending_year}{starting_month..ending_month}{starting_day..ending_day}'
wget -P ../gdelt_data http://data.gdeltproject.org/events/2017{01..02}{01..03}.export.CSV.zip


container_name='gdelt_clickhouse'
host=$(docker inspect --format="{{ .NetworkSettings.IPAddress }}" $container_name)

cd ../gdelt_data
array=($(ls ../gdelt_data))

for i in  "${array[@]}"
do
	echo "$i"
	unzip $i
	##rm $i
        CSV="${i::-4}"
        docker run -it --rm --link $container_name:clickhouse-server yandex/clickhouse-client -m ../gdelt_data:/gdelt_data --host /gdelt_data/CSV | clickhouse-server --query='INSERT INTO gdelt FORMAT CSV'
	echo 'import successful!'
	##rm $CSV
done

