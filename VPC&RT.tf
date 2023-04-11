# VPC creation
resource "aws_vpc" "card-app-vpc" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "card-app-vpc"
  }
}

# subnet creation
resource "aws_subnet" "card-app-SN-1a" {
  vpc_id     = aws_vpc.card-app-vpc.id
  cidr_block = "10.10.0.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1a"

  tags = {
    Name = "card-app-SN-1a"
  }
}

resource "aws_subnet" "card-app-SN-1b" {
  vpc_id     = aws_vpc.card-app-vpc.id
  cidr_block = "10.10.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1b"

  tags = {
    Name = "card-app-SN-1b"
  }
}

resource "aws_subnet" "card-app-SN-1c" {
  vpc_id     = aws_vpc.card-app-vpc.id
  cidr_block = "10.10.2.0/24"
  availability_zone = "ap-south-1a"
  
  tags = {
    Name = "card-app-SN-1c"
  }
}

resource "aws_subnet" "card-app-SN-1d" {
  vpc_id     = aws_vpc.card-app-vpc.id
  cidr_block = "10.10.3.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "card-app-SN-1d"
  }
}

# internet gateway
resource "aws_internet_gateway" "card-app-IG" {
  vpc_id = aws_vpc.card-app-vpc.id

  tags = {
    Name = "card-app-IG"
  }
}

# creating route table
resource "aws_route_table" "card-app-RT" {
  vpc_id = aws_vpc.card-app-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.card-app-IG.id
  }

  tags = {
    Name = "card-app-RT"
  }
}

# Route Table association
resource "aws_route_table_association" "card-app-asso-01" {
  subnet_id      = aws_subnet.card-app-SN-1a.id
  route_table_id = aws_route_table.card-app-RT.id
}


resource "aws_route_table_association" "webapp-RT-asso-02" {
  subnet_id      = aws_subnet.card-app-SN-1b.id
  route_table_id = aws_route_table.card-app-RT.id
}
