#/bin/bash

sudo apt update

sudo useradd -M -r -s /bin/false pushgateway
wget https://github.com/prometheus/pushgateway/releases/download/v1.2.0/pushgateway-1.2.0.linux-amd64.tar.gz
tar xvfz pushgateway-1.2.0.linux-amd64.tar.gz
rm pushgateway-*.tar.gz
sudo cp pushgateway-1.2.0.linux-amd64/pushgateway /usr/local/bin/
sudo chown pushgateway:pushgateway /usr/local/bin/pushgateway

sudo bash -c 'cat <<EOF >> /etc/systemd/system/pushgateway.service

[Unit]
Description=Prometheus Pushgateway
Wants=network-online.target
After=network-online.target
[Service]
User=pushgateway
Group=pushgateway
Type=simple
ExecStart=/usr/local/bin/pushgateway
[Install]
WantedBy=multi-user.target
'
sudo systemctl start pushgateway
sudo systemctl enable pushgateway
sudo systemctl status pushgateway
