FROM alpine:latest
MAINTAINER hare1039 hare39393@gmail.com

COPY ./3proxyinstall.sh /build/3proxyinstall.sh
COPY ./3proxy.cfg /3proxy.cfg
COPY ./supervisord.conf /etc/supervisor/supervisord.conf

RUN apk update && \
    apk add --no-cache openvpn socat supervisor make gcc musl-dev linux-headers && \
    chmod +x /build/3proxyinstall.sh && sh /build/3proxyinstall.sh && \
    apk del gcc musl-dev linux-headers

VOLUME ["/vpn"]
WORKDIR /vpn

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
