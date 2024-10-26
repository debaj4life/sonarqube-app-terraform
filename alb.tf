# Application Load balancer

resource "aws_lb" "sonarqube_lb" {
    name = "sonarqube-lb"
    internal = false
    load_balancer_type = "application"
    security_groups = [ aws_security_group.sonarqube_lb_sg.id ]
    subnets = var.subnet_ranges

}



resource "aws_alb_target_group" "sonarqube_alb_tg" {
  name = "sonarqube-alb-tg"
  target_type = "instance"
  protocol = "HTTP"
  port = 9000
  vpc_id = var.vpc_id
  health_check {
    healthy_threshold = 5
    unhealthy_threshold = 2
    timeout = 5
    interval = 30
    port = 9000
    path = "/"
    

  }



}



resource "aws_lb_listener" "sonarqube_lb_listener" {
  load_balancer_arn = aws_lb.sonarqube_lb.arn
  protocol = "HTTPS"
  port = 443
  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.sonarqube_alb_tg.arn
  }
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.sonarqube_acm_certificate.arn
}







resource "aws_alb_target_group_attachment" "sonarqube_alb_tg_attach" {
target_group_arn =  aws_alb_target_group.sonarqube_alb_tg.arn
target_id = aws_instance.sonarqube-app.id
port = 9000
}
