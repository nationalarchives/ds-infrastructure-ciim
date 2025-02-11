locals {
    vpc_cidr = "10.100.0.0/16"

    public_subnets = {
        public_a = {
            "name" = "ciim-public-subnet-a"
            "cidr" = "10.100.40.0/24"
            "az"   = "euw2-az1"
        }
        public_b = {
            "name" = "ciim-public-subnet-b"
            "cidr" = "10.100.50.0/24"
            "az"   = "euw2-az2"
        }
        public_c = {
            "name" = "ciim-public-subnet-c"
            "cidr" = "10.100.60.0/24"
            "az"   = "euw2-az3"
        }
    }

    private_subnets = {
        private_a = {
            "name" = "ciim-private-subnet-a"
            "cidr" = "10.100.10.0/24"
            "az"   = "euw2-az1"
        }
        private_b = {
            "name" = "ciim-private-subnet-b"
            "cidr" = "10.100.20.0/24"
            "az"   = "euw2-az2"
        }
        private_c = {
            "name" = "ciim-private-subnet-c"
            "cidr" = "10.100.30.0/24"
            "az"   = "euw2-az3"
        }
    }

    private_nacls = [
        {
            rule_number = 100
            egress      = false
            protocol    = "-1"
            rule_action = "allow"
            cidr_block  = "0.0.0.0/0"
            from_port   = "-1"
            to_port     = "-1"
        },
        {
            rule_number = 100
            egress      = true
            protocol    = "-1"
            rule_action = "allow"
            cidr_block  = "0.0.0.0/0"
            from_port   = "-1"
            to_port     = "-1"
        },
    ]

    public_nacls = [
        {
            rule_number = 100
            egress      = false
            protocol    = "-1"
            rule_action = "allow"
            cidr_block  = "0.0.0.0/0"
            from_port   = "-1"
            to_port     = "-1"
        },
        {
            rule_number = 100
            egress      = true
            protocol    = "-1"
            rule_action = "allow"
            cidr_block  = "0.0.0.0/0"
            from_port   = "-1"
            to_port     = "-1"
        },
    ]
}

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
