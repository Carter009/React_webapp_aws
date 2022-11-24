resource "aws_route53_zone" "tf" {
 name = "carterautos.tk" 
}

resource "aws_route53_record" "nameservers" {
  allow_overwrite = true
  name            = "carterautos.tk"
  ttl             = 3600
  type            = "NS"
  zone_id         = aws_route53_zone.tf.zone_id

  records = aws_route53_zone.tf.name_servers
}