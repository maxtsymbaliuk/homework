resource "aws_vpc" "maxtsymbaliuk-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = local.tags
}

resource "aws_subnet" "maxtsymbaliuk-subnet" {

  vpc_id     = aws_vpc.maxtsymbaliuk-vpc.id
  cidr_block = "10.0.0.0/24"

  
  tags = local.tags
}

resource "aws_internet_gateway" "maxtsymbaliuk-gw" {
  vpc_id     = aws_vpc.maxtsymbaliuk-vpc.id

  tags = local.tags
}


resource "aws_route_table" "maxtsymbaliuk-route-table" {
  vpc_id = aws_vpc.maxtsymbaliuk-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.maxtsymbaliuk-gw.id
  }

  tags = local.tags
}

resource "aws_route_table_association" "maxtsymbaliuk-association" {

  subnet_id      = aws_subnet.maxtsymbaliuk-subnet.id
  route_table_id = aws_route_table.maxtsymbaliuk-route-table.id
}

