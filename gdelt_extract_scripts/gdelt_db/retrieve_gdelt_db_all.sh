#!/bin/bash
echo 'The following wget command allows you to download everything from 20150101 to 20171231'
echo 'Feel free to change the settings according to your needs: {starting_year..ending_year}{starting_month..ending_month}{starting_day..ending_day}'
wget -P ../gdelt_data http://data.gdeltproject.org/events/2017{01..12}{01..31}.export.CSV.zip

export PGPASSWORD='postgres'

container_name='gdelt_db'
host=$(docker inspect --format="{{ .NetworkSettings.IPAddress }}" $container_name)

cd ./gdelt_data
array=($(ls))

for i in  "${array[@]}"
do
	echo "$i"
	unzip $i
	rm $i
        CSV="${i::-4}"
	psql -h $host -d gdelt_db -p 5432 -U postgres -c "\COPY gdelt.data FROM '$CSV' WITH DELIMITER AS  E'\t'"
	echo 'import successful!'
	rm $CSV
done

