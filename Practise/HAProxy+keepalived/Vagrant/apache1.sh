#!/bin/bash

sudo apt-get update
sudo apt install apache2 -y
echo "<H1>Success! This is my FIRST Apache Server</H1>" | tee /var/www/html/index.html
