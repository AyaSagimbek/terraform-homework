data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}



resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.sn1.id
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id] 
  associate_public_ip_address = true
  user_data = file("apache-ubuntu.sh")

  tags = {
     Name = "ubuntu"
  }
}

data "aws_ami" "linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]
}



resource "aws_instance" "amazon" {
  ami           = data.aws_ami.linux.id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.sn2.id
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id] 
  associate_public_ip_address = true
  user_data = file("apache-aws.sh")

  tags = {
     Name = "linux"
  }
}
