ARG CADDY_VERSION=2.11.4

FROM dhi.io/golang:1.25-debian13-dev AS builder

RUN CGO_ENABLED=0 go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest

WORKDIR /build
RUN xcaddy build \
--with github.com/caddy-dns/cloudflare \
--with github.com/caddy-dns/azure

FROM dhi.io/caddy:${CADDY_VERSION} AS production
COPY --from=builder /build/caddy /usr/local/bin/caddy

# Set Caddy working directory for easy reload command
WORKDIR /etc/caddy

FROM dhi.io/caddy:${CADDY_VERSION} AS testing
COPY --from=builder /build/caddy /usr/local/bin/caddy

# Set Caddy working directory for easy reload command
WORKDIR /etc/caddy
