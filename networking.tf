resource "aws_vpc" "AYAInnovationLabs" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "AYA Innovation Labs"
    }
  
}

resource "aws_subnet" "pgw-subnet" {
    vpc_id = aws_vpc.AYAInnovationLabs.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-southeast-1a"
    map_public_ip_on_launch = true
    tags = {
        Name = "pgw-subnet"
    }
  
}

resource "aws_subnet" "pgw-subnet2" {
    vpc_id = aws_vpc.AYAInnovationLabs.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-southeast-1b"
    map_public_ip_on_launch = true
    tags = {
        Name = "pgw-subnet-2"
    }
  
}


resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.AYAInnovationLabs.id
    tags = {
      Name = "Internet Gateway for Innolabs"
    }
  
}

resource "aws_route_table" "inno_rt" {
  vpc_id = aws_vpc.AYAInnovationLabs.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "Inno Lab Route Table"
  }

}

resource "aws_route_table_association" "route_table_association" {
  subnet_id      = aws_subnet.pgw-subnet.id
  route_table_id = aws_route_table.inno_rt.id
}

resource "aws_route_table_association" "route_table_association2" {
  subnet_id      = aws_subnet.pgw-subnet2.id
  route_table_id = aws_route_table.inno_rt.id
}


