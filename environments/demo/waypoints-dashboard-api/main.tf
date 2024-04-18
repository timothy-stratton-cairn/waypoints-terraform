module "ec2_instance" {
  source = "../../../modules/ec2-instance"

  name          = "waypoints-dashboard-api-ec2-instance"
  allowed_cidrs = ["0.0.0.0/0"]
  trusted_cidrs = ["96.61.158.12/32"]

  public_access = true
  ssh_access    = true
  mysql_access  = false
  http_access   = true
  https_access  = false
  run_script    = false
  provisioned   = true

  remote_commands = [
    "sudo yum -y install git",
    "sudo dnf -y localinstall https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm",
    "sudo yum -y install maven"
  ]
}

output "ec2_instance_ip" {
  value = module.ec2_instance.ec2_instance_ip
}