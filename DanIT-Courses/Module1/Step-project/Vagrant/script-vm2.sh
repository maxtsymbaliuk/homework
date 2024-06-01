#/bin/bash
  
apt-get update
    wget https://github.com/prometheus/prometheus/releases/download/v2.37.6/prometheus-2.37.6.linux-amd64.tar.gz
    tar xvfz prometheus-*.tar.gz
    rm prometheus-*.tar.gz
    sudo mkdir /etc/prometheus /var/lib/prometheus
    cd prometheus-2.37.6.linux-amd64
    sudo mv prometheus promtool /usr/local/bin/
    sudo mv prometheus.yml /etc/prometheus/prometheus.yml
    sudo mv consoles/ console_libraries/ /etc/prometheus/
    sudo useradd -rs /bin/false prometheus
    sudo chown -R prometheus: /etc/prometheus /var/lib/prometheus

    sudo apt-get install -y adduser libfontconfig1 musl
    wget https://dl.grafana.com/enterprise/release/grafana-enterprise_10.2.3_amd64.deb
    sudo dpkg -i grafana-enterprise_10.2.3_amd64.deb

    wget https://github.com/prometheus/alertmanager/releases/download/v0.26.0/alertmanager-0.26.0.linux-amd64.tar.gz
    tar xvzf alertmanager-0.26.0.linux-amd64.tar.gz
    sudo mv alertmanager-0.26.0.linux-amd64/alertmanager /usr/local/bin/
    sudo mkdir /etc/alertmanager/
    sudo mv alertmanager-0.26.0.linux-amd64/amtool /etc/alertmanager