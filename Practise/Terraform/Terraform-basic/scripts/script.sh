#!/bin/bash
yum install nano docker -y
systemctl enable docker
systemctl start docker
