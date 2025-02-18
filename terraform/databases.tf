module "maria_db" {
    source = "./databases/rds"

    ciim_vpc_id = module.network.ciim_vpc_id
    maria_db_cidr_block = [
        local.vpc_cidr,
    ]

    maria_db_admin_user = jsondecode(data.aws_secretsmanager_secret_version.ciim_maria_db_credentials.secret_string)["username"]
    maria_db_admin_pw   = jsondecode(data.aws_secretsmanager_secret_version.ciim_maria_db_credentials.secret_string)["password"]

    maria_db_private_subnet_ids = module.network.private_subnet_ids

    ciim_rds_maria_db_database_storage        = "2000"
    ciim_rds_maria_db_database_storage_type   = "gp2"
    ciim_rds_maria_db_storage_encryption      = true
    ciim_rds_maria_db_engine                  = "mariadb"
    ciim_rds_maria_db_engine_version          = "11.4"
    ciim_rds_maria_db_instance_class          = "db.m6g.large"
    ciim_rds_maria_db_multi_az                = false
    ciim_rds_maria_db_port                    = 3306
    ciim_rds_maria_db_license_model           = "general-public-license"
    ciim_rds_maria_db_apply_immediately       = true
    ciim_rds_maria_db_auto_minor_upgrade      = true
    ciim_rds_maria_db_skip_final_snapshot     = true
    ciim_rds_maria_db_ca_cert_identifier      = "rds-ca-rsa2048-g1"
    ciim_rds_maria_db_backup_retention_period = 7

    create_ciim_rds_maria_db_pg = false
    ciim_rds_maria_db_pg_family = "mariadb11.4"
    ciim_rds_maria_db_parameters = []

    create_ciim_rds_maria_db_og                   = false
    ciim_rds_maria_db_og_option_group_description = "Options group for CIIM Mariadb instance"
    ciim_rds_maria_db_og_engine_name              = "mariadb"
    ciim_rds_maria_db_major_engine_version        = "11.4"
    ciim_rds_maria_db_options = []

    tags = local.default_tags
}
