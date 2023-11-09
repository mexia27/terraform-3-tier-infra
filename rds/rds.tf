resource "aws_db_subnet_group" "db-sub-group" {
#   name       = "main"
  subnet_ids = [var.private-subnet1, var.private-subnet2]

  tags = merge(var.tags, {
    Name = "${var.tags["project"]}-${var.tags["apps"]}-${var.tags["env"]}-sub-group"
 })
}


resource "aws_security_group" "rds-gs" {
  name        = "${var.tags["project"]}-${var.tags["apps"]}-${var.tags["env"]}-rds-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc-id

  ingress {
    description      = "DB port"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = [var.vpc-cidr]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(var.tags, {
    Name = "${var.tags["project"]}-${var.tags["apps"]}-${var.tags["env"]}-rds-sg"
 })
}










 resource "aws_db_instance" "rds" {
  allocated_storage    = 10
  db_name              = "dylan"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.db-sub-group.id
  vpc_security_group_ids = [aws_security_group.rds-gs.id]
}