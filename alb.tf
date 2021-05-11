data "aws_acm_certificate" "hv_cert" {
  domain    = var.domain
  statuses  = [ "ISSUED" ]
}

resource "aws_alb" "main" {
  name            = "healthyvita-lb"
  # subnets         = aws_subnet.public.*.id
  subnets         = [aws_subnet.public_1[0].id, aws_subnet.public_2[0].id]
  security_groups = [aws_security_group.lb.id]
}

resource "aws_alb_listener" "redirect_https_listener" {
  load_balancer_arn = aws_alb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# Redirect all traffic from the ALB to the target groups
resource "aws_alb_listener" "https_listener" {
  load_balancer_arn = aws_alb.main.arn
  port              = 443
  protocol          = "HTTPS"
  certificate_arn   = data.aws_acm_certificate.hv_cert.arn

  default_action {
    target_group_arn = module.ecs_service_1.service_target_group
    type             = "forward"
  }

  depends_on = [ module.ecs_service_1.service_target_group ]
}
