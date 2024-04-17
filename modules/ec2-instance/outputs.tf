output "ec2_instance_ip" {
  value = (
    var.public_access ?
    var.provisioned ? aws_instance.provisioned_ec2_instance[0].public_ip : aws_instance.non_provisioned_ec2_instance[0].public_ip :
    var.provisioned ? aws_instance.provisioned_ec2_instance[0].private_ip : aws_instance.non_provisioned_ec2_instance[0].private_ip
  )
}