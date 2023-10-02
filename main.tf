provider "aws" {
    region = "ap-south-1"
    # region where to create the infrastructure
}

module "vpc-ec2" {

    source = "./module_vpc-ec2"  # give path of the module
    cidr_block_value = "10.0.0.0/16" # provide ip range for vpc
    ami_value = "ami-067c21fb1979f0b27"  # provide appropriate ami id
    instance_type_value = "t2.micro" # provide type of instance to be created
  
}
