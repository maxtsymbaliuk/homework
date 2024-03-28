#!/bin/bash

#!/bin/bash

# Встановлюємо Nginx
apt install nginx -y

# Створюємо файл віртуального хосту для Graylog
cat <<EOF > /etc/nginx/sites-available/graylog.conf
server {
    listen 80;
    server_name graylog.example.org;

    location / {
        proxy_set_header Host \$http_host;
        proxy_set_header X-Forwarded-Host \$host;
        proxy_set_header X-Forwarded-Server \$host;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Graylog-Server-URL http://\$server_name/;
        proxy_pass http://localhost:9000;
    }
}
EOF

# Перевіряємо синтаксис конфігурації Nginx
nginx -t

# Включаємо файл віртуального хосту
ln -s /etc/nginx/sites-available/graylog.conf /etc/nginx/sites-enabled/

# Видаляємо за замовчуванням файл віртуального хосту
rm -f /etc/nginx/sites-enabled/default

# Перезапускаємо Nginx
systemctl restart nginx

# Перевіряємо статус Nginx
systemctl status nginx

