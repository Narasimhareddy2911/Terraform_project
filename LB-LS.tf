# Target group
resource "aws_lb_target_group" "card-app-TG" {
  name        = "card-app-TG"
  port        = 80
  protocol    = "HTTP"
# target_type = "ip"
  vpc_id      = aws_vpc.card-app-vpc.id
}

# Load balancer listner

resource "aws_lb_listener" "card-app-listner" {
  load_balancer_arn = aws_lb.card-app-LB.arn
  port              = "80"
  protocol          = "HTTP"
 
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.card-app-TG.arn
  }
}

# Load balancer

resource "aws_lb" "card-app-LB" {

  name               = "card-app-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_SG.id]
  subnets            = [aws_subnet.card-app-SN-1a.id,aws_subnet.card-app-SN-1b.id]

  tags = {
    Environment = "production"
  }
}
