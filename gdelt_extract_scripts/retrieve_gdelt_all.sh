#!/bin/bash
echo 'The following wget command allows you to download everything from 20150101 to 20171231'
echo 'Feel free to change the settings according to your needs: {starting_year..ending_year}{starting_month..ending_month}{starting_day..ending_day}'
#wget -P ./gdelt_data http://data.gdeltproject.org/events/20{15..17}{01..12}{01..31}.export.CSV.zip
cd ./gdelt_data
array=($(ls))

for i in  "${array[@]}"
do
	echo "$i"
	unzip $i
	rm $i
        echo "${i::-4}"
done

