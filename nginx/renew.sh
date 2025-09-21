#!/bin/bash
echo "Date of renew: $(date)"
docker compose -f PATH/docker-compose.yml run --remove-orphans certbot renew 
docker compose -f PATH/docker-compose.yml exec nginx nginx -s reload