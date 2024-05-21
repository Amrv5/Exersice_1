#Store RDS secrets in secret manager for all usernames & passwords

resource "aws_secretsmanager_secret" "rds_secret" {
  name_prefix = "rds-proxy-secret"
  recovery_window_in_days = 7
  description = "Secret for RDS Proxy"
}

resource "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id     = aws_secretsmanager_secret.rds_secret.id
  secret_string = jsonencode({
    "username"             = "Amr123"
    "password"             = "Amr1234"
    "engine"               = "Postgres"
    "port"                 = 3306
    "host"                 = aws_db_instance.myrds
    "dbInstanceIdentifier" = aws_db_instance.myrds.id
  })
}