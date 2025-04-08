#!/bin/bash

sudo apt update -y
sudo apt install apache2 -y
echo "Hello world, this is Home work 3!" > /var/www/html/index.html
sudo systemctl start apache2
sudo systemctl enable apache2