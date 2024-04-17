resource "aws_ssm_parameter" "ec2_instance_ip" {
  name = var.public_access ? "/${lower(terraform.workspace)}/${lower(var.name)}/PUBLIC_IP_ADDRESS" : "/${lower(terraform.workspace)}/${lower(var.name)}/INTERNAL_IP_ADDRESS"
  type = "String"
  value = (
    var.public_access ?
    var.provisioned ? aws_instance.provisioned_ec2_instance[0].public_ip : aws_instance.non_provisioned_ec2_instance[0].public_ip :
    var.provisioned ? aws_instance.provisioned_ec2_instance[0].private_ip : aws_instance.non_provisioned_ec2_instance[0].private_ip
  )
}