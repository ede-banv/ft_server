docker container rm kyle
docker build . -t test:1
docker run -p 80:80 -p 443:443 --name kyle test:1

#docker exec -it bob bash