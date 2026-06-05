docker buildx build --platform linux/amd64,linux/arm64 \
--tag tactis/caddy-dns01:2.11.4 \
--tag tactis/caddy-dns01:latest \
--push .
