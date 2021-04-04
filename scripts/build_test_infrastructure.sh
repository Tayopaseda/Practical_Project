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
EOF

#substitute variables back
cd ..
sudo sed -i "s/$dbUser/{username}/g" ./Terraform/rds/variables.tf
sudo sed -i "s/$dbPassword/{password}/g" ./Terraform/rds/variables.tf
