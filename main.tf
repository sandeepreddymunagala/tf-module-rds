resource "aws_rds_cluster" "default" {
  cluster_identifier      = "${var.component}-${var.env}"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.03.2"
  database_name           = "mydb"
  master_username         = "foo"
  master_password         = "bar"
  backup_retention_period = 5
}