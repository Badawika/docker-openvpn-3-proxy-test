FROM ubuntu:jammy

RUN apt update && apt install -y \
    gettext \
    nginx \
    openvpn \ 
    privoxy \
    curl \
    nano \
    runit
    useradd nginx
    

COPY app /app

ENV LOCAL_NETWORK= \
    OPENVPN_AUTO_CONFIG=true \
    OPENVPN_CONFIG_FILE=/config/config.ovpn \
    OPENVPN_HOST=localhost \
    OPENVPN_PASSWORD= \
    OPENVPN_PROXY_PORT=8080 \
    OPENVPN_TUNNEL_HOSTS= \
    OPENVPN_USERNAME=

CMD ["runsvdir", "/app"]
