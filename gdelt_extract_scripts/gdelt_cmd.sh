#bin/bash
container_name='gdelt_db'
host=$(docker inspect --format="{{ .NetworkSettings.IPAddress }}" $container_name)

psql -h $host -d gdelt_db -p 5432 -U oryx -c "CREATE EXTENSION IF NOT EXISTS postgis;"

psql -h $host -d gdelt_db -p 5432 -U oryx -c "CREATE EXTENSION IF NOT EXISTS hstore;"

psql -h $host -d gdelt_db -p 5432 -U oryx -c "CREATE SCHEMA gdelt;"

psql -h $host -d gdelt_db -p 5432 -U oryx -c "CREATE TABLE gdelt.data (GlobalEventID bigserial PRIMARY KEY NOT NULL, Day INTEGER, MonthYear INTEGER, Year INTEGER, FractionDate INTEGER, Actor1Code VARCHAR, Actor1Name VARCHAR, Actor1CountryCode VARCHAR, Actor1KnownGroupCode VARCHAR, Actor1EthnicCode VARCHAR, Actor1Religion1Code VARCHAR, Actor1Religion2Code varchar, Actor1Type1Code varchar, Actor1Type2Code VARCHAR, Actor1Type3Code VARCHAR, IsRootEvent VARCHAR, EventCode INTEGER, EventBaseCode INTEGER, EventRootCode INTEGER, QuadClass INTEGER, GoldsteinScale INTEGER, NumMentions INTEGER, NumSources INTEGER, NumArticles INTEGER, AvgTone INTEGER, Actor1Geo_Type INTEGER, Actor1Geo_Fullname VARCHAR, Actor1Geo_CountryCode VARCHAR, Actor1Geo_ADM1Code VARCHAR, Actor1Geo_Lat FLOAT, Actor1Geo_Long FLOAT, Actor1Geo_FeatureID INTEGER, DATEADDED INTEGER, SOURCEURL VARCHAR);"

