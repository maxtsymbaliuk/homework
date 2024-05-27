#/bin/bash

sudo apt update
sudo apt install snapd
sudo snap install terraform --classic
terraform -help
