# minikube-tomcat-nginx
The project aim to demonstrate how to deploy tomcat and nginx servidor to kubernetes running on minikube. 

Tomcat is running on k8s node port 8090. A demo application was deployed on /sample context.

Nginx is running on k8s node port 8080.

## Requirements
The minikube and kubect must be installed previously.

## How to execute using bash script

- Clone the git repository:

`
git clone https://github.com/xjulio/minikube-tomcat-nginx.git
`

- Enter the repository directory and execute the run.sh script

`
cd minikube-tomcat-nginx && sh build-and-deploy.sh
`

if the minikube is not running, then the script will start.

This proccess will build the tomcat and nginx Docker images using Dockerfile manifest in **docker** directory and create deployment/services into k8s using kubectl command.

## How to execute using terraform
The deployment can be done using terraform. Before execute terraform **plan** or **apply** commands, the docker images must be build, for this execute the **build.sh** script:

`
sh build.sh
`

Enter on terraform directory (assuming that you are in docker directory) and execute terraform **plan/apply** commands:

`
cd terraform
`

To verify if everything it's OK:

`
terraform plan
`

To create resources on k8s:
`
terraform apply
`

## Testing
The tomcat and nginx was deployed on k8s using the **hostPort**, for this we must find the IP address of minikube node executing the following command:

`
minikube ip
`

The previous command will return the minikube IP, then open a browser and use the folling urls:

Nginx: http://MINIKUBE_IP:8080

Tomcat: http://MINIKUBE_IP:8090 and http://MINIKUBE_IP:8090/sample

