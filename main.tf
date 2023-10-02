provider "aws" {
    region = "ap-south-1"
  
}

module "vpc-ec2" {

    source = "./module_vpc-ec2"
    cidr_block_value = "10.0.0.0/16"
    ami_value = "ami-067c21fb1979f0b27"
    instance_type_value = "t2.micro"
  
}
