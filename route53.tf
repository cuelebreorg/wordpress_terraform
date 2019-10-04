resource "aws_route53_zone" "cuelebreorg" {
  name          = "cuelebre.org"
  force_destroy = true
}

resource "aws_route53_record" "www_cc" {
  zone_id = aws_route53_zone.cuelebreorg.zone_id
  name    = "www.cuelebre.org"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_elb.wordpress.dns_name]
}

resource "aws_route53_record" "apex" {
  zone_id = aws_route53_zone.cuelebreorg.zone_id
  name    = "cuelebre.org"
  type    = "A"

  alias {
    name                   = aws_elb.wordpress.dns_name
    zone_id                = aws_elb.wordpress.zone_id
    evaluate_target_health = "false"
  }
}

output "nameserver1" {
  value = aws_route53_zone.cuelebreorg.name_servers[0]
}

output "nameserver2" {
  value = aws_route53_zone.cuelebreorg.name_servers[1]
}

output "nameserver3" {
  value = aws_route53_zone.cuelebreorg.name_servers[2]
}

output "nameserver4" {
  value = aws_route53_zone.cuelebreorg.name_servers[3]
}

