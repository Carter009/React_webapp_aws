resource "aws_instance" "app_server" {
  ami           = "ami-0beaa649c482330f7"
  instance_type = "t2.micro"

  tags = {
    Name = "Website hosting"
  }
}


#terraform code
resource "aws_s3_bucket" "tf" {
  bucket = var.bucket_name
  acl = "private"

}

resource "aws_s3_bucket_public_access_block" "tf" {
  bucket = aws_s3_bucket.tf.id
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

resource "aws_cloudfront_distribution" "tf" {
  enabled             = true
  default_root_object = "index.html"

  origin {
    domain_name = aws_s3_bucket.tf.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.tf.bucket_regional_domain_name

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = aws_s3_bucket.tf.bucket_regional_domain_name
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      headers      = []
      query_string = true

      cookies {
        forward = "all"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

 viewer_certificate {
    ssl_support_method = "sni-only"
    cloudfront_default_certificate = true
  }
}

resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "OAI for ${var.endpoint}"
}

resource "aws_s3_bucket_policy" "tf" {
  bucket = aws_s3_bucket.tf.id
  policy = data.aws_iam_policy_document.s3policy.json
}
output "website_endpoint" {

value = aws_s3_bucket.tf.website_endpoint

}