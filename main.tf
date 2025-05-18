provider "aws" {
    region     = "ap-south-1"
    access_key = ""
    secret_key = ""
}

resource "aws_instance" "web" {
  key_name      = "new_project"
  ami           = "ami-03edbe403ec8522ed" 
  availability_zone = var.availability_zone
  instance_type = var.instance_type

tags = {
    Project = var.tags.Project
    Owner   = var.tags.Owner

}

}

resource "aws_ebs_volume" "ebs_job_simulation" {
    availability_zone = var.availability_zone
    type              = var.volume_type
    encrypted         = true
    size              = var.ebs_size

    tags = {
        Name = var.EBS-name
    }
}

resource "aws_volume_attachment" "ebs-attach" {
  device_name = "/dev/xvdf"
  volume_id   = aws_ebs_volume.ebs_job_simulation.id
  instance_id = aws_instance.web.id
}

resource "aws_s3_bucket" "s3_job_simulation" {
  bucket = var.bucket-name                     # Name of the S3 bucket using variables      
  force_destroy = true                      # Force delete the bucket and its contents when destroying the resource
  tags   = {
    Name        = "S3-job-simulation"
    Environment = "Dev"
  }
} 

#resource "aws_s3_bucket_acl" "s3_job_simulation_acl" {
#  bucket = aws_s3_bucket.s3_job_simulation.id  # ID of the S3 bucket, In this case, aws_s3_bucket.<local name>.id
  # The ACL (Access Control List) for the S3 bucket
  #acl    = "private"                               # Access control list for the bucket
  
#} commenting this as it is not needed

resource "aws_s3_bucket_lifecycle_configuration" "Devops-lifecycle" {
  bucket = aws_s3_bucket.s3_job_simulation.id
  # The lifecycle configuration for the S3 bucket
  # This configuration defines rules for transitioning and expiring objects in the bucket
  rule {
    id     = "transition-and-expire"
    status = "Enabled"

    filter {
      prefix = "/logs"  # Apply the rule to all objects in the bucket
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

    expiration {
      days = 90
    }
  }
}
resource "aws_s3_bucket_versioning" "s3_job_simulation_versioning" {
  bucket = aws_s3_bucket.s3_job_simulation.id
  # Enable versioning for the S3 bucket
  versioning_configuration {
    status = "Enabled"
  }
}