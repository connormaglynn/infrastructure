resource "aws_route53_zone" "primary" {
  name = "connorglynn.com"
}

resource "aws_route53_record" "main" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "connorglynn.com"
  type    = "A"
  ttl     = "300"
  records = ["185.199.108.153", "185.199.109.153", "185.199.110.153", "185.199.111.153"]
}

resource "aws_route53_record" "google-site-verification" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "connorglynn.com"
  type    = "TXT"
  records = ["google-site-verification=Hih9PMtKjpHcKufTpVbknEdiUAIquqxMArSEvarxOJs"]
  ttl     = "900"
}


resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "www.connorglynn.com"
  type    = "CNAME"
  ttl     = "300"
  records = ["connormaglynn.github.io"]
}

resource "aws_route53_record" "blog" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "blog.connorglynn.com"
  type    = "CNAME"
  ttl     = "300"
  records = ["connormaglynn.github.io"]
}
