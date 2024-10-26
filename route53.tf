resource "aws_route53_record" "sonarqube_route53_A_record"  {
  zone_id = "Z01752471FYWFTVEJ68WX"
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = aws_lb.sonarqube_lb.dns_name
    zone_id                = aws_lb.sonarqube_lb.zone_id
    evaluate_target_health = true
  }
  
}
