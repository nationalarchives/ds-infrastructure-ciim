data "aws_caller_identity" "current" {}

data "aws_secretsmanager_secret" "ciim_maria_db_secrets" {
    arn = "arn:aws:secretsmanager:eu-west-2:676206936717:secret:ciim/rds/maria_db/credentials-PnSY1s"
}

data "aws_secretsmanager_secret_version" "ciim_maria_db_credentials" {
    secret_id = data.aws_secretsmanager_secret.ciim_maria_db_secrets.id
}
