resource "aws_network_acl" "ciim_vpc_nacl_public" {
    vpc_id     = aws_vpc.ciim_vpc.id
    subnet_ids = [
        for k, v in aws_subnet.ciim_public_subs : v.id
    ]

    tags = merge(
        var.default_tags,
        {
            Name = "ciim-public-nacl"
        }
    )
}

resource "aws_network_acl_rule" "ciim_public_nacl_rule" {
    count = length(var.public_nacls)

    network_acl_id = aws_network_acl.ciim_vpc_nacl_public.id
    rule_number    = var.public_nacls[count.index]["rule_number"]
    egress         = var.public_nacls[count.index]["egress"]
    protocol       = var.public_nacls[count.index]["protocol"]
    rule_action    = var.public_nacls[count.index]["rule_action"]
    cidr_block     = var.public_nacls[count.index]["cidr_block"]
    from_port      = var.public_nacls[count.index]["from_port"]
    to_port        = var.public_nacls[count.index]["to_port"]
}

resource "aws_network_acl" "ciim_vpc_nacl_private" {
    vpc_id     = aws_vpc.ciim_vpc.id
    subnet_ids = [
        for k, v in aws_subnet.ciim_private_subs : v.id
    ]

    tags = merge(
        var.default_tags,
        {
            Name = "ciim-private-nacl"
        }
    )
}

resource "aws_network_acl_rule" "ciim_private_nacl_rule" {
    count = length(var.private_nacls)

    network_acl_id = aws_network_acl.ciim_vpc_nacl_private.id
    rule_number    = var.public_nacls[count.index]["rule_number"]
    egress         = var.public_nacls[count.index]["egress"]
    protocol       = var.public_nacls[count.index]["protocol"]
    rule_action    = var.public_nacls[count.index]["rule_action"]
    cidr_block     = var.public_nacls[count.index]["cidr_block"]
    from_port      = var.public_nacls[count.index]["from_port"]
    to_port        = var.public_nacls[count.index]["to_port"]
}
