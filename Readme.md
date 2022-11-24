#  Hosting react web app on AWS.
# The front is developed in REACT JS while the backend is developed in node js. The preferred mode of deployment is to deploy the front (REACT) as a static website hosted in S3 and served to users via CloudFront. Once this is achieved, the registered domain name(carterautos.tk) from freenom
# In the end, when users visit the domain, a static website should be accessible to them.
# Also as an additional measure to provide lower-latency data access in another region, I configured a cross-region bucket replication for the s3 bucket.
