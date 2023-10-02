# Assignment 1 

Terraform script for the creation of vpc infrastructure with public and private subnet.
Created a module named module_vpc-ec2.In the module created a Terraform configuration file main.tf.In this file i defined provider and resources that i want to create.
The variables.tf file is created for defining input variables that is used in configuration file .
Created another main.tf file outside the module and passed the values for input variable.


Below attched is the output screenshot of vpc creation and routetable.
<img width="959" alt="vpc" src="https://github.com/Divya-kuruba/Assignment/assets/144769241/d8539ff0-d145-43ee-aff0-2589714fb24c">
<img width="959" alt="route_table association" src="https://github.com/Divya-kuruba/Assignment/assets/144769241/ce2bd6d2-75d8-41b1-8626-8c30e930afa4">

Creation of EC2 instance in the above created vpc and in public subnet 
<img width="960" alt="ec2-instance" src="https://github.com/Divya-kuruba/Assignment/assets/144769241/8168467f-e38c-42eb-99f3-1720a1f660e0">

