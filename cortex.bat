docker volume create --name=cortex00
docker-compose pull
docker-compose down
docker-compose up -d
cmd /k docker-compose exec cortex /bin/bash
