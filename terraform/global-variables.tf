locals {
    default_tags = {
        Owner       = "Digital Services"
        CostCentre  = "Digital Services"
        CostGroup   = "CIIM"
        Region      = "eu-west-2"
        Account     = "ds-ciim"
        AccountId   = local.account_id
        Terraform   = "true"
    }

    account_id = data.aws_caller_identity.current.account_id
}
