resource "aws_key_pair" "rsa_key" {
  key_name   = "${lower(terraform.workspace)}-${lower(var.name)}-admin-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "provisioned_ec2_instance" {
  count                       = var.provisioned ? 1 : 0
  ami                         = var.ec2_ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.rsa_key.key_name
  security_groups             = [aws_security_group.ec2_sg.id]
  subnet_id                   = var.public_access ? data.aws_subnets.public.ids[0] : data.aws_subnets.private.ids[0]
  associate_public_ip_address = var.public_access

  user_data = var.run_script ? null : var.user_data

  provisioner "file" { # Here I would like to make this conditional but will kick the can down the road
    source      = "~/.ssh/id_rsa"
    destination = "/home/ec2-user/.ssh/id_rsa"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = var.remote_commands

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_ip
    }
  }

  tags = {
    Name = "${upper(terraform.workspace)}-${var.name} EC2 Instance"
  }
}

resource "aws_instance" "non_provisioned_ec2_instance" {
  count                       = var.provisioned ? 0 : 1
  ami                         = var.ec2_ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.rsa_key.key_name
  security_groups             = [aws_security_group.ec2_sg.id]
  subnet_id                   = var.public_access ? data.aws_subnets.public.ids[0] : data.aws_subnets.private.ids[0]
  associate_public_ip_address = var.public_access

  user_data = var.run_script ? null : var.user_data

  tags = {
    Name = "${upper(terraform.workspace)}-${var.name} EC2 Instance"
  }
}

resource "aws_network_interface" "ec2_ni" {
  subnet_id = var.public_access ? data.aws_subnets.public.ids[0] : data.aws_subnets.private.ids[0]

  tags = {
    Name = "${upper(terraform.workspace)}-${var.name} Network Interface"
  }
}