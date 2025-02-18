module "network" {
    source = "./network"

    vpc_cidr = local.vpc_cidr
    vpc_name = "ciim-vpc"

    public_subnets  = local.public_subnets
    private_subnets = local.private_subnets

    internet_gateway_name = "ciim-igw"

    public_nacls  = local.public_nacls
    private_nacls = local.private_nacls

    default_tags = local.default_tags
}
