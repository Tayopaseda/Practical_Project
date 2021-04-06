#! /bin/bash

source ~/.bash_profile 

sed -i "s/{{endpoint-address}}/$prodEndpointAddress/g" ./ansible/populate-database/tasks/main.yml 
sed -i "s/{{user}}/$dbUser/g" ./ansible/populate-database/tasks/main.yml 
sed -i "s/{{password}}/$dbPassword/g" ./ansible/populate-database/tasks/main.yml 
