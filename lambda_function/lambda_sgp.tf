#Lambda outbound sgp 
resource "aws_security_group" "sg_lambda" {
  vpc_id      = module.vpc.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
#SGP proxy for rds to connect lambda with RDS DB 
resource "aws_security_group" "sg_rds_proxy" {
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "MySQL TLS from sg_lambda"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [aws_security_group.sg_lambda.id]
  }
}

egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
