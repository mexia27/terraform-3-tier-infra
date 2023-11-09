variable "private-subnet1" {
    type = string
    description = "This is for the rds private1 subnet group"
    default = "value"
    
}


variable "private-subnet2" {
    type = string
    description = "This is for the rds private2 subnet group"
    default = "value"
    
}

variable "tags" {
    type = map(string)
    description = "tagging"
}

variable "vpc-id" {
    type = string
    description = "(optional) describe your variable"
}

variable "vpc-cidr" {
    type = string
    description = "(optional) describe your variable"
}