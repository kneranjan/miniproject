output "website_url" {
  description = "URL OF THE WEBSITE <---- "
  value       = "http://${aws_s3_bucket.website.bucket}.s3-website.ap-south-1.amazonaws.com"
}

output "bucket_name" {
  description = "Name of the S3 Bucket"
  value       = aws_s3_bucket.website.id

}
