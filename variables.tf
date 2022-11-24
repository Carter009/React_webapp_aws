variable "bucket_name" {
    description   = "my static website S3 bucket name"
    type          = string
    default = "newbucketcloudfr32"
}

variable "endpoint" {
  description = "Endpoint url"
  type        = string
   default = "newbucketcloudfr32"
}

variable "region" {
  description = "AWS region"
  default = "us-east-2"
  type        = string
}

variable "domain_name" {
  description = "Domain name"
  type        = string
   default = "newbucketcloudfr32"
}