resource "aws_instance" "web" {
 ami = var.ami
 instance_type = var.instance_type
 key_name = var.passcode
 subnet_id = var.subnet_id
 user_data = file("scripts/web-server-setup.sh")
 vpc_security_group_ids = [aws_security_group.web_server-gs.id]

 tags = merge(var.tags, {
    Name = "${var.tags["project"]}-${var.tags["apps"]}-${var.tags["env"]}-web-server"
 })
  
}

resource "aws_security_group" "web_server-gs" {
  name        = "${var.tags["project"]}-${var.tags["apps"]}-${var.tags["env"]}-web-server-sg"
  description = "Allow web traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "traffic port"
    from_port        = 22
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(var.tags, {
    Name = "${var.tags["project"]}-${var.tags["apps"]}-${var.tags["env"]}-web-server-sg"
 })
}

