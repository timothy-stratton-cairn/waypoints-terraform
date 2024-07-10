output "lb_domain" {
  value = aws_lb.public.0.dns_name
}