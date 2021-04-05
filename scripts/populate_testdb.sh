#!/bin/bash

source ~/.bash_profile

ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa ubuntu@$testIP << EOF
sudo apt update -y
sudo apt install mysql-client-core-8.0 -y 
EOF

ssh -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa ubuntu@$testIP mysql -h {{endpoint-address}} -P 3306 -u {{user}} -p{{password}} << EOF
USE testdb;
DROP TABLE IF EXISTS users;
CREATE TABLE users (userName varchar(30) NOT NULL);
INSERT INTO users VALUES ('Bob'),('Jay'),('Matt'),('Ferg'),('Mo');
EOF

