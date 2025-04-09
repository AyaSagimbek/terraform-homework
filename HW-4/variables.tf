
variable vpc {       
  type = object({
    cidr_block = string
    dns_support = bool
    dns_hostnames = bool
  })
  
  default = {
  cidr_block = "10.0.0.0/16"
  dns_support = true
  dns_hostnames = true
  }
}

variable subnet {       
  type = list (object({
    cidr_block = string
    az = string
    public_ip = bool
    name = string
  }))
  
  default = [
   {
    cidr_block = "10.0.1.0/24"
    az = "us-west-2a"
    public_ip = true
    name = "public1"
  },
 {
    cidr_block = "10.0.2.0/24"
    az = "us-west-2b"
    public_ip = true
    name = "public2"
  },
{
    cidr_block = "10.0.3.0/24"
    az = "us-west-2c"
    public_ip = false
    name = "private1"
  },
{
    cidr_block = "10.0.4.0/24"
    az = "us-west-2d"
    public_ip = false
    name = "private2"
  }
  ]
}


variable "igw" {
  default = "hw4-igw"
  type    = string
}

variable "rt" {
  default = ["public", "private"]
  type    = list(string)
}


variable "port" {
  default = [22, 80, 443, 3306]
  type    = list(number)
}


variable "aws_key" {
  default = "hello-key"
  type    = string
}

variable "region" {
  default = "us-west-2"
  type    = string
}


variable "ec2" {
  type = map
  default = {
    ami = "ami-087f352c165340ea1"
    type = "t2.micro"
  }
}

