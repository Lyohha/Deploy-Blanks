#!/bin/bash

read -p "DB name: " DB_NAME
read -s -p "User password: " DB_PASS
echo

docker exec -i database-mysql81-1 mysql -u root -p<root_password_from_docker-compose.yml_without_spaces> <<EOF
CREATE DATABASE \`${DB_NAME}\`;
CREATE USER '${DB_NAME}'@'%' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_NAME}'@'%';
FLUSH PRIVILEGES;
EOF

echo "DB name: $DB_NAME"
echo "DB user: $DB_NAME"