#!/bin/bash

apt-get update
      sudo apt install mysql-server -y
      curl -s https://api.github.com/repos/prometheus/mysqld_exporter/releases/latest   | grep browser_download_url   | grep linux-amd64 | cut -d '"' -f 4   | wget -qi -
      tar xvf mysqld_exporter*.tar.gz
      sudo rm mysqld_exporter-0.15.1.linux-amd64.tar.gz
      sudo mv  mysqld_exporter-*.linux-amd64/mysqld_exporter /usr/local/bin/
      sudo chmod +x /usr/local/bin/mysqld_exporter
      wget https://github.com/prometheus/mysqld_exporter/releases/download/v*/mysqld_exporter-*.linux-amd64.tar.gz
tar xvz mysqld_exporter*.tar.gz
sudo rm mysqld_exporter-0.15.1.linux-amd64.tar.gz

      wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz
tar xvf node_exporter*.tar.gz
sudo rm node_exporter-1.0.1.linux-amd64.tar.gz

PASS="devops228"
USER="maksymtsymbaliuk"
DB="Shop"

sudo systemctl start mysql

sudo mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE $DB;
CREATE USER '$USER'@'localhost' IDENTIFIED BY '$PASS';
GRANT ALL PRIVILEGES ON $DB.* TO '$USER'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo "User created"
echo "Username: $USER"
echo "Password: $PASS"