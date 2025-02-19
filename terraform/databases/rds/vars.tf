variable "ciim_vpc_id" {}
variable "maria_db_cidr_block" {}
variable "maria_db_admin_user" {}
variable "maria_db_admin_pw" {}

variable "maria_db_private_subnet_ids" {}

variable "ciim_rds_maria_db_database_storage" {}
variable "ciim_rds_maria_db_database_storage_type" {}
variable "ciim_rds_maria_db_storage_encryption" {}
variable "ciim_rds_maria_db_engine" {}
variable "ciim_rds_maria_db_engine_version" {}
variable "ciim_rds_maria_db_instance_class" {}
variable "ciim_rds_maria_db_multi_az" {}
variable "ciim_rds_maria_db_port" {}
variable "ciim_rds_maria_db_license_model" {}
variable "ciim_rds_maria_db_apply_immediately" {}
variable "ciim_rds_maria_db_auto_minor_upgrade" {}
variable "ciim_rds_maria_db_skip_final_snapshot" {}
variable "ciim_rds_maria_db_ca_cert_identifier" {}
variable "ciim_rds_maria_db_backup_retention_period" {}
# variable "ciim_rds_maria_db_kms_key_id" {}

variable "create_ciim_rds_maria_db_pg" {}
variable "ciim_rds_maria_db_pg_family" {}
variable "ciim_rds_maria_db_parameters" {}

variable "create_ciim_rds_maria_db_og" {}
variable "ciim_rds_maria_db_og_option_group_description" {}
variable "ciim_rds_maria_db_og_engine_name" {}
variable "ciim_rds_maria_db_major_engine_version" {}
variable "ciim_rds_maria_db_options" {}

variable "tags" {}
