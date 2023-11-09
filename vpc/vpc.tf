resource "aws_vpc" "steve" {
 cidr_block = var.vpc-cidr

 tags = merge(var.tags, {
    Name = "${var.tags["project"]}-${var.tags["apps"]}-${var.tags["env"]}-vpc"
 })
}

resource "aws_subnet" "pubsub1" {
 vpc_id = aws_vpc.steve.id
 cidr_block = var.all-cidir["pub1"]
 availability_zone = var.az[0]
 map_public_ip_on_launch = var.enable-pub-ip[0]
 tags = merge(var.tags, {
    Name = "${var.tags["project"]}-${var.tags["apps"]}-${var.tags["env"]}-pubsub1"
 })
  
}

resource "aws_subnet" "privsub1" {
 vpc_id = aws_vpc.steve.id
 cidr_block = var.all-cidir["priv1"]
 availability_zone = var.az[0]
 map_public_ip_on_launch = var.enable-pub-ip[1]
 
 tags = merge(var.tags, {
    Name = "${var.tags["project"]}-${var.tags["apps"]}-${var.tags["env"]}-privsub1"
 })
  
}

resource "aws_subnet" "pubsub2" {
 vpc_id = aws_vpc.steve.id
 cidr_block = var.all-cidir["pub2"]
 availability_zone = var.az[1]
 map_public_ip_on_launch = var.enable-pub-ip[0]
 tags = merge(var.tags, {
    Name = "${var.tags["project"]}-${var.tags["apps"]}-${var.tags["env"]}-pubsub2"
 })
  
}

resource "aws_subnet" "privsub2" {
 vpc_id = aws_vpc.steve.id
 cidr_block = var.all-cidir["priv2"]
 availability_zone = var.az[1]
 map_public_ip_on_launch = var.enable-pub-ip[1]
 tags = merge(var.tags, {
    Name = "${var.tags["project"]}-${var.tags["apps"]}-${var.tags["env"]}-privsub2"
 })
  
}

resource "aws_internet_gateway" "dylan" {
 vpc_id = aws_vpc.steve.id

 tags = merge(var.tags, {
    Name = "${var.tags["project"]}-${var.tags["apps"]}-${var.tags["env"]}-dylan-igw"
 })
  
}
resource "aws_route_table" "pub-route" {
 vpc_id = aws_vpc.steve.id

 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dylan.id
 }

 tags = merge(var.tags, {
    Name = "${var.tags["project"]}-${var.tags["apps"]}-${var.tags["env"]}-pub-rt"
 })
 
}

resource "aws_route_table_association" "pub1-asso" {
 subnet_id = aws_subnet.pubsub1.id
 route_table_id = aws_route_table.pub-route.id
}

resource "aws_route_table_association" "pub2-asso" {
 subnet_id = aws_subnet.pubsub2.id
 route_table_id = aws_route_table.pub-route.id
}

resource "aws_eip" "davion-eip" {
  domain = "vpc"

  tags = merge(var.tags, {
    Name = "${var.tags["project"]}-${var.tags["apps"]}-${var.tags["env"]}-davion-eip"
 })
}

resource "aws_nat_gateway" "papa-nat" {
 allocation_id = aws_eip.davion-eip.id
 subnet_id = aws_subnet.pubsub1.id

 tags = merge(var.tags, {
    Name = "${var.tags["project"]}-${var.tags["apps"]}-${var.tags["env"]}-nat-gw"
 })
  
}

resource "aws_route_table" "priv-route" {
 vpc_id = aws_vpc.steve.id

 route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.papa-nat.id
 }

 tags = merge(var.tags, {
    Name = "${var.tags["project"]}-${var.tags["apps"]}-${var.tags["env"]}-priv-rt"
 })
 
}

resource "aws_route_table_association" "priv1-asso" {
 subnet_id = aws_subnet.privsub1.id
 route_table_id = aws_route_table.priv-route.id
}

resource "aws_route_table_association" "priv2-asso" {
 subnet_id = aws_subnet.privsub2.id
 route_table_id = aws_route_table.priv-route.id
}

