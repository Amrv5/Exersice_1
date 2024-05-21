#RDS Postgresql database 

resource "aws_db_instance" "myrds" {
  engine               = "Postgres"
  allocated_storage    =  20 #gigabytes
  engine_version       = "15.4"
  instance_class       = "db.t3.micro"
  storage_type         = "gp2"
  username             = "postgres"
  password             = "admin123"
  publicly_accessible =  False
  storage_encrypted = true

#The security group id that will be associated to the private RDS database
vpc_security_group_ids = [module.private_sg.security_group_id]
}



