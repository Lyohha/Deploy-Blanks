#!/bin/bash
DEPLOY_USER="apache"
DEPLOY_HOME="/home/$DEPLOY_USER"
SSH_DIR="$DEPLOY_HOME/.ssh"

sudo useradd -m -d "$DEPLOY_HOME" -s /bin/bash "$DEPLOY_USER"

wget -q https://raw.githubusercontent.com/Lyohha/Deploy-Blanks/refs/heads/main/apache/docker-compose.yml -O "$DEPLOY_HOME/docker-compose.yml"
wget -q https://raw.githubusercontent.com/Lyohha/Deploy-Blanks/refs/heads/main/apache/Dockerfile -O "$DEPLOY_HOME/Dockerfile"
wget -q https://raw.githubusercontent.com/Lyohha/Deploy-Blanks/refs/heads/main/apache/domains.py -O "$DEPLOY_HOME/domains.py"
apt-get install python3-docker
mkdir "$DEPLOY_HOME/config"
mkdir "$DEPLOY_HOME/config/php"
mkdir "$DEPLOY_HOME/config/apache"
mkdir "$DEPLOY_HOME/domains"

chown -R $DEPLOY_USER:$DEPLOY_USER $DEPLOY_HOME

passwd $DEPLOY_USER