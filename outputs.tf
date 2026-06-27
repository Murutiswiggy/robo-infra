output "az_info" {
   value = data.aws_availability_zones.available.names
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_sub_ids" {
  value = aws_subnet.public_sub_1[*].ids
}

output "private_sub_ids" {
  value = aws_subnet.private_sub_1[*].ids
}

output "database_sub_ids"{
    value = aws_subnet.database_sub_1[*].ids
}