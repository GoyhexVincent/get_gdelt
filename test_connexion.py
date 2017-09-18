# coding: utf-8

from clickhouse_driver.client import Client
import io
import json

client = Client('172.17.0.5')
print(client.execute('SHOW TABLES'))

x = client.execute('SELECT ActionGeo_Lat, ActionGeo_Long FROM gdelt WHERE Actor1Code = \'NGOHLHIRC\' ORDER BY EventCode DESC')

rs = json.dumps(dict(x))
