variable region {
    type    = string 
    default = "eu-west-3"
}

variable bucket_name {
    type    = string 
    default = "terraform-tfstate-demo-adel"
}


variable dynamo_table_name {
    type    = string 
    default = "terraform-tfstate-demo-lock"
}

variable tf_name {
    type = string 
    default = "terraform.tfstate"
}

variable instance_type {
  description = "EC2 type to create, see https://aws.amazon.com/ec2/instance-types/"
  type        = string
  default     = "t2.micro"
}

variable instance_ami {
  description = "AMI "
  type        = string
  default     = "ami-0c6ebbd55ab05f070"
}
