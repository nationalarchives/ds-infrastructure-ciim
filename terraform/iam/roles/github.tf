resource "aws_iam_role" "github_actions_role" {
    name = "github-actions-role"
    assume_role_policy = templatefile("${path.module}/templates/github-trust-relationships.json", {
        principal = var.principal
    })
    tags = merge(var.tags, {
        Name = "github-actions-role"
    })
}

resource "aws_iam_role_policy_attachment" "account_access" {
    role       = aws_iam_role.github_actions_role.name
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
