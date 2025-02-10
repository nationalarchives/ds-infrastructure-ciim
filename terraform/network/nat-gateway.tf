resource "aws_eip" "nat" {
    domain = "vpc"

    tags = merge(
        var.default_tags,
        {
            Description = "eip for nat gateway"
        },
    )
}

resource "aws_nat_gateway" "nat_gateway" {
    allocation_id = aws_eip.nat.id
    subnet_id     = aws_subnet.ciim_public_subs[0].id
}
