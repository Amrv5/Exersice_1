# AWS EC2 Instance Terraform Module
# EC2 Instances that will be created in VPC Private Subnets
module "ec2_private" {
  depends_on = [ module.vpc ]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~>5.6.0"
  # required variables here
  name                   = "vm"
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  aws_iam_instance_profile= var.instance_profile_ec2

#The security group id that will be associated to the private ec2

vpc_security_group_ids = [module.private_sg.security_group_id]

}