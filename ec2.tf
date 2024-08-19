resource "aws_instance" "pgw-app-1" {
  ami= "ami-0a6b545f62129c495"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.pgw-subnet.id
  availability_zone = "ap-southeast-1a"
  security_groups = [aws_security_group.security_group_for_ec2.id]
  tags = {
    Name= "PGW-App-1"
  }
  user_data = file("userdata.sh")
              
              
}

resource "aws_instance" "pgw-app-2" {
  ami= "ami-0a6b545f62129c495"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.pgw-subnet2.id
  availability_zone = "ap-southeast-1b"
  security_groups = [aws_security_group.security_group_for_ec2.id]
  tags = {
    Name= "PGW-App-2"
  }
  user_data = file("userdata2.sh")
              
}