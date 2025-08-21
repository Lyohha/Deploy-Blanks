#!/bin/bash
DEPLOY_USER="deployer"
DEPLOY_HOME="/home/$DEPLOY_USER"
SSH_DIR="$DEPLOY_HOME/.ssh"

sudo useradd -m -d "$DEPLOY_HOME" -s /bin/bash "$DEPLOY_USER"

sudo mkdir -p "$SSH_DIR"
sudo chown "$DEPLOY_USER":"$DEPLOY_USER" "$SSH_DIR"
sudo chmod 700 "$SSH_DIR"

sudo -u "$DEPLOY_USER" ssh-keygen -t rsa -b 4096 -N "" -f "$SSH_DIR/id_rsa"

sudo cp "$SSH_DIR/id_rsa.pub" "$SSH_DIR/authorized_keys"
sudo chmod 600 "$SSH_DIR/authorized_keys"
sudo chown "$DEPLOY_USER":"$DEPLOY_USER" "$SSH_DIR/authorized_keys"

echo "SSH_USER: $DEPLOY_USER"
echo "SSH_PRIVATE_KEY: "
cat "$SSH_DIR/id_rsa"

sudo usermod -aG docker "$DEPLOY_USER"
