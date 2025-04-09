resource "aws_vpc" "main" {
  cidr_block = var.vpc.cidr_block
  enable_dns_support = var.vpc.dns_support
  enable_dns_hostnames = var.vpc.dns_hostnames

   tags = local.common_tags
}


resource "aws_subnet" "sn1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet[0].cidr_block
  availability_zone = var.subnet[0].az
  map_public_ip_on_launch = var.subnet[0].public_ip

  tags = {
    Name = var.subnet[0].name
  }
}

resource "aws_subnet" "sn2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet[1].cidr_block
  availability_zone = var.subnet[1].az
  map_public_ip_on_launch = var.subnet[1].public_ip

  tags = {
    Name = var.subnet[1].name
  }
}

resource "aws_subnet" "sn3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet[2].cidr_block
  availability_zone = var.subnet[2].az
  map_public_ip_on_launch = var.subnet[2].public_ip

  tags = {
    Name = var.subnet[2].name
  }
}

resource "aws_subnet" "sn4" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet[3].cidr_block
  availability_zone = var.subnet[3].az
  map_public_ip_on_launch = var.subnet[3].public_ip

  tags = {
    Name = var.subnet[3].name
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.rt[0]
  }
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.rt[1]
  }
}

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.sn1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.sn2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.sn3.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.sn4.id
  route_table_id = aws_route_table.private.id
}