#!/bin/bash
echo "Date of renew: $(date)"
docker compose run --remove-orphans certbot renew 
docker compose exec nginx nginx -s reload