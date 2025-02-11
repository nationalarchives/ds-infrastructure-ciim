resource "aws_subnet" "ciim_private_subs" {
    for_each = var.private_subnets

    vpc_id            = aws_vpc.ciim_vpc.id
    cidr_block        = each.value.cidr
    availability_zone = each.value.az

    map_public_ip_on_launch = true

    tags = merge(
        var.default_tags,
        {
            Name = each.value.name
        },
    )
}
