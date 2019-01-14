#!/bin/bash

DIR=$(pwd)

minikube status > /dev/null 2>&1

if [ $? -ne 0 ]; then
	minikube start
fi

# Change docker context to connect docker client to minikube docker server
eval $(minikube docker-env)

cd $DIR/docker
#Build Tomcat custom image
docker image build -t tomcat:8.5-assignment1 . -f tomcat.Dockerfile

#Build Nginx custom image
docker image build -t nginx:assignment1 . -f nginx.Dockerfile

cd $DIR
# create tomcat deployment and service
kubectl apply -f services/tomcat.yml

# create nginx deployment and service
kubectl apply -f services/nginx.yml