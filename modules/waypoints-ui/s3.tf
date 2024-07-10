resource "aws_s3_bucket" "uploads" {
  bucket = "${terraform.workspace}-${var.name}-1nbkjl5"
  tags = {
    Name = "${terraform.workspace}-${var.name}"
  }
}