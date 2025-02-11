resource "aws_eip" "nat" {
    domain = "vpc"

    tags = merge(
        var.default_tags,
        {
            Description = "eip for nat gateway"
        },
    )
}

resource "aws_nat_gateway" "ciim_nat_gateway" {
    allocation_id = aws_eip.nat.id
    subnet_id     = aws_subnet.ciim_public_subs["public_a"].id
    tags = var.default_tags
}
