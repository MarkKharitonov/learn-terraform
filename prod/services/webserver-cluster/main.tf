provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket = "mark-kharitonov-terraform-up-and-running-state"
    key    = "prod/services/webserver-cluster/terraform.tfstate"
    region = "us-east-2"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}

module "webserver_cluster" {
  source        = "../../../modules/services/webserver-cluster"
  cluster_name  = "webservers-prod"
  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 10
}
