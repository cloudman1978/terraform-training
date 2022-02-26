variable region {
    type    = string 
    default = "eu-west-3"
}

variable bucket_name {
    type    = string 
    default = "terraform-tfstate-demo"
}


variable dynamo_table_name {
    type    = string 
    default = "terraform-tfstate-demo-lock"
}
