#!/bin/bash
wget -q https://raw.githubusercontent.com/Lyohha/Deploy-Blanks/refs/heads/main/nginx/docker-compose.yml -O ./docker-compose.yml
wget -q https://raw.githubusercontent.com/Lyohha/Deploy-Blanks/refs/heads/main/nginx/renew.sh -O ./renew.sh
chmod +x ./renew.sh
mkdir config
docker compose up -d