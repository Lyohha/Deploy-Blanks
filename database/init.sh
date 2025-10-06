#!/bin/bash
wget -q https://raw.githubusercontent.com/Lyohha/Deploy-Blanks/refs/heads/main/database/docker-compose.yml -O ./docker-compose.yml
wget -q https://raw.githubusercontent.com/Lyohha/Deploy-Blanks/refs/heads/main/database/create.sh -O ./create.sh
chmod +x ./create.sh