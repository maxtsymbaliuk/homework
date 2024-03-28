#!/bin/bash

echo "====Update system===="
sudo apt update -y
sudo apt upgrade -y

echo "====Install dependencies===="
apt install apt-transport-https gnupg2 uuid-runtime pwgen curl dirmngr -y

echo "====Install Java JDK===="
apt install openjdk-11-jre-headless -y
java -version

echo "====Install and configure Elasticsearch===="
wget -qO- https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/oss-7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
apt update -y
apt install elasticsearch-oss -y

echo "===Change elastic.yml file===="
sed -i 's/^#cluster\.name: .*/cluster.name: "graylog"/' /etc/elasticsearch/elasticsearch.yml
if ! grep -q "action.auto_create_index: false" /etc/elasticsearch/elasticsearch.yml; then
    echo "action.auto_create_index: false" >> /etc/elasticsearch/elasticsearch.yml
fi

echo "====Start elastic search===="
systemctl daemon-reload
systemctl start elasticsearch
systemctl status elasticsearch
systemctl enable elasticsearch
