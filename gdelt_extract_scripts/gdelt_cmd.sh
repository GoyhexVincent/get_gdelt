#bin/bash
container_name='gdelt_db'
host=$(docker inspect --format="{{ .NetworkSettings.IPAddress }}" $container_name)

psql -h $host -d gdelt_db -p 5432 -U oryx -c "CREATE EXTENSION IF NOT EXISTS postgis;"

psql -h $host -d gdelt_db -p 5432 -U oryx -c "CREATE EXTENSION IF NOT EXISTS hstore;"

psql -h $host -d gdelt_db -p 5432 -U oryx -c "DROP SCHEMA IF EXISTS gdelt CASCADE;"

psql -h $host -d gdelt_db -p 5432 -U oryx -c "CREATE SCHEMA gdelt;"

psql -h $host -d gdelt_db -p 5432 -U oryx -c "CREATE TABLE gdelt.data (GlobalEventID bigserial PRIMARY KEY NOT NULL, Day INTEGER, MonthYear INTEGER, Year INTEGER, FractionDate FLOAT, Actor1Code VARCHAR, Actor1Name VARCHAR, Actor1CountryCode VARCHAR, Actor1KnownGroupCode VARCHAR, Actor1EthnicCode VARCHAR, Actor1Religion1Code VARCHAR, Actor1Religion2Code varchar, Actor1Type1Code varchar, Actor1Type2Code VARCHAR, Actor1Type3Code VARCHAR, Actor2Code VARCHAR, Actor2Name VARCHAR, Actor2CountryCode VARCHAR, Actor2KnownGroupCode VARCHAR, Actor2EthnicCode VARCHAR, Actor2Religion1Code VARCHAR, Actor2Religion2Code VARCHAR, Actor2Type1Code VARCHAR, Actor2Type2Code VARCHAR, Actor2Type3Code VARCHAR, IsRootEvent VARCHAR, EventCode INTEGER, EventBaseCode INTEGER, EventRootCode INTEGER, QuadClass INTEGER, GoldsteinScale FLOAT, NumMentions INTEGER, NumSources INTEGER, NumArticles INTEGER, AvgTone FLOAT, Actor1Geo_Type INTEGER, Actor1Geo_Fullname VARCHAR, Actor1Geo_CountryCode VARCHAR, Actor1Geo_ADM1Code VARCHAR, Actor1Geo_Lat VARCHAR, Actor1Geo_Long VARCHAR, Actor1Geo_FeatureID VARCHAR, Actor2Geo_Type VARCHAR, Actor2Geo_FullName VARCHAR, Actor2Geo_CountryCode VARCHAR, Actor2Geo_ADM1Code VARCHAR, Actor2Geo_Lat VARCHAR, Actor2Geo_Long VARCHAR, Actor2Geo_FeatureID VARCHAR, ActionGeo_Type VARCHAR, ActionGeo_FullName VARCHAR, ActionGeo_CountryCode VARCHAR, ActionGeo_ADM1Code VARCHAR, ActionGeo_Lat VARCHAR, ActionGeo_Long VARCHAR, ActionGeo_FeatureID VARCHAR, DATEADDED INTEGER, SOURCEURL VARCHAR);"

