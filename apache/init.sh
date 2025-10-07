wget -q https://raw.githubusercontent.com/Lyohha/Deploy-Blanks/refs/heads/main/apache/docker-compose.yml -O ./docker-compose.yml
wget -q https://raw.githubusercontent.com/Lyohha/Deploy-Blanks/refs/heads/main/apache/Dockerfile -O ./Dockerfile
wget -q https://raw.githubusercontent.com/Lyohha/Deploy-Blanks/refs/heads/main/apache/domains.py -O ./domains.py
apt-get install python3-docker
mkdir config
mkdir config/php
mkdir config/apache
mkdir domains
docker compose up -d