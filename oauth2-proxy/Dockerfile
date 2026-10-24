FROM quay.io/oauth2-proxy/oauth2-proxy:v7.6.0 as oauth

FROM alpine:3.22

RUN apk add --no-cache ca-certificates

COPY --from=oauth /bin/oauth2-proxy /bin/oauth2-proxy
COPY entrypoint.sh /entrypoint.sh
COPY error.html sign_in.html /data/custom-templates/

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
