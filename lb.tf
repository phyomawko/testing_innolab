resource "aws_lb" "pgw_lb" {
  name               = "PGW-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security_group_for_alb.id]
  subnets            = [aws_subnet.pgw-subnet.id,aws_subnet.pgw-subnet2.id]

  enable_deletion_protection = false

  

  tags = {
    Name="Load Balancer for PGW Access"
  }
}




resource "aws_lb_target_group" "pgw-target-group" {
  name     = "PGW-Target-Group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.AYAInnovationLabs.id
  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}



resource "aws_lb_target_group_attachment" "target-group-attach" {
  target_group_arn = aws_lb_target_group.pgw-target-group.arn
  target_id        = aws_instance.pgw-app-1.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "target-group-attach2" {
  target_group_arn = aws_lb_target_group.pgw-target-group.arn
  target_id        = aws_instance.pgw-app-2.id
  port             = 80
}

resource "aws_lb_listener" "listener_pgw" {
  load_balancer_arn = aws_lb.pgw_lb.arn
  port              = "80"
  protocol          = "HTTP"
  

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.pgw-target-group.arn
  }
}