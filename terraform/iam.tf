module "roles" {
    source = "./iam/roles"

    principal = aws_iam_openid_connect_provider.github.arn

    tags = local.default_tags
}
