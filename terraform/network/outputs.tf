output "ciim_vpc_id" {
    value = aws_vpc.ciim_vpc.id
}

output "public_subnet_ids" {
    value = values(aws_subnet.ciim_public_subs)[*].id
}

output "private_subnet_ids" {
    value = values(aws_subnet.ciim_private_subs)[*].id
}
