resource "aws_db_instance" "ciim_rds_maria_db_instance" {
    username = var.maria_db_admin_user
    password = var.maria_db_admin_pw

    publicly_accessible = false

    identifier                = "ciim-maria-db-cluster"
    final_snapshot_identifier = "ciim-maria-db-cluster-final"

    allocated_storage    = var.ciim_rds_maria_db_database_storage
    storage_type         = var.ciim_rds_maria_db_database_storage_type
    storage_encrypted    = var.ciim_rds_maria_db_storage_encryption
    # if no cross region replica is required then use storage_encrypted for an encrypted database
    # kms_key_id                 = var.ciim_rds_maria_db_kms_key_id
    # if cross region replicas are required then state kms key arn and remove storage_encrypted from .tfvars
    engine               = var.ciim_rds_maria_db_engine
    engine_version       = var.ciim_rds_maria_db_engine_version
    instance_class       = var.ciim_rds_maria_db_instance_class
    db_subnet_group_name = aws_db_subnet_group.default.name
    multi_az             = var.ciim_rds_maria_db_multi_az
    port                 = var.ciim_rds_maria_db_port
    vpc_security_group_ids = [
        aws_security_group.ciim_maria_db_sg.id,
    ]
    option_group_name          = aws_db_option_group.ciim_rds_maria_db_options_group.name
    parameter_group_name       = aws_db_parameter_group.ciim_rds_maria_db_pg.name
    license_model              = var.ciim_rds_maria_db_license_model
    apply_immediately          = var.ciim_rds_maria_db_apply_immediately
    auto_minor_version_upgrade = var.ciim_rds_maria_db_auto_minor_upgrade
    skip_final_snapshot        = var.ciim_rds_maria_db_skip_final_snapshot
    ca_cert_identifier         = var.ciim_rds_maria_db_ca_cert_identifier
    backup_retention_period    = var.ciim_rds_maria_db_backup_retention_period
    backup_window              = "01:00-02:14"

    tags = merge(var.tags, {
        Product = "cluster"
        Project = "CIIM"
    })
}

# ----------------------------------------------------------------------------------------------------------------------
# CIIM RDS Parameter Group
# ----------------------------------------------------------------------------------------------------------------------

resource "aws_db_parameter_group" "ciim_rds_maria_db_pg" {
    name   = "ciim-rds-maria-db-pg"
    family = var.ciim_rds_maria_db_pg_family

    tags = merge(var.tags, {
        Name    = "ciim-rds-maria-db-pg"
        Product = "cluster"
        Project = "CIIM"
    })

    dynamic parameter {
        for_each = var.ciim_rds_maria_db_parameters
        content {
            name         = parameter.value.name
            value        = parameter.value.value
            apply_method = parameter.value.apply_method
        }
    }
}

# ----------------------------------------------------------------------------------------------------------------------
# CIIM RDS Option Group
# ----------------------------------------------------------------------------------------------------------------------

resource "aws_db_option_group" "ciim_rds_maria_db_options_group" {
    name                     = "ciim-rds-maria-db-og"
    option_group_description = var.ciim_rds_maria_db_og_option_group_description
    engine_name              = var.ciim_rds_maria_db_og_engine_name
    major_engine_version     = var.ciim_rds_maria_db_major_engine_version

    tags = merge(var.tags, {
        Name    = "ciim-rds-maria-db-og"
        Product = "cluster"
        Project = "CIIM"
    })
    dynamic option {
        for_each = var.ciim_rds_maria_db_options

        content {
            option_name = option.value.option_name

            dynamic option_settings {
                for_each = option.value.option_settings

                content {
                    name  = option_settings.value.name
                    value = option_settings.value.value
                }
            }
        }
    }
}

resource "aws_db_subnet_group" "default" {
    name       = "default-db-subnet-group"
    subnet_ids = var.maria_db_private_subnet_ids

    tags = merge(var.tags, {
        Product = "cluster"
    })
}
