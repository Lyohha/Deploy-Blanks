#!/bin/bash
docker compose run certbot renew
docker compose exec nginx nginx -s reload