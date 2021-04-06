#! /bin/bash

source ~/.bash_profile

sed -i "s/{{vpc-id}}/$vpcID/g" ./kubernetes/cluster.yaml
sed -i "s/{{subnet-1}}/$subnet1/g" ./kubernetes/cluster.yaml
sed -i "s/{{subnet-2}}/$subnet2/g" ./kubernetes/cluster.yaml
sed -i "s/{{subnet-3}}/$subnet3/g" ./kubernetes/cluster.yaml


cd ./kubernetes
eksctl create cluster -f cluster.yaml

#delete cluster
eksctl delete cluster -n app-cluster

cd ..

echo "destroying architecture"
sudo sed -i "s/{username}/$dbUser/g" ./Terraform/rds/variables.tf
sudo sed -i "s/{password}/$dbPassword/g" ./Terraform/rds/variables.tf

cd ./Terraform

terraform destroy -auto-approve
cd ..
sudo sed -i "s/$dbUser/{username}/g" ./Terraform/rds/variables.tf
sudo sed -i "s/$dbPassword/{password}/g" ./Terraform/rds/variables.tf
