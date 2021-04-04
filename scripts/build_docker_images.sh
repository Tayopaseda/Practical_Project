#! /bin/bash

echo "building docker images"

source ~/.bash_profile
#substitute in env variables for image
sed -i "s/{{db-user}}/$dbUser/g"  ./backend/Dockerfile
sed -i "s/{{db-password}}/$dbPassword/g" ./backend/Dockerfile
sed -i "s/{{db-uri}}/$testEndpoint/g" ./backend/Dockerfile
sed -i "s/{{secret-key}}/$secretKey/g" ./backend/Dockerfile

echo "building backend image"
cd ./backend
sudo docker build -t backend:latest .

echo "building frontend image"
cd ..
cd ./frontend
sudo docker build -t frontend:latest .
cd ..

#push images to docker hub
echo "pushing images to dockerhub"
echo $dockerPassword | docker login --username=$dockerUsername --password-stdin
sudo docker tag backend:latest tayop/backend:latest
sudo docker tag frontend:latest tayop/frontend:latest
sudo docker push tayop/backend:latest
sudo docker push tayop/frontend:latest

echo "deleting images from jenkins system"
sudo docker rmi backend:latest frontend:latest tayop/frontend:latest tayop/backend:latest
sudo docker system prune -a -f
 
#substitute everything back
sed -i "s/$dbUser/{{db-user}}/g"  ./backend/Dockerfile
sed -i "s/$dbPassword/{{db-password}}/g" ./backend/Dockerfile
sed -i "s/$testEndpoint/{{db-uri}}/g" ./backend/Dockerfile
sed -i "s/$secretKey/{{secret-key}}/g" ./backend/Dockerfile



echo "destroying architecture"
sudo sed -i "s/{username}/$dbUser/g" ./Terraform/rds/variables.tf
sudo sed -i "s/{password}/$dbPassword/g" ./Terraform/rds/variables.tf

cd ./Terraform

terraform destroy -auto-approve
cd ..
sudo sed -i "s/$dbUser/{username}/g" ./Terraform/rds/variables.tf
sudo sed -i "s/$dbPassword/{password}/g" ./Terraform/rds/variables.tf

