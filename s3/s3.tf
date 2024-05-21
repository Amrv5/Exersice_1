resource "aws_s3_bucket" "cp_b004_s3_bucket" {
  bucket = "cp-b004-s3-bucket"

  tags = {
    Name        = "cp-b004-s3-bucket"
    Environment = "Dev"
  }
}