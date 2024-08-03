resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_self_signed_cert" "example" {
  private_key_pem = tls_private_key.example.private_key_pem

  subject {
    common_name  = "waypointspro.com"
    organization = "Waypoints"
  }

  validity_period_hours = 12

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

resource "aws_acm_certificate" "main" {
  private_key      = tls_private_key.example.private_key_pem
  certificate_body = tls_self_signed_cert.example.cert_pem
}
