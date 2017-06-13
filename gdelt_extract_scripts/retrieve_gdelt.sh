#!/bin/bash
date=$(date -d "1 day ago" +%Y%m%d)
echo  $date
wget -P ./gdelt_data http://data.gdeltproject.org/events/$date.export.CSV.zip
