### ERRORS ####

1. creating EC2 Instance: VPCIdNotSpecified: No default VPC for this user. GroupName is only supported for EC2-Classic and default VPC.
```shell
on main.tf line 1, in resource "aws_instance" "app_server":
   1: resource "aws_instance" "app_server" {
```
##### SOLUTION #####
- Create a vpc and use it for your ec2 
  - quick steps https://www.sammeechward.com/terraform-vpc-subnets-ec2-and-more
    - In both subnet here change `availability_zone = "1a"` to `availability_zone = "us-east-2a"`
- Optimal solution: Use data to search for vpc in your account and use that.

2. creating Amazon S3 (Simple Storage) Bucket (newbucketcloudfr32): BucketAlreadyExists: The requested bucket name is not available.
```shell
on main.tf line 12, in resource "aws_s3_bucket" "tf":
  12: resource "aws_s3_bucket" "tf" {
```
##### SOLUTION #####
- editted bucket name variable to be something else 


### Result of Apply ###
```shell
Apply complete! Resources: 15 added, 0 changed, 0 destroyed.
```

## Thing to keep in mind with your AWS ACC

- Remember to always delete resource once you done (you dont want to pay them for leaving resources running)
- add MFA to your root account
- create a user account with admin access that you will use for every day stuff (also add mfa) 
- create a budget of 1 dollar on aws with root account so that you are aware if there is charge

