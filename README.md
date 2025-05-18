# Terraform-project-for-creating-AWS-resources
Terraform project-for-creating-S3, EC2 and EBS volume

~**This project contains 3 files**
1. main.tf          # This is main file in which we have our resource block
2. variable.tf      # This is variable file win which we have our variables it makes code more reusable.
3. output.tf        # This  file will give output after all the resources are created ex- instance-id, volume-id and s3 url.
4. terraform.tfvar  # It’s a file where you define values for your Terraform variables. It helps separate configuration data (like passwords, region, instance types) from the main code.

~**In This project we have created 3 resource in AWS cloud.**
1. S3 bucket
2. EC2 instance
3. EBS volumes # attaching created volume to ec2 instance.
we can do it using 3 simple commands in terraform.

~**Once we have applied all the changes we will get output as below**
1. Instance_id
2. Public_ip of instance
3. Polume_id
4. S3_bucket_url

~**Terraform commands**
1. terraform init
2. terraform plan
3. terraform apply

~**Note** never provide your AWS access_key and secret_access_key in main.tf file not the good practices

provider "aws" {
  access_key = "YOUR_ACCESS_KEY"      # ❌ Not recommended!
  secret_key = "YOUR_SECRET_KEY"      # ❌ Not recommended!
  region     = "us-east-1"
}

~**Instead, we can use below steps to keep our secrets safe ..!!**

~**1. Use environment variables (recommended)**
Set your AWS credentials as environment variables on your machine or CI/CD environment:

export AWS_ACCESS_KEY_ID="YOUR_ACCESS_KEY"
export AWS_SECRET_ACCESS_KEY="YOUR_SECRET_KEY"

~**2. Windows (PowerShell):**

$env:AWS_ACCESS_KEY_ID="YOUR_ACCESS_KEY"
$env:AWS_SECRET_ACCESS_KEY="YOUR_SECRET_KEY"

~**3. Use AWS CLI configured profiles**
Set up profiles with aws configure:

aws configure --profile myprofile
Then specify the profile in your Terraform provider:

provider "aws" {
  profile = "myprofile"
  region  = "us-east-1"
}
