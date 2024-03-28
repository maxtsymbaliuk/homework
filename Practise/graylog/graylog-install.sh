#!/bin/bash

wget https://packages.graylog2.org/repo/packages/graylog-5.2-repository_latest.deb
sudo dpkg -i *.deb
sudo rm -rf *.deb
sudo apt-get update
sudo apt install graylog-server -y
systemctl daemon-reload
systemctl start graylog-server
systemctl status graylog-server
systemctl enable graylog-server
