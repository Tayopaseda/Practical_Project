#! /bin/bash

echo "building docker images"

source ~/.bash_profile
#substitute in env variables for image
sed -i "s/{{db-user}}/$dbUser/g"  ./backend/Dockerfile
sed -i "s/{{db-password}}/$dbPassword/g" ./backend/Dockerfile
sed -i "s/{{test-db-uri}}/$testEndpoint/g" ./backend/Dockerfile
sed -i "s/{{secret-key}}/$secretKey/g" ./backend/Dockerfile
sed -i "s/{{prod-db-uri}}/$prodEndpoint/g" ./backend/Dockerfile

echo "building backend image"
cd ./backend
sudo docker build -t backend:test .

echo "building frontend image"
cd ..
cd ./frontend
sudo docker build -t frontend:test .
cd ..

#push images to docker hub
echo "pushing images to dockerhub"
echo $dockerPassword | sudo docker login --username=$dockerUsername --password-stdin
sudo docker tag backend:test tayop/backend:test
sudo docker tag frontend:test tayop/frontend:test
sudo docker push tayop/backend:test
sudo docker push tayop/frontend:test

echo "deleting images from jenkins system"
sudo docker rmi backend:test frontend:test tayop/frontend:test tayop/backend:test
sudo docker system prune -a -f
 
#substitute everything back
sed -i "s/$dbUser/{{db-user}}/g"  ./backend/Dockerfile
sed -i "s/$dbPassword/{{db-password}}/g" ./backend/Dockerfile
sed -i "s/$testEndpoint/{{db-uri}}/g" ./backend/Dockerfile
sed -i "s/$secretKey/{{secret-key}}/g" ./backend/Dockerfile
sed -i "s/$prodEndpoint/{{prod-db-uri}}/g" ./backend/Dockerfile
