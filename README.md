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
Note : 
  For Iran internet issue we can use [docker. ir ](docker.ir)and [iranrepo](iranrepo.ir) or other internal repository for pull this image because localstack is a huge size ~(2G)


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

## AWS CLI pointing to endpoint 

```
aws --endpoint-url=http://localhost:4566 s3api create-bucket --bucket my-bucket --region eu-central-1
```

## Get List of EC2 instances

```
aws --endpoint-url=http://localhost:4566 ec2 describe-instances --query 'Reservations[].Instances[].[InstanceId,InstanceType,PublicIpAddress,Tags[?Key==`Name`]| [0].Value]' --output table --region eu-central-1
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