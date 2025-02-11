resource "aws_route_table" "ciim_public_rt" {
    vpc_id = aws_vpc.ciim_vpc.id

    tags = merge(
        var.default_tags,
        {
            Name = "ciim-public-rt"
        }
    )
}

resource "aws_route" "public_route_internet" {
    route_table_id         = aws_route_table.ciim_public_rt.id
    gateway_id             = aws_internet_gateway.ciim_igw.id
    destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public_rt_assoc" {
    for_each = aws_subnet.ciim_public_subs

    subnet_id      = each.value.id
    route_table_id = aws_route_table.ciim_public_rt.id
}

# ----------------------------------------------------------------------------------------------------------------------
# Private Routes
# ----------------------------------------------------------------------------------------------------------------------

resource "aws_route_table" "ciim_private_rt" {
    vpc_id = aws_vpc.ciim_vpc.id

    tags = merge(
        var.default_tags,
        {
            Name = "ciim-private-rt"
        }
    )
}

resource "aws_route" "internet_access" {
    route_table_id         = aws_route_table.ciim_private_rt.id
    nat_gateway_id         = aws_nat_gateway.nat_gateway.id
    destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "private_rt_assoc" {
    for_each = aws_subnet.ciim_private_subs

    subnet_id      = each.value.id
    route_table_id = aws_route_table.ciim_private_rt.id
}
