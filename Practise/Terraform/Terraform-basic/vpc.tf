resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "maxtsymabliuk-vpc"
  }
}

resource "aws_subnet" "public" {

  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"

  
  tags = {
    Name = "maxtsymbaliuk-public-subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id     = aws_vpc.main.id

  tags = {
    Name = "maxtsymbaliuk-gw"
  }
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "maxtsymbaliuk-rt"
  }
}
