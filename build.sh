set -eu

IMAGE="tactis/caddy-dns01"
VERSION="2.11.4"
TARGET="${1:-production}"

if [ "$TARGET" = "testing" ]; then
  docker buildx build --platform linux/amd64,linux/arm64 \
    --target testing \
    --tag "${IMAGE}:testing" \
    --push .
else
  docker buildx build --platform linux/amd64,linux/arm64 \
    --target production \
    --tag "${IMAGE}:${VERSION}" \
    --tag "${IMAGE}:latest" \
    --push .
fi