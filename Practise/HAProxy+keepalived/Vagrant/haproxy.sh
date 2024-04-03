#!/bin/bash
sudo apt-get update
sudo apt install haproxy -y
systemctl start haproxy
systemctl enable haproxy
systemctl status haproxy
