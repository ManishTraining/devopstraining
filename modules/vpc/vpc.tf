#What will happen if you delete the state file ?

resource "aws_vpc" "myVPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = var.VPCName
  }
}

resource "aws_subnet" "publicSubnet1" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.myVPC.id
  availability_zone = "ap-south-1a"
  tags = {
    Name = var.PublicSubentName
  }
  depends_on = [ aws_vpc.myVPC ]
}

resource "aws_route_table" "publicRouteTable" {
    vpc_id = aws_vpc.myVPC.id
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internetGateway.id
  }

    tags = {
    Name = var.PublicRouteTableName
     }
     depends_on = [ aws_vpc.myVPC ]
}

resource "aws_route_table_association" "RouteTableAssociation" {
  route_table_id = aws_route_table.publicRouteTable.id
  subnet_id = aws_subnet.publicSubnet1.id
}

resource "aws_internet_gateway" "internetGateway" {
  vpc_id = aws_vpc.myVPC.id
  tags = {
    Name = var.IGWName
  }
  depends_on = [ aws_vpc.myVPC ]
}