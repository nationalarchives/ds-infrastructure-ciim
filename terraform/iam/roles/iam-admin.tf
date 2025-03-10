resource "aws_iam_role" "iam_admin_role" {
    name = "iam-admin-role"
    assume_role_policy = templatefile("${path.module}/templates/iam-admin-relationship.json", {
        principal = var.principal
    })
    tags = merge(var.tags, {
        Name = "iam-admin-role-role"
    })
}

resource "aws_iam_role_policy_attachment" "admin_account_access" {
    role       = aws_iam_role.github_actions_role.name
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
