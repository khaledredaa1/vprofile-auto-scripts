#!/bin/bash

# Update OS with the latest patches and install Python3
apt-get update -y
apt-get upgrade -y
apt-get install python3 -y   # Required for ansible

# Install Nginx
apt-get install -y nginx

# Configure Nginx for reverse proxy
cat <<EOF > /etc/nginx/sites-available/vproapp
upstream vproapp {
    server app01:8080;
}

server {
    listen 80;
    location / {
        proxy_pass http://vproapp;
    }
}
EOF

# Enable the configuration and restart Nginx
rm -f /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/vproapp /etc/nginx/sites-enabled/vproapp
systemctl restart nginx
