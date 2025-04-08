resource "aws_instance" "ubuntu" {
  ami           = "ami-075686beab831bb7f"
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


resource "aws_instance" "amazon" {
  ami           = "ami-087f352c165340ea1"
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
