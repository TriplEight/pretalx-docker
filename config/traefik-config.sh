#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

echo "Creating directories"
mkdir -p /etc/portainer/pretalx/traefik/dynamic || error "Failed to create traefik folder!"
echo "Creating traefik config files"

# cp config/traefik.yml /etc/portainer/pretalx/traefik/traefik.yml || error "Failed to create traefik route config!"
# cp config/config.yml /etc/portainer/pretalx/traefik/config.yml || error "Failed to create traefik config!"
touch /etc/portainer/pretalx/traefik/acme.json || error "Failed to create traefik certificate storage!"
chmod 600 /etc/portainer/pretalx/traefik/acme.json

echo "Traefik configs are in place. Now add your certificates to /etc/portainer/pretalx/traefik/acme.json"
