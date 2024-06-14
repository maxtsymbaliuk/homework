resource "aws_vpc" "maxtsymbaliuk_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "maxtsymbaliuk-vpc"
  }
}

resource "aws_subnet" "maxtsymbaliuk_subnet" {
  vpc_id            = aws_vpc.maxtsymbaliuk_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "maxtsymbaliuk-subnet"
  }
}

resource "aws_internet_gateway" "maxtsymbaliuk_igw" {
  vpc_id = aws_vpc.maxtsymbaliuk_vpc.id

  tags = {
    Name = "maxtsymbaliuk-igw"
  }
}

resource "aws_route_table" "maxtsymbaliuk_route_table" {
  vpc_id = aws_vpc.maxtsymbaliuk_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.maxtsymbaliuk_igw.id
  }

  tags = {
    Name = "maxtsymbaliuk-route-table"
  }
}

resource "aws_route_table_association" "maxtsymbaliuk_association" {
  subnet_id      = aws_subnet.maxtsymbaliuk_subnet.id
  route_table_id = aws_route_table.maxtsymbaliuk_route_table.id
}
