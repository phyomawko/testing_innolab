resource "aws_security_group" "security_group_for_alb" {
  name        = "Security Group For PGW ALB"
  description = "Allow http access from everywhere"
  vpc_id      = aws_vpc.AYAInnovationLabs.id

  tags = {
    Name = "Security Group For PGW Application Load Balancer"
  }
  ingress  {
    from_port=80
    to_port=80
    protocol="tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}




resource "aws_security_group" "security_group_for_ec2" {
  name        = "Security Group For PGW Instances"
  description = "Allow http access from load balancer"
  vpc_id      = aws_vpc.AYAInnovationLabs.id

  tags = {
    Name = "Security Group For PGW Instances"
  }
  ingress  {
    from_port=80
    to_port=80
    protocol="tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress  {
    from_port=22
    to_port=22
    protocol="tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}