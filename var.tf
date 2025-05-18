# Define variables for the Terraform configuration

variable "region" {
    description = "The region where resources will be created"
    type        = string
    default     = "ap-south-1"
}


variable "instance_type" {
    description = "The type of EC2 instance to use"
    type        = string
    default     = "t2.micro"
}

variable "tags" {
    description = "A map of tags to assign to resources"
    type        = map(string)
    default     = {
        "Project" = "job simulation"
        "Owner"   = "DevOpsTeam"
    }
    
}
variable "ebs_size" {
    description = "The size of the EBS volume in GiB"
    type        = number
    default     = 16
}

variable "availability_zone" {
    description = "The availability zone where EBS will be created"
    type        = string
    default     = "ap-south-1b"
}

variable "volume_type" {
    description = "The availability zone where EBS will be created"
    type        = string
    default     = "gp2"
}

variable "EBS-name" {
    description = "The availability zone where EBS will be created"
    type        = string
    default     = "EBS-job-simulation"
}

variable "bucket-name" {
    description = "The name of the S3 bucket"
    type        = string
    default     = "job-simulation-bucket-7510"
  
}