FROM mdillon/postgis:9.5

COPY ./plpython/* /usr/share/postgresql/9.5/extension/

VOLUME /var/lib/postgresql/data
RUN chmod 1777 /var/run/postgresql
COPY ./init-database.sh /docker-entrypoint-initdb.d/init-database.sh

