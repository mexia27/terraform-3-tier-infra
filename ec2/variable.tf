variable "ami" {
    type = string
    description = "ami id"
    default = "ami-01c647eace872fc02"
}


variable "instance_type" {
    type = string
    description = "type of instance"
    default = "t2.micro"
}


variable "subnet_id" {
    type = string
    description = "subnet id to lunch the instance"
}

variable "tags" {
    type = map(string)
    description = "tags"
}

variable "vpc_id" {
    type = string
    description = "vpc id to launch sg"
}

variable "passcode" {
 type = string
 description = "for keypair"
 default = "davion-us-east-1-kp"
  
}