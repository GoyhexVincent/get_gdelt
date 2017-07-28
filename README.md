
# GDELT_PROJECT:  Parse, analyze and map GDELT data

1. run ./install_for_clickhouse.sh on your terminal

2. go make yourself a coffee

(the intermediate CSV files are being removed as we insert them into the database, no need to tidy things up)


3. you're all set, you can request your database: try 
                                                   SELECT count(*) from gdelt;
                                                   DESCRIBE TABLE gdelt;

4. feel free to check out the gdelt data structure here: http://www.gdeltproject.org/data.html#documentation
   GDELT 1.0 Data Format Documentation & CAMEO Code Reference are both particularly pertinent.


5. Same goes for clickhouse documentation: https://clickhouse.yandex/docs/en/


6. If you quit and want to access your clickhouse db once again, here is the command: docker run -it --rm --link gdelt_clickhouse:clickhouse-server yandex/clickhouse-client --host clickhouse-server

Some usefull links: 
    https://hub.docker.com/r/yandex/clickhouse-server/
   



### SQL REQUESTS EXAMPLES:

##### Rape occurences in France:

`select EventCode, Actor1Geo_CountryCode, SOURCEURL from gdelt where EventCode = '1821' AND Actor1Geo_CountryCode = 'FR'` 
