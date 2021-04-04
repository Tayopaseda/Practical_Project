#! /bin/bash

echo "building infrastructure"
sed "s/{username}/$dbUser/g" ./Terraform/rds/variables.tf
sed "s/{password}/$dbPassword/g" ./Terraform/rds/variables.tf

cd ./Terraform
terraform destroy -auto-approve
terraform init
terraform plan
terraform apply -auto-approve

cat > ~/.bash_profile << EOF
export testIP=$(terraform output -raw test-vm-public-ip)
export testEndpoint=$(terraform output -raw test-db-endpoint)
EOF

#substitute variables back
cd ..
sed "s/$dbUser/{username}/g" ./Terraform/rds/variables.tf
sed "s/$dbPassword/{password}/g" ./Terraform/rds/variables.tf
