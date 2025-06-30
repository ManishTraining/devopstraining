module "VPC" {
  source = "./modules/vpc"
}

module "EC2" {
  source = "./modules/ec2"
  VPCID = module.VPC.VPCID
  publicSubnetID = module.VPC.publicSubnetID
  depends_on = [ module.VPC ]
}