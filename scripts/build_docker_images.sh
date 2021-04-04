#! /bin/bash

echo "building docker images"
cd ..
source ~/.bash_profile
#substitute in env variables for image
sed -i "s/{{db-user}}/$dbUser/g"  ./backend/Dockerfile
sed -i "s/{{db-password}}/$dbPassword/g" ./backend/Dockerfile
sed -i "s/{{db-uri}}/$testEndpoint/g" ./backend/Dockerfile
sed -i "s/{{secret-key}}/$secretKey/g"" ./backend/Dockerfile

echo "building backend image"
cd ./backend
docker build -t backend:latest .

echo "building frontend image"
cd ..
cd ./frontend
docker build -t frontend:latest .
cd..

#push images to docker hub
echo "pushing images to dockerhub"
echo $dockerPassword | docker login --username=$dockerUsername --password-stdin
docker tag backend:latest tayop/backend:latest
docker tag frontend:latest tayop/frontend:latest
docker push tayop/backend:latest
docker push tayop/frontend:latest

echo "deleting images from jenkins system"
docker rmi backend:latest frontend:latest tayop/frontend:latest tayop/backend:latest
docker system prune -a -f
 
#substitute everything back
sed -i "s/$dbUser/{{db-user}}/g"  ./backend/Dockerfile
sed -i "s/$dbPassword/{{db-password}}/g" ./backend/Dockerfile
sed -i "s/$testEndpoint/{{db-uri}}/g" ./backend/Dockerfile
sed -i "s/$secretKey/{{secret-key}}/g"" ./backend/Dockerfile
