## Localstack Project
This repository contains a docker-compose file which brings up a localstack container with all services and the terraform main.tf code for test it you can modify these services for your test .
_____
## Bring up Services
First of all we need a OS where have below services for achive this you can use install.sh script to install whole services and dependencies then we are reday to run localstack 
_____

## Bring up local stack

```
docker-compose up -d
```

## Download Terraform AWS provider

```
terraform init
```

## See the deployment plan and accept it by typing yes

``` 
terraform plan
```

## Apply the plan and deploy the infrastructure

```
terraform apply --auto-approve
```
--------
## Dashboards 

Dynamodb admin
```
http://localhost:8001
```
localstack
```
http://localhost:4566
```
localstack health check
```
http://localhost:4566/health
```