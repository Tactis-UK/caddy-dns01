#!/bin/bash
docker exec -w /etc/caddy caddy caddy fmt /etc/caddy/Caddyfile --overwrite