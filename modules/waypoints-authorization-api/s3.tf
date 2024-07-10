resource "aws_s3_bucket" "uploads" {
  bucket = "${terraform.workspace}-${var.name}-1nbkjg5"
  tags = {
    Name = "${terraform.workspace}-${var.name}"
  }
}