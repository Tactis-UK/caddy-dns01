docker buildx build --platform linux/amd64,linux/arm64 \
--tag tactis/caddy-dns01:testing \
--push .
