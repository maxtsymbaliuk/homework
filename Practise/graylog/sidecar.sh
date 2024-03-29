#!/bin/bash
wget https://packages.graylog2.org/repo/packages/graylog-sidecar-repository_1-5_all.deb
dpkg -i graylog-sidecar-repository_1-5_all.deb
apt-get update && sudo apt-get install graylog-sidecar            
graylog-sidecar -service install
systemctl enable graylog-sidecar
systemctl start graylog-sidecar
