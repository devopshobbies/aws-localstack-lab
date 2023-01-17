######### Terraform Provider #########

provider "aws" {
  region                      = "eu-central-1"
  access_key                  = "devopshobbies"
  secret_key                  = "devopshobbies"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true


  endpoints {
    apigateway     = "http://localhost:4566"
    apigatewayv2   = "http://localhost:4566"
    cloudformation = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
    ec2            = "http://localhost:4566"
    es             = "http://localhost:4566"
    elasticache    = "http://localhost:4566"
    firehose       = "http://localhost:4566"
    iam            = "http://localhost:4566"
    kinesis        = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    rds            = "http://localhost:4566"
    redshift       = "http://localhost:4566"
    route53        = "http://localhost:4566"
    s3             = "http://s3.localhost.localstack.cloud:4566"
    secretsmanager = "http://localhost:4566"
    ses            = "http://localhost:4566"
    sns            = "http://localhost:4566"
    sqs            = "http://localhost:4566"
    ssm            = "http://localhost:4566"
    stepfunctions  = "http://localhost:4566"
    sts            = "http://localhost:4566"

  }
}

######### DynamoDB #########

resource "aws_dynamodb_table" "  devopshobbies-dev-devops-consumer-events" {
  name           = "  devopshobbies-dev-devops-consumer-events"
  read_capacity  = "20"
  write_capacity = "20"
  hash_key       = "Id" 

  attribute {
    name = "Id" 
    type = "S"
  }
}

######### SNS Topic #########

resource "aws_sns_topic" "sns_topic" {
  name      =   "  devopshobbies-dev-devops-producer-events"
}

######### SQS Queue #########

resource "aws_sqs_queue" "queue" {
  name      =   "  devopshobbies-dev-devops-consumer-events"
}

######### SNS Subscription #########

resource "aws_sns_topic_subscription" "private_http_subscription" {
  topic_arn = aws_sns_topic.sns_topic.arn   
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.queue.arn 
  endpoint_auto_confirms = true
}

