#! /bin/bash

source ~/.bash_profile

sed -i "s/{{vpc-id}}/$vpcID/g" ./kubernetes/cluster.yaml
sed -i "s/{{subnet-1}}/$subnet1/g" ./kubernetes/cluster.yaml
sed -i "s/{{subnet-2}}/$subnet2/g" ./kubernetes/cluster.yaml
sed -i "s/{{subnet-3}}/$subnet3/g" ./kubernetes/cluster.yaml


cd ./kubernetes
eksctl create cluster -f cluster.yaml


