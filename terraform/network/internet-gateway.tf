resource "aws_internet_gateway" "ciim_igw" {
    vpc_id = aws_vpc.ciim_vpc.id

    tags = merge(
        var.default_tags,
        {
            Name = var.internet_gateway_name
        },
    )
}
