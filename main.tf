provider "aws" {
    region = var.aws_region
}

terraform {
    backend "s3" {
        bucket = "prof"
        region = "us-east-1"
        key    = "awsEC2.tfstate"
    }
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
