resource "aws_instance" "web" {
  count = 3
  ami           = "ami-0c3b809fcf2445b6a"
  instance_type = "t2.micro"
  # availability_zone = "us-east-2"
  subnet_id = [
    "subnet-052ee2937b0199869", # us-east-2a
    "subnet-03ae0090fc8f0ba2b", # us-east-2b
    "subnet-01c104c9023fda83c"  # us-east-2c
  ][count.index]
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id] 
  associate_public_ip_address = true
  user_data = file("apache.sh")

  tags = {
     Name = "web-${count.index + 1}"
  }
}
