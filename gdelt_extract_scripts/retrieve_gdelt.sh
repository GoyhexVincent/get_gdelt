#!/bin/bash
date=$(date -d "1 day ago" +%Y%m%d)
echo  $date
wget http://data.gdeltproject.org/events/$date.export.CSV.zip
