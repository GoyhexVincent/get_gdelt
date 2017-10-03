# coding: utf-8

from clickhouse_driver.client import Client
import csv

client = Client('172.17.0.2')
print(client.execute('SHOW TABLES'))

x = client.execute('SELECT GlobalEventID, Actor1CountryCode, Actor1KnownGroupCode, Actor1Religion1Code,  FractionDate, Year, Actor1Geo_CountryCode, IsRootEvent, GoldsteinScale, NumMentions, NumSources, ActionGeo_Lat, ActionGeo_Long, EventCode, SOURCEURL FROM gdelt WHERE EventCode like \'2%\' OR EventCode like \'19%\' AND ActionGeo_Lat != \'\' and ActionGeo_Long != \'\';')

with open('results.csv', 'wb') as csvfile:
        filewriter = csv.writer(csvfile, delimiter=';', quotechar='|', quoting=csv.QUOTE_MINIMAL)
        filewriter.writerow(['GlobalEventID','Actor1CountryCode', 'Actor1KnownGroupCode,', 'Actor1Religion1Code','FractionDate','Year','Actor1Geo_CountryCode','IsRootEvent','GoldsteinScale','NumMentions', 'NumSources','lat', 'long', 'EventCode','SOURCEURL'])
        for y in x:
            filewriter.writerow([y[0],y[1],y[2],y[3],y[4],y[5],y[6],y[7],y[8],y[9],y[10],y[11],y[12],y[13],y[14]])
