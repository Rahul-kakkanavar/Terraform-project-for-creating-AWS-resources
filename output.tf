output "instance_id" {
    description = "instance id of the created EC2 instance"
    value = aws_instance.web.id
}

output "public_ip" {
    description = "public_id of the created ec2 instance"
    value = aws_instance.web.public_ip
}

output "ebs_volume_id" {
    description = "instance id of the created EC2 instance"
    value = aws_ebs_volume.ebs_job_simulation.id
}

output "s3_bucket_url" {
  description = "The URL of the S3 bucket"
  value       = "https://${aws_s3_bucket.s3_job_simulation.bucket}.s3.amazonaws.com"
}