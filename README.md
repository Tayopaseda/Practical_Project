# QAC SFIA2 Project

The project required me to deploy a simple flask application following the guidelines below.

## Brief

The requirements are:

- The application must be deployed to a **Virtual Machine for testing**
- The application must be deployed in a **managed Kubernetes Cluster for production**
- A **Jira board** with full expansion on tasks needed to complete the project.
- The application must be deployed using containerisation and orchestration tools.
- The application must be tested through the **CI pipeline**.
- The project must make use of **two managed Database Servers**: 1 for Testing and 1 for Production.
- If a change is made to the code base, **Webhooks** should be used so that Jenkins recreates and redeploys the changed application.
- The infrastructure for the project should be configured using an **infrastructure management tool** (Infrastructure as Code).
- As part of the project, you need to create an **Ansible** Playbook that will provision the environment that your CI Server needs to run.
- The project must make use of a **reverse proxy** to make your application accessible to the user.

## Application

The application is a Flask application running in **2 micro-services** (*frontend* and *backend*).


The application works by:
1. The frontend service making a GET request to the backend service.
2. The backend service using a database connection to query the database and return a result.
3. The frontend service serving up a simple HTML (`index.html`) to display the result.

## Technology stack

The technologies used are:

- Kanban Board: **Jira**
- CI Server: **Jenkins**
- Configuration Management: **Ansible**
- Cloud Server: **AWS EC2**
- Database Server: **AWS RDS**
- Containerisation: **Docker**
- Reverse Proxy: **NGINX**
- Orchestration Tool: **Kubernetes**
- Infrastructure Management: **Terraform**

## Project planning
![Jira board](https://drive.google.com/uc?export=view&id=1Vw-vOetX_UGflL8boXCdA_YHxqNhttYv)

## Infrastructure

![Infrastructure creation](https://drive.google.com/uc?export=view&id=1zMHWnn_zo5_WUUgZRpHE7ncEw9L7MflT)
- I used a 'set up' virtual machine to work from.
- I used Terraform to provision my Jenkins VM (this vm only allows ssh access from the set up vm).
- I then used ansible to install Jenkins, Terraform, Ansible, AWS CLI, EKS CLI and Kubernetes CLI on my Terraform provisioned Jenkins VM.
- On the Jenkins vm, I used Terraform to provision the test VM and 2 RDS databases needed for the application to be tested and deployed.
- Ansible is then used to configure the test vm.
- The cluster is then provisioned from the Jenkins vm using EKS (Elastic Kubernetes Service)
- The whole process (aside from setting up Jenkins) is automated from the Jenkins VM using scripts and a Jenkins pipeline job.

![Infrastructure](https://drive.google.com/uc?export=view&id=1R1wjIMRNJPnnZPGo0tpjtb1c0chBpssP)
- The test VM only allows inbound ssh traffic from the Jenkins vm and allows all outbound traffic.
- The test database only allows inbound traffic on port 3306 (mysql) from the test vm.
- The production database only allows inbound traffic on port 3306 from the test vm and eks cluster.
- The RDS databases are in a provate subnet group, so cannot communicate with any machines outside the VPC.
- The test vm and kubernetes cluster are in public subnets, i.e they are associated with a route table that contains an internet gateway. This is because they need to commnicate with machines outside the VPC.
- The kubernetes cluster is open to the internet, as this is where the application is hosted so users need to be able to access it.

## Testing
- Backend Tests
![test results](https://drive.google.com/uc?export=view&id=18WMUeEoFikjY5VL5IisoLjoh9kPMeowH)
- Frontend Tests
![test results](https://drive.google.com/uc?export=view&id=1lmwQhXlsOboY81A5cF5wcGuHwnnY5Fdb)

 - Unit tests were added for the backend and Integration tests for the frontend. 
- Both tests pass and provide 100% coverage.

## Risk Assessment

![risk assessment](https://drive.google.com/uc?export=view&id=1XM0JDKRQs9qysliKff_lcXS1S6XAtMZ3)

## Author
Tayo Paseda
