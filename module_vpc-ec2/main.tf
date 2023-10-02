provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_vpc" "assignment_vpc" {
    
    cidr_block = "1.0.0.0/16"
    
    tags = {
        Name = "assignment_vpc"
    }
  
}
resource "aws_internet_gateway" "assignment-igw" {

    vpc_id = aws_vpc.assignment_vpc.id
     tags = {
        Name = "assignment_igw"
    }
  
}
resource "aws_subnet" "public_subnet" {

    vpc_id = aws_vpc.assignment_vpc.id
    cidr_block = "1.0.1.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = true
     tags = {
        Name = "assignment_public-sn"
    }

}
resource "aws_subnet" "private_subnet" {
    
    vpc_id = aws_vpc.assignment_vpc.id
    cidr_block = "1.0.2.0/24"
    availability_zone = "ap-south-1b"
    
    tags = {
        Name = "assignment_private-sn"
    }

}
resource "aws_route_table" "assignment-rt" {

    vpc_id = aws_vpc.assignment_vpc.id

    route {
        cidr_block="0.0.0.0/0"
        gateway_id = aws_internet_gateway.assignment-igw.id
    }

    tags = {
        Name = "assignment_rt"
    }
  
}
resource "aws_route_table_association" "assignment-rt" {
    route_table_id = aws_route_table.assignment-rt.id
    subnet_id = aws_subnet.public_subnet.id
  
}
resource "aws_security_group" "assignment-sg" {

    vpc_id = aws_vpc.assignment_vpc.id
    
    ingress {
        description = "ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }
    tags = {
        Name = "assignment_sg"
    }
  
}
resource "aws_instance" "assignment" {

    ami = var.ami_value
    instance_type = var.instance_type_value
    
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.assignment-sg.id]
    tags = {
      "purpose" = "assignment"
      Name="assignment"
    }
}