resource "aws_db_subnet_group" "main" {
  name       = "${var.component}-${var.env}"
  subnet_ids = var.subnet_ids
  tags       = merge({ Name = "${var.component}-${var.env}" }, var.tags)
}

resource "aws_rds_cluster" "main" {
  cluster_identifier     = "${var.component}-${var.env}"
  engine                 = var.engine
  engine_version         = var.engine_version
  database_name          = var.db_name
  master_username         = data.aws_ssm_parameter.username.value
  master_password         = data.aws_ssm_parameter.password.value
  db_subnet_group_name = aws_db_subnet_group.main.name
  storage_encrypted      = true
  kms_key_id             = var.kms_key_arn
  backup_retention_period = 5
  skip_final_snapshot = true
}