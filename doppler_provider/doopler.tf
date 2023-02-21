# Install the Doppler provider
terraform {
  required_providers {
    doppler = {
      source = "DopplerHQ/doppler"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Define a variable so we can pass in your token
variable "doppler_token" {
  type = string
  description = "A token to authenticate with Doppler"
}

# Configure the Doppler provider with the token
provider "doppler" {
  doppler_token = var.doppler_token
}

# Define the data source to fetch secrets
data "doppler_secrets" "this" {}

# Access the secrets
resource "aws_db_instance" "books_service" {
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name              = "books_service"
  username             = data.doppler_secrets.this.map.DB_USERNAME
  password             = data.doppler_secrets.this.map.DB_PASSWORD
}
