#! /bin/bash

cd ./kubernetes

kubectl apply -f namespace.yaml
kubectl config set-context --current --namespace=production
kubectl apply -f nginx-config.yaml 
kubectl apply -f nginx-lb.yaml -f nginx.yaml -f backend.yaml -f backend-dep.yaml -f frontend.yaml -f frontend-dep.yaml 

kubectl rollout restart deployment backend
kubectl rollout restart deployment flask-app

sleep 3

kubectl get services nginx-lb
