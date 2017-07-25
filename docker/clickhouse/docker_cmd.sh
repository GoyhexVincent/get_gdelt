echo ' Every commands needed to pull image + create container for clickhouse'

img_name='yandex/clickhouse-server'
cont_name='gdelt_clickhouse'
docker pull yandex/clickhouse-server

docker rm -f $cont_name
docker run -d --name $cont_name --ulimit nofile=262144:262144 $img_name

echo 'Database created!'
