# AWS RDS postgresql Output

output "db_instance_endpoint" {
  description = "Database instance ID"
  value       = aws_db_instance.myrds.id
}