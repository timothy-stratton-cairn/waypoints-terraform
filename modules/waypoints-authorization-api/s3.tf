resource "aws_s3_bucket" "uploads" {
  bucket = "${terraform.workspace}-${var.name}"
  tags = {
    Name = "${terraform.workspace}-${var.name}"
  }
}