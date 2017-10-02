# coding: utf-8

from clickhouse_driver.client import Client
import csv

client = Client('172.17.0.2')
print(client.execute('SHOW TABLES'))

#x = client.execute('SELECT ActionGeo_Lat, ActionGeo_Long FROM gdelt WHERE Actor1Code = \'NGOHLHIRC\' ORDER BY EventCode DESC')
x = client.execute('SELECT ActionGeo_Lat, ActionGeo_Long, EventCode FROM gdelt WHERE Actor1Code = \'NGOHLHIRC\' and ActionGeo_Lat != \'\' and ActionGeo_Long != \'\'')
with open('results.csv', 'wb') as csvfile:
        filewriter = csv.writer(csvfile, delimiter=';', quotechar='|', quoting=csv.QUOTE_MINIMAL)
        filewriter.writerow(['lat', 'long', 'EventCode'])
        for y in x:
            filewriter.writerow([y[0],y[1],y[2]])
