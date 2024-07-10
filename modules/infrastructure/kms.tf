resource "aws_kms_key" "default" {
  description = "Default ${terraform.workspace} KMS Key"
}

resource "aws_kms_alias" "default" {
  name          = "alias/${terraform.workspace}_key"
  target_key_id = aws_kms_key.default.key_id
}

output "kms_key" {
  value = aws_kms_key.default.arn
}
