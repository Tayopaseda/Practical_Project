#! /bin/bash

echo "building infrastructure"
sudo sed -i "s/{username}/$dbUser/g" ./Terraform/rds/variables.tf
sudo sed -i "s/{password}/$dbPassword/g" ./Terraform/rds/variables.tf
sudo sed -i "s/{public-key}/$publicKey/g" ./Terraform/ec2/variables.tf

cd ./Terraform
terraform init
terraform plan
terraform apply -auto-approve

cat > ~/.bash_profile << EOF
export testIP=$(terraform output -raw test-vm-public-ip)
export testEndpoint=$(terraform output -raw test-db-endpoint)
EOF

echo $testIP
echo $testEndpoint

terraform destroy -auto-approve

#substitute variables back
cd ..
sudo sed -i "s/$dbUser/{username}/g" ./Terraform/rds/variables.tf
sudo sed -i "s/$dbPassword/{password}/g" ./Terraform/rds/variables.tf
sudo sed -i "s/$publicKey/{public-key}/g" ./Terraform/ec2/variables.tf
