module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  monitoring             = false
  vpc_security_group_ids = ["sg-06f76a53f08a418d4"]
  subnet_id              = "subnet-0bfb6070cab586136"

  tags = {
    Terraform  = "true"
    Enviroment = "dev"
    Name       = "Teste pipeline"
  }
}

terraform {
  backend "s3" {
    bucket = "teste-repo-fullcycleteste-repo-ian-fullcycle"
    key    = "teste"
    region = "us-east-1"
  }
}