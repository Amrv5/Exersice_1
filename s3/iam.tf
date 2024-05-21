resource "aws_iam_role" "cp_b004_iam_s3_access_for_ec2" {
  name = "cp_b004_s3_access"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

}

resource "aws_iam_role_policy" "cp_b004_s3_access" {
  name = "s3_access_Read"
  role = aws_iam_role.cp_b00_iam_s3_access_for_ec2.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
      {
        Resource = ["arn:aws:s3:::cp-b004-s3-bucket", "arn:aws:s3:::cp-b004-s3-bucket/*"]
      }
    ]
  })
}

resource "aws_iam_instance_profile" "cp_b004_instance_profile" {
  name = "cp-b00-instnace-profile"
  role = aws_iam_role.cp_b004_iam_s3_access_for_ec2.name
}
