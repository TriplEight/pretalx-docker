#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

echo "Creating directories"
rm -rf /etc/portainer/pretalx/traefik/configs || error "Failed to remove old traefik folder!"
mkdir -p /etc/portainer/pretalx/traefik/configs || error "Failed to create traefik folder!"

echo "Creating traefik config files"

cp config/traefik.yml /etc/portainer/pretalx/traefik/configs/traefik.yml || error "Failed to create traefik config!"
cp config/config.yml /etc/portainer/pretalx/traefik/configs/config.yml || error "Failed to create traefik config!"
cp config/nginx.conf /etc/portainer/pretalx/traefik/configs/nginx.conf || error "Failed to create nginx config!"
touch /etc/portainer/pretalx/traefik/cert/acme.json || error "Failed to create traefik certificate storage!"
chmod 600 /etc/portainer/pretalx/traefik/cert/acme.json

echo "Traefik configs are in place. Now"
echo "- edit /etc/portainer/pretalx/traefik/configs/traefik.yml and substitute variables manually"
echo "- edit /etc/portainer/pretalx/traefik/configs/config.yml and substitute variables manually"
echo "- edit /etc/portainer/pretalx/traefik/configs/nginx.conf and substitute variables manually"
echo "- add your certificates to /etc/portainer/pretalx/traefik/cert/acme.json"
