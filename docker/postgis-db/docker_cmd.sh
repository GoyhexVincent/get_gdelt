echo ' Every commands needed to create image + create container'
echo ' Username postgres psswd postgres dbname gdelt_db , if you want to change any of them check the init-database.sh file'

rm -rf ../data
mkdir ../data

img_name='get_gdelt'
cont_name='gdelt_db'
docker build -t $img_name .

docker rm -f $cont_name
docker run --name $cont_name -e POSTGRES_PASSWORD=postgres -d -v  $PWD/../data:/var/lib/postgresql/data $img_name

until docker run --rm --link $cont_name:pg get_gdelt pg_isready -U redpig -h pg; do sleep 5; done

echo 'Database created!'
