variable "aws_profile" {
  type        = string
  description = "Name of the credentials profile to use when accessing AWS"
  default     = "default"
}

variable "aws_region" {
  type        = string
  description = "Code for the AWS region where the infrastructure will be deployed"
  default     = "us-east-1"
}

variable "cluster_name" {
  type        = string
  description = "The name of AWS ECS cluster"
}

variable "service_name" {
  type        = string
  description = "The name of the default service to be created"
}

variable "ecr_repo" {
  type        = string
  description = "URL for the docker image which will be used, hosted on ECR"
}

variable "domain" {
  type        = string
  description = "Domain name for ACM certificate"
}

variable "db_version" {
  type        = string
  description = "Engine version for MySQL"
}

variable "db_user" {
  type = string
  description = "Username to use to access the DB"
}

variable "db_password" {
  type = string
  description = "Password to use to access the DB"
}

variable "db_port" {
  type = number
  description = "Port on which the DB accepts connections"
}


variable "s3_tfstate_bucket" {
  type = string
  description = "Name of S3 bucket to store .tfstate backups on"
  default = "tw-tfstate-files"
}

variable "s3_backup_path" {
  type = string
  description = "Path inside of S3 bucket to store .tfstate backups on"
  default = "hv-test/terraform.tfstate"
}