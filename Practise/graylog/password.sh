#!/bin/bash

# Генеруємо зашифрований пароль для входу адміністратора Graylog
echo -n "Enter Password: "
read -s password
root_password_sha2=$(echo -n "$password" | sha256sum | cut -d" " -f1)

# Генеруємо пароль для password_secret
password_secret=$(< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c${1:-96})

# Оновлюємо файл конфігурації Graylog
sed -i "s/^password_secret =.*/password_secret = ${password_secret}/" /etc/graylog/server/server.conf
sed -i "s/^root_password_sha2 =.*/root_password_sha2 = ${root_password_sha2}/" /etc/graylog/server/server.conf

# Змінюємо http_bind_address
sed -i "s/^http_bind_address =.*/http_bind_address = 192.168.107.12:9000/" /etc/graylog/server/server.conf

# Повідомляємо користувача про згенеровані паролі та вказаний IP-адрес
echo "password_secret: ${password_secret}"
echo "root_password_sha2: ${root_password_sha2}"
echo "http_bind_address set to: 192.168.107.12:9000"
