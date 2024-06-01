resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = local.tags
}

resource "aws_subnet" "public" {

  count      = var.size
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.${count.index*2}.0/23"
  availability_zone = local.az_list[count.index]

  
  tags = local.tags
}

resource "aws_internet_gateway" "gw" {
  vpc_id     = aws_vpc.main.id

  tags = local.tags
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = local.tags
}

resource "aws_route_table_association" "public" {
  count          = var.size
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

