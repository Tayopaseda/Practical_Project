#!/bin/bash

#source for env variables
source ~/.bash_profile

#substitute variables for values from env variables
sed -i "s/test-vm/$testIP/g" ./ansible/inventory.yaml 
sed -i "s/{{password}}/$dockerPassword/g" ./ansible/run-tests/tasks/main.yml
sed -i "s/{{username}}/$dockerUsername/g" ./ansible/run-tests/tasks/main.yml

#run ansible playbook
cd ./ansible
ansible-playbook -i inventory.yaml playbook.yaml
cd ..

#display test results
ssh -i ~/.ssh/id_rsa ubuntu@$testIP cat backend-tests.txt && cat frontend-tests.txt

#substitute variables in ansible directory back
sed -i "s/$testIP/test-vm/g" ./ansible/inventory.yaml 
sed -i "s/$dockerPassword/{{password}}/g" ./ansible/run-tests/tasks/main.yml
sed -i "s/$dockerUsername/{{username}}/g" ./ansible/run-tests/tasks/main.yml



echo "destroying architecture"
sudo sed -i "s/{username}/$dbUser/g" ./Terraform/rds/variables.tf
sudo sed -i "s/{password}/$dbPassword/g" ./Terraform/rds/variables.tf

cd ./Terraform

terraform destroy -auto-approve
cd ..
sudo sed -i "s/$dbUser/{username}/g" ./Terraform/rds/variables.tf
sudo sed -i "s/$dbPassword/{password}/g" ./Terraform/rds/variables.tf
