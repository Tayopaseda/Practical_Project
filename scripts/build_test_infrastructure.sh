#! /bin/bash

echo "building infrastructure"
sudo sed -i "s/{username}/$dbUser/g" ./Terraform/rds/variables.tf
sudo sed -i "s/{password}/$dbPassword/g" ./Terraform/rds/variables.tf

cd ./Terraform
terraform init
terraform plan
terraform apply -auto-approve

cat > ~/.bash_profile << EOF
export testIP=$(terraform output -raw test-vm-public-ip)
export testEndpoint=$(terraform output -raw test-db-endpoint)
export testEndpointAddress=$(terraform output -raw test-db-address)
export prodEndpoint=$(terraform output -raw prod-db-endpoint)
export prodEndpointAddress=$(terraform output -raw prod-db-address)
export vpcID=$(terraform output -raw vpc-id)
export subnet1=$(terraform output -raw subnet-1)
export subnet2=$(terraform output -raw subnet-2)
export subnet3=$(terraform output -raw subnet-3)
EOF

#substitute variables back
cd ..
sudo sed -i "s/$dbUser/{username}/g" ./Terraform/rds/variables.tf
sudo sed -i "s/$dbPassword/{password}/g" ./Terraform/rds/variables.tf
