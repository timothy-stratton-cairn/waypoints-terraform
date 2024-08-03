provider "aws" {
  region  = "us-east-1"
  profile = "testing"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Stack       = basename(abspath(path.root))
    }
  }
}