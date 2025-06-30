output "VPCID" {
  value = aws_vpc.myVPC.id
}

output "publicSubnetID" {
  value = aws_subnet.publicSubnet1.id 
}