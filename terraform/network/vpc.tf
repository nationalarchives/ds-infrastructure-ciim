resource "aws_vpc" "ciim_vpc" {
    cidr_block           = var.vpc_cidr
    enable_dns_hostnames = true

    tags = merge(
        var.default_tags,
        {
            Name = var.vpc_name
        }
    )
}
