#!/bin/bash

sudo yum install httpd -y 
echo "Hello world, this is Home work 3!" > /var/www/html/index.html
sudo systemctl enable httpd
sudo systemctl start httpd 
