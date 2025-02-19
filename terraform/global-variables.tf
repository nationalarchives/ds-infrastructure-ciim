locals {
    default_tags = {
        Owner      = "Digital Services"
        CostCentre = "Digital Services"
        CostGroup  = "CIIM"
        Region     = "eu-west-2"
        Account    = "ds-ciim"
        AccountId  = local.account_id
        Terraform  = "true"
    }

    account_id = data.aws_caller_identity.current.account_id
    vpc_cidr   = "10.100.0.0/16"

    public_subnets = {
        public_a = {
            "name" = "ciim-public-subnet-a"
            "cidr" = "10.100.40.0/24"
            "az"   = "eu-west-2a"
        }
        public_b = {
            "name" = "ciim-public-subnet-b"
            "cidr" = "10.100.50.0/24"
            "az"   = "eu-west-2b"
        }
        public_c = {
            "name" = "ciim-public-subnet-c"
            "cidr" = "10.100.60.0/24"
            "az"   = "eu-west-2c"
        }
    }

    private_subnets = {
        private_a = {
            "name" = "ciim-private-subnet-a"
            "cidr" = "10.100.10.0/24"
            "az"   = "eu-west-2a"
        }
        private_b = {
            "name" = "ciim-private-subnet-b"
            "cidr" = "10.100.20.0/24"
            "az"   = "eu-west-2b"
        }
        private_c = {
            "name" = "ciim-private-subnet-c"
            "cidr" = "10.100.30.0/24"
            "az"   = "eu-west-2c"
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
