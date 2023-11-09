variable "vpc-cidr" {
    type = string
    description = "This is for vpc cidir block"
    default = "10.200.0.0/16"
}

variable "pusub1-cidir" {
    type = string
    description = "This is for the first public subnet"
    default = "10.200.0.0/24"
}

variable "prisub1-cidir" {
    type = string
    description = "This is for the first private subnet 1"
    default = "10.200.1.0/24"
}

variable "pusub2-cidir" {
    type = string
    description = "This is for the first public subnet 2"
    default = "10.200.2.0/24"
}

variable "prisub2-cidir" {
    type = string
    description = "This is for the first private subnet 2"
    default = "10.200.3.0/24"
}

variable "az" {
    type = list(string)
    description = "this is for the availability zone"
    default = [ "us-east-1a", "us-east-1b" ]
}

variable "enable-pub-ip" {
    type = list(string)
    description = "This is to enable public ip addresses on lunch"
    default = [ "true", "false" ]

}

variable "all-cidir" {
    description = "This is for the cidr block of all the subnets"
    type = map
    default = {
      pub1 = "10.200.0.0/24"
      priv1 = "10.200.1.0/24"
      pub2 = "10.200.2.0/24"
      priv2 = "10.200.3.0/24"
    }
}

variable "tags" {
    type = map
    description = "tags"
}