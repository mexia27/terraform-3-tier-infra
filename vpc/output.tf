output "vpc_id" {
    value = aws_vpc.steve.id
}

output "public_subnet1_id" {
    value = aws_subnet.pubsub1.id
}

output "pubblic_subnet2_id" {
    value = aws_subnet.pubsub2.id
}


output "private_subnet1_id" {
    value = aws_subnet.privsub1.id
}


output "private_subnet2_id" {
    value = aws_subnet.privsub2.id
}