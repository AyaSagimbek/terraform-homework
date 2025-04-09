resource "aws_instance" "web" {
  ami           = var.ec2.ami
  instance_type = var.ec2.type

  tags = local.common_tags
}
