resource "aws_vpc" "vpc_eks" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "eks"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_eks.id
  tags = {
    Name = "eks"
  }
}

resource "aws_subnet" "subnet_eks" {
  count                   = 2
  vpc_id                  = aws_vpc.vpc_eks.id
  cidr_block              = cidrsubnet(aws_vpc.vpc_eks.cidr_block, 8, count.index)
  availability_zone       = element(["us-east-1b", "us-east-1c"], count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "eks_${count.index}"
  }
}

resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc_eks.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "eks"
  }
}

resource "aws_route_table_association" "rta" {
  count          = 2
  subnet_id      = aws_subnet.subnet_eks[count.index].id
  route_table_id = aws_route_table.rtb.id
}
