#! /bin/bash

source ~/.bash_profile 

sed -i "s/{{endpoint-address}}/$testEndpointAddress/g" ./scripts/populate_testdb.sh 
sed -i "s/{{user}}/$dbUser/g" ./scripts/populate_testdb.sh 
sed -i "s/{{password}}/$dbPassword/g" ./scripts/populate_testdb.sh
