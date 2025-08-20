# Usage nginx on VPS

## Install & start nginx with docker

### Auto

```bash
wget https://raw.githubusercontent.com/Lyohha/Deploy-Blanks/refs/heads/main/nginx/init.sh -O ./init.sh && chmod +x init.sh && ./init.sh 
```

### Manual

Create folder for nginx on server

Copy **docker-compose.yml** to created folder **config**

Run docker compose

```bash
docker compose up -d
```

## Add config for site 

Create config file for nginx in folder **config**. Config file extensions **.conf**

Add template in file config for http requests

```nginx
server {
    listen 80;
    server_name <site_url>;

    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    location / {
        proxy_pass http://<container_name>;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

Register SSL certificate for site

```bash
docker compose run --remove-orphans --rm certbot certonly --webroot --webroot-path /var/www/certbot/ --email <email> -d <site_url>
```

Add part in config for working with SSL certificate

```nginx
server {
    listen 443 ssl ;
    listen [::]:443 ssl;

        http2 on;

    server_name <site_url>;

    ssl_certificate /etc/nginx/ssl/live/<site_url>/fullchain.pem;
    ssl_certificate_key /etc/nginx/ssl/live/<site_url>/privkey.pem;

    location / {
        proxy_pass http://<container_name>;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```