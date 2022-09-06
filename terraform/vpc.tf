### Network Block ###
## Define our VPC
resource "aws_vpc" "main" {
  cidr_block = "172.17.0.0/16"
  enable_dns_hostnames = true
}

## Define the public subnet
resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id
  cidr_block = "172.17.1.0/24"
  availability_zone = "ap-south-1a"
}

## Define the internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

## Define the route table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

## Assign the route table to the public Subnet
resource "aws_route_table_association" "public-rt" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public-rt.id
}
