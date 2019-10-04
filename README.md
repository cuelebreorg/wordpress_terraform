![alt text](https://raw.github.com/cuelebreorg/wordpress_terraform/blob/master/diagram.png)


Create an IAM user with sufficient rights to create the resources. 

Download and install aws cli.

Download and install terraform.

Run aws configure --profile "profilename"

Update profile name and zone in aws.tf 

Create keypair in aws console and update name in scaling.tf

Run terraform plan

Run terraform apply

Use one instance for languaje configuration (ELB will be unhealty)

To destroy run teraform destroy
