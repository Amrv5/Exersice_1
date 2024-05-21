# Create Elastic IP for Bastion Host

resource "aws_eip" "bastion_eip" {
  depends_on = [ module.ec2_public, module.vpc ]
  
#instance id associated to the elastic ip address 
  instance = module.ec2_public.id

}
