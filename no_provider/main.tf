# Include the AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Define db_username and  db_password variables
variable "db_username" {
  description = "username for the database"
  type        = string
  default     = "mysql"
  sensitive   = true
}

variable "db_password" {
  description = "password for the database"
  type        = string
  sensitive   = true
}

# Create an aws_db_instance resource 
# using db_username and db_password variable
resource "aws_db_instance" "books_service" {
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name                 = "books_service"
  username = var.db_username
  password = var.db_password
}